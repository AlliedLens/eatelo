const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    username: {type: String, required: true},
    email: {type: String, required: true},
    selectedDietaryPreference: {type:String},
    selectedPreferences: [String],
    rankings: {
        type: Map,
        of: Number,
    }
});

module.exports = mongoose.model('User', userSchema);