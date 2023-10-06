const express = require('express');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');
const User = require('../models/user.model');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');

authRouter.post('/api/register', async (req, res) => {
    try {
        const { name, username, email, password, profilePicture } = req.body;
        const existingUser = await User.findOne({ email });
        if(existingUser) {
            return res.status(400).json({
                message: "User Already Exists"
            });
        }

        const hashedPassword = await bcryptjs.hash(password, 12);
        let user = new User({
            name,
            username,
            email,
            password: hashedPassword,
            profilePicture
        });

        user = await user.save();
        res.json(user);
    } catch(err) {
        res.status(500).json({
            error: err.message
        });
    }
});

authRouter.post('/api/login', async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if(!user) {
            return res.status(400).json({
                message: "could not find user with these credentials"
            });
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if(!isMatch) {
            return res.status(400).json({
                message: "could not find user with these credentials"
            });
        }

        const token = jwt.sign({ id: user._id }, "secretKey");
        res.json({
            token,
            ...user._doc
        });
    } catch (error) {
        res.status(500).json({
            error: error.message
        })
    }
});

authRouter.post('/tokenValdiation', async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if(!token) {
            return res.json(false);
        }

        const verified = jwt.verify(token, "secretKey");
        if(!verified) {
            return res.json(false);
        }

        const user = User.findById(verified.id);
        if(!user) {
            return res.json(false);
        }

        res.json(true);
    } catch (error) {
        res.status(500).json({
            error: error.message
        });
    }
});

authRouter.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;