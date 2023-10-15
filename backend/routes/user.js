const express = require('express');
const userRouter = express.Router();
const User = require('../models/user.model');
const mongoose = require('mongoose');

userRouter.put('/api/user/follow', async (req, res) => {
    try {
        const { loggedInUserId, toFollowId } = req.body;

        let doc = await User.findOne({ _id: loggedInUserId });
        doc.following.push(toFollowId);
 
        await doc.save();

        doc = undefined;
        doc = await User.findOne({ _id: toFollowId });
        doc.followers.push(loggedInUserId);
        
        const response = await doc.save();
        res.status(200).json(response);
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

userRouter.put('/api/user/unfollow', async (req, res) => {
    try {
        const { loggedInUserId, toFollowId } = req.body;

        let doc = await User.findOne({ _id: loggedInUserId });
        doc.following.pull(toFollowId);
 
        await doc.save();

        doc = undefined;
        doc = await User.findOne({ _id: toFollowId });
        doc.followers.pull(loggedInUserId);
        
        const response = await doc.save();
        res.status(200).json(response);
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

module.exports = userRouter;