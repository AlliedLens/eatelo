const express = require('express');

const router = express.Router();

router.get('/helloworld', async (req, res) => {
    try{
        res.status(200).json({message: "Hello World"});
    }catch (err){
        res.status(400).json({error: err.message});
    }
});

module.exports = router;