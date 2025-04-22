const express = require('express');
const router = express.Router();
const User = require('../models/User');

router.post('/register', async (req, res) => {
    try{
        const user = new User(req.body);
        const saved = await user.save();
        res.status(200).json(saved);
    }catch(err){
        res.status(400).json({error: err.message});
    }
})

router.get('/get', async (req, res) => {
    const users = await User.find();
    res.json(users);    
});

module.exports = router;