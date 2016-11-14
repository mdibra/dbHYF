var express = require('express')
var bodyParser = require('body-parser')
var fs = require('fs')
var mysql = require('mysql')
var usersAPI = require('./APIs/usersAPI').usersAPI

// Create a new application.
var app = express()

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'yonas',
  database: 'dbhyf'
})

connection.connect(function (err) {
  if (!err) {
    console.log('Database is connected ...')
  } else {
    console.log('Error connecting database ...')
  }
})
// Use body parser middleware.
app.use(bodyParser.json())

// Get all users
app.get('/', function (request, response) {
  usersAPI.getUsers(connection, function (data, err) {
    if (err) {
      response.send('Error in getting users')
    } else {
      response.send(data)
    }
  })

// response.sendFile('./index.html', {root: __dirname})
})

// Get one user profile
app.get('/user/:id', function (request, response) {
  var id = request.params.id

  usersAPI.getUser(connection, id, function (data, err) {
    if (err) {
      response.send('Error in getting one user')
    }else {
      response.send(data)
      response.end()
    }
  })
})

// Insert a user
app.post('/user', function (request, response) {
  var user = request.body
  if (user.text == null || user.text == '') {
    sendError(response, 400, 'No text specified')
  } else {
    // Insert it using the usersAPI insertUser function
    usersAPI.insertUser(connection, user.text, function (rows) {
      console.log(user.text, 'Successfuly Added.')
    })
  }
})

// Delete a user
app.delete('/user/:id', function (request, response) {
  var id = request.params.id

  // Delete it using the usersAPI deleteuser function
  usersAPI.deleteUser(connection, id, function (data, err) {
    if (err) {
      response.send('Error in deleting one user')
    }else {
      response.send('Successfully deleted user # ' + id)
      // console.log()
      response.end()
    }
  })
})

// Delete all users
app.delete('/users', function (request, response) {
  // Delete it using the usersAPI deleteUsers function
  usersAPI.deleteUsers(connection, function (data, err) {
    if (err) {
      response.send('Error in deleting all users')
    }else {
      response.send('Successfully deleted all users')
      console.log('Deleted all users.')
      response.end()
    }
  })
  response.status(204).send()
})

// Update a user
app.put('/user/:id', function (request, response) {
  var id = request.params.id

  // Update it using the usersAPI updateUser function
  usersAPI.updateUser(connection, id, function (data, err) {
    if (err) {
      response.send('Error in updating one user')
    }else {
      response.send('Successfully updated user # ' + id)
      // console.log()
      response.end()
    }
  })
})

function sendError (response, code, message) {
  response.statusCode = code
  response.json({
    error: message
  })
  response.end()
}

// Start the server.
app.listen(3000)
console.log('Listening to port 3000')
