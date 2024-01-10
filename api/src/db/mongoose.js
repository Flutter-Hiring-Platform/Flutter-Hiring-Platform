const mongoose = require('mongoose');

mongoose.connect('mongodb+srv://alexkhoury:flutter@flutter.pl8tggv.mongodb.net/',{}
).then(() => {
    console.log('Connected to MongoDB');
}).catch((err) => {
    console.log('Error connecting to MongoDB', err);
});