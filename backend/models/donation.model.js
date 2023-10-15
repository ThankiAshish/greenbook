const mongoose = require("mongoose");
const db = require("../config/db");

const { Schema } = mongoose;

const DonationSchema = new Schema({
    fromUser: {
        type: String,
        required: true
    },
    toUser: {
        type: String,
        required: true
    },
    amount: {
        type: Number,
        required: true
    },
    note: {
        type: String
    }
});

const DonationModel = db.model("donation", DonationSchema);

module.exports = DonationModel;