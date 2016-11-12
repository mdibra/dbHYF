var usersAPI = {
  getUsers: function (connection, callback) {
    connection.query('select * from tableusers', function (err, rows, fields) {
      if (!err) {
        callback(rows)
        console.log(rows)
      } else {
        console.log(err)
        console.log('Error in getUsers function')
        callback(null)
      }
    })
  },

  getUser: function (connection, id, callback) {
    connection.query('select * from tableusers where (userId=' + parseInt(id) + ')', function (err, rows, fields) {
      if (!err) {
        callback(rows)
        console.log(rows)
      } else {
        console.log(err)
        console.log('Error in getUsers function')
        callback(null)
      }
    })
  },

  updateUser: function (connection, id, callback) {
    connection.query('update tableusers set userlastName="updatedUser" where (userId=' + parseInt(id) + ')', function (err, rows, fields) {
      if (!err) {
        callback(rows)
        console.log(rows)
      } else {
        console.log(err)
        console.log('Error in update User function')
        callback(null)
      }
    })
  },

  insertUser: function (connection, newUser, callback) {
    connection.query("INSERT INTO tableusers(userFirstName, userLastName, \
      userAddress, userRegisterDate, userEmail, userMobile, userActive,\
       userRole, userClass, userPassword) VALUES ('Yonas', 'BW', 'Rot', \
       '2016/11/09', 'yoni11er@gmail.com', '0682379012', '1', 'Student', '4', '123'"
      , function (err, rows, fields) {
        if (!err) {
          console.log(newUser)
          callback(rows)
        } else {
          console.warn(err, 'Error in insertUser')
          callback(null)
        }
      })
  },

  deleteUser: function (connection, id, callback) {
    console.log(id)
    connection.query('DELETE from tableusers where (userId=' + parseInt(id) + ')', function (err, rows, fields) {
      if (!err) {
        callback(rows)
      } else {
        console.warn(err, 'Error in deleting one User')
        callback(null)
      }
    })
  },

  deleteUsers: function (connection, callback) {
    connection.query('DELETE from tableusers', function (err, rows, fields) {
      if (!err) {
        callback(rows)
      } else {
        console.warn('Error in deleteUsers')
        callback(null)
      }
    })
  }

}

module.exports.usersAPI = usersAPI
