const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
const socketIO = require('socket.io');


// Import routes
const authRouter = require('./routes/auth');

const app = express();
const http = require('http');
const server = http.createServer(app)
const io =socketIO(server)

app.use(bodyParser.json())
app.use(cors());

// MongoDB Connection 
try{
  mongoose.connect('mongodb+srv://women:women@cluster0.zimpg2o.mongodb.net/?retryWrites=true&w=majority',).then(console.log("Database connected"));

}catch(error){console.log(error);}

// Routes
app.use('/auth', authRouter);  // Use authRoutes for /auth endpoints

const PORT =  3000;

//socket connection 

io.on('connection', (socket) => {
  console.log('Device connected:', socket.id);

  // Handle disconnect
  socket.on('disconnect', () => {
    console.log('Device disconnected:', socket.id);
  });

  // Handle incoming messages
  socket.on('message', (data) => {
    console.log('Received message:', data);
    
    // Broadcast the received message to all connected clients except the sender
    io.emit('message-receive', data);
  });
});
 

server.listen(PORT, '0.0.0.0',() => {
  console.log(`Server is running on port ${PORT}`);
});
