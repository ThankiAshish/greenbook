const mongoose = require('mongoose');

const MongoDBLocalURI = "mongodb://127.0.0.1:27017/greenbook"; 

const connection = mongoose.createConnection(MongoDBLocalURI)
    .on('open', () => {
        console.log("MongoDB Connected");
    })
    .on('error', () => {
        console.log("MongoDB Connection Failed");
    });

module.exports = connection;