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
    orderId: {
        type: String,
        required: true
    },
    paymentId: {
        type: String,
        required: true
    },
    signature: {
        type: String,
        required: true
    }
});

const DonationModel = db.model("donation", DonationSchema);

module.exports = DonationModel;