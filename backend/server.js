const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

require('dotenv').config();

const userRoutes = require('./routes/userRoutes');
const testRoutes = require('./routes/testRoutes');

const app = express();
const PORT = process.env.PORT;

app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGODB_URI, {
}).then(()=> console.log("mongodb connected")
).catch(err=>console.error(err));

app.use('/users', userRoutes);
app.use('/test', testRoutes);

app.listen(PORT, ()=>console.log(`server running on port ${PORT}`));
