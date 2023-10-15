const mongoose = require("mongoose");
const db = require("../config/db");

const { Schema } = mongoose;

const StorySchema = new Schema({
    title: { 
        type: String,
        trim: true, 
        required: true,
    },
    body: { 
        type: String, 
        unique: true, 
        trim: true,
        required: true 
    },
    bannerPicture: { 
        type: String,
        trim: true,
        required: true
    },
    likes: [
        {
            type: mongoose.Types.ObjectId,
            ref: 'User'
        }
    ],
    userId: {
        type: String,
        unique: true,
        required: true
    }
});

const StoryModel = db.model("story", StorySchema);

module.exports = StoryModel;
