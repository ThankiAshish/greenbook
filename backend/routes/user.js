const express = require('express');
const userRouter = express.Router();
const User = require('../models/user.model');
const mongoose = require('mongoose');

userRouter.post('/api/user/fetch/all', async (req, res) => {
    try {
        const { email } = req.body;
        const result = 
            await User.find({ email: {$ne: email}})
            .select("_id name email username profilePicture");
        
        if(result.length > 0) {
            return res.status(200).json(result);
        } else {
            return res.status(404).json({
                error: "No Users Found"
            });
        }
    } catch(err) {
        res.status(500).json({
            error: err.message
        });
    }
});

userRouter.post('/api/user/fetch/latest', async (req, res) => {
    try {
        const { email } = req.body;
        const result =
            await User.find({ email: {$ne: email} }).sort({_id: -1 }).limit(10)
            .select("_id name email username profilePicture");
        res.status(200).json(result);
    } catch(err) {
        res.status(500).json({
            error: err.message
        });
    }
});

userRouter.post('/api/user/search', async (req, res) => {
    try {
        const pattern = new RegExp("^" + req.body.searchQuery);
    
        const result = 
            await User.find({name: {$regex: pattern}})
            .select("_id name email username profilePicture");
            
        res.status(200).json(result);
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

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