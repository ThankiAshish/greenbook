const express = require('express');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');
const multer = require('multer');
const { v4: uuidv4 } = require('uuid');
const path = require('path');
const User = require('../models/user.model');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'images');
    },
    filename: function(req, file, cb) {   
        cb(null, uuidv4() + '-' + Date.now() + path.extname(file.originalname));
    }
});

const fileFilter = (req, file, cb) => {
    const allowedFileTypes = ['image/jpeg', 'image/jpg', 'image/png'];
    if(allowedFileTypes.includes(file.mimetype)) {
        cb(null, true);
    } else {
        cb(null, false);
    }
}

let upload = multer({ storage, fileFilter });

authRouter.post('/api/register', upload.single('photo'), async (req, res) => {
    console.log(req.body);
    console.log(req.file);
    
    try {
        const { name, username, email, password } = req.body;
        const photo = req.file.filename;
        
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
            profilePicture: photo
        });

        user = await user.save();
        res.status(200).json(user);
    } catch(err) {
        console.log(err.message);
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