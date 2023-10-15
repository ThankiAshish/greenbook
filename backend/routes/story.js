const express = require('express');
const storyRouter = express.Router();
const multer = require('multer');
const { v4: uuidv4 } = require('uuid');
const path = require('path');
const Story = require('../models/story.model');

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

storyRouter.post('/api/story/store', upload.single('photo'), async (req, res) => {
    console.log(req.body);
    console.log(req.file);
    
    try {
        const { title, body, userId } = req.body;
        const photo = req.file.filename;
        

        const existingStory = await Story.findOne({ userId });
        if(existingStory) {
            return res.status(400).json({
                message: "Story Already Exists"
            });
        }

        let story = new Story({
            title,
            body,
            userId,
            bannerPicture: photo
        });

        story = await story.save();
        res.status(200).json(story);
    } catch(err) {
        console.log(err.message);
        res.status(500).json({
            error: err.message
        });
    }
});

storyRouter.put('/api/story/like', async (req, res) => {
    try {
        const { id, userId } = req.body;
        await Story.findByIdAndUpdate({ userId: id}, {
            $push: { likes: userId }
        }, {
            new: true
        }).exec((err, result) => {
            if(err) {
                res.status(422).json({
                    error: err.message
                });
            } else {
                res.status(200).json(result);
            }
        });
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

storyRouter.put('/api/story/unlike', async (req, res) => {
    try {
        const { id, userId } = req.body;
        await Story.findByIdAndUpdate({ userId: id}, {
            $pull: { likes: userId }
        }, {
            new: true
        }).exec((err, result) => {
            if(err) {
                res.status(422).json({
                    error: err.message
                });
            } else {
                res.status(200).json(result);
            }
        });
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

storyRouter.get('/api/story/fetch', async (req, res) => {
    try {
        const { id } = req.query;
        const story = await Story.findOne({ userId: id });
        res.status(200).json(story);
    } catch (err) {
        res.status(500).json({
            error: err.message
        });
    }
});

module.exports = storyRouter;