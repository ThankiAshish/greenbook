const express = require('express');
const userRouter = express.Router();
const User = require('../models/user.model');
const mongoose = require('mongoose');
const bcryptjs = require('bcryptjs');
const multer = require('multer');
const { v4: uuidv4 } = require('uuid');
const path = require('path');

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

userRouter.get('/api/user/fetch/:id', async (req, res) => {
    try {
      const userId = req.params.id;
  
      const user = await User.findOne({ _id: userId })
        .select("_id name email username profilePicture followers following");
  
      if (user) {
        return res.status(200).json(user);
      } else {
        return res.status(404).json({
          error: "User not found"
        });
      }
    } catch (err) {
      res.status(500).json({
        error: err.message
      });
    }
});

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

userRouter.put('/api/user/profile/edit', upload.single('photo'), async (req, res) => {
    try {
        const { id, name } = req.body;
        const photo = req.file.filename;

        const updatedUser = await User.findByIdAndUpdate(
            id,
            {name: name, profilePicture: photo},
            {new: true}
        );

        if(!updatedUser) {
            return res.status(404).json({ 
                message: 'User not found' 
            });
        }

        return res.status(200).json(updatedUser);
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

userRouter.put('/api/user/account/edit', async (req, res) => {
    try {
        const { id, email, username } = req.body

        const user = await User.findById(id);

        if(!user) {
            return res.status(404).json({ 
                message: 'User not found' 
            });
        }

        const existingUsername = await User.findOne({ username: username });

        if (existingUsername && existingUsername._id.toString() !== id) {
            return res.status(400).json({ 
                message: 'Username already in use' 
            });
        }

        const existingEmail = await User.findOne({ email: email });

        if (existingEmail && existingEmail._id.toString() !== id) {
            return res.status(400).json({ 
                message: 'Email already in use' 
            });
        }

        user.email = email;
        user.username = username;

        await user.save();

        return res.status(200).json({ 
            message: 'User information updated successfully' 
        });
    } catch(err) {
        res.status(500).json({
            error: err.message
        });
    }
});

userRouter.put('/api/user/account/changePassword', async (req, res) => {
    try {
        const { id, oldPass, newPass } = req.body

        const user = await User.findOne({_id: id});
        if(!user) {
            return res.status(404).json({ 
                message: 'User not found' 
            });
        }

        const isMatch = await bcryptjs.compare(oldPass, user.password);
        if(!isMatch) {
            return res.status(400).json({
                message: "invalid credentials"
            });
        }

        const hashedPassword = await bcryptjs.hash(newPass, 12);
        user.password = hashedPassword;

        await user.save();

        return res.status(200).json({
            message: "Password Updated Successfully!"
        });
    } catch(err) {
        res.status(500).json({
            error: err.message
        });
    }
});

module.exports = userRouter;