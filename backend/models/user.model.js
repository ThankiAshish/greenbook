const mongoose = require("mongoose");
const db = require("../config/db");

const { Schema } = mongoose;

const UserSchema = new Schema({
    name: { 
        type: String,
        trim: true, 
        required: true,
    },
    username: { 
        type: String, 
        unique: true, 
        trim: true,
        required: true 
    },
    email: { 
        type: String, 
        unique: true, 
        trim: true,
        required: true,
        validate: {
            validator: (value) => {
                const emailValidationRegex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(emailValidationRegex);
            },
            message: "please enter a valid email address"
        } 
    },
    password: { 
        type: String, 
        required: true 
    },
    profilePicture: { 
        type: String,
        trim: true,
    },
    points: {
        type: Number,
        default: 0
    },
    followers: [
        {
            type: String,
            ref: 'User'
        }
    ],
    following: [
        {
            type: String,
            ref: 'User'
        }
    ]
});

const UserModel = db.model("user", UserSchema);

module.exports = UserModel;
