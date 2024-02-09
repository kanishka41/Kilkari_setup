const express = require('express');
const bodyParser = require('body-parser');
// const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

const authRouter = express.Router();

authRouter.use(bodyParser.json());


// Registration route
authRouter.post('/register', async (req, res) => {
  try {
    const {email, password} = req.body;

    // Check if the username is already taken
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: 'Username already taken' });
    }


    // Create a new user with additional information
    const newUser = new User({
      email,
      password,
    
    });

    // Save the new user to the database
    await newUser.save();


    res.status(201).json({ message: 'Registration successful' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});


// Authentication route
authRouter.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    console.log(req.body.email);

    // Find the user by username
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: 'email not found' });
    }

    // Compare the provided password with the stored hashed password
    if (password != user.password) {
      return res.status(401).json({ message: 'Invalid username or password' });
    }

    if (user){
      console.log("done");
      return res.status(200).json({message:"user found"})
    }

    // Generate a JWT token for authentication
    const token = jwt.sign({ email: user.email }, config.secretKey, { expiresIn: '1h' });

    // Return user details along with the token
    res.json({
      token,
      user: {email: user.email, },// Add other user details as needed
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = authRouter;
