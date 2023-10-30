const express = require('express');
const donateRouter = express.Router();
const Razorpay = require('razorpay');
const DonationModel = require('../models/donation.model');
const crypto = require('crypto');

const razorpayInstance = new Razorpay({ 
    key_id: "rzp_test_HrNbqjmet7vmou", 
    key_secret: "GCgld85SDhLWtDT9xFctnUNJ" 
});

donateRouter.post('/api/donate/createOrder', (req, res) => {
    const { amount, currency } = req.body;

    razorpayInstance.orders.create(
        {
            amount,
            currency,
        }, 
        (err, order) => {
            if(!err) {
                res.status(200).json(order);
            } else {
                res.status(500).json({
                   error: err 
                });
            }
        }
    );
}); 


donateRouter.post('/api/donate/verifyOrder',  async (req, res) => {  
    const {fromUser, toUser, orderId, rzOrderId, paymentId, signature} = req.body;      
    // const razorpay_signature =  req.headers['x-razorpay-signature']; 
  
    const key_secret = "GCgld85SDhLWtDT9xFctnUNJ";      
    
    let hmac = crypto.createHmac('sha256', key_secret);  
  
    hmac.update(orderId + "|" + paymentId); 
      
    const generated_signature = hmac.digest('hex'); 
      
    console.log(signature + "---" + generated_signature);
    if(signature===generated_signature){ 
        let donation = new DonationModel({
            fromUser: fromUser,
            toUser: toUser,
            orderId: rzOrderId,
            paymentId: paymentId,
            signature: signature
        });

        donation = await donation.save();

        res.status(200).json({
            message:"Payment has been verified"
        }); 
    } 
    else {
        res.status(500).json({
            message:"Payment verification failed"
        }); 
    }
});

module.exports = donateRouter;