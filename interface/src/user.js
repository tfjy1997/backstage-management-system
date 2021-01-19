const userSql = require('../mysql/sql/userSql')
const db = require('../mysql/index')

// 获取用户信息
const getUserInfo = () => {
  let userInfo = {
    'name': 'user_get',
    'age': 23
  }
  return userInfo
}

// 添加用户信息
const addUser = (user) => {
  console.log('add')
  let userInfo = {
    'name': user.name,
    'age': user.age
  }
  return userInfo
}

// 添加用户信息
const testUser = (callback) => {
  let results
  db.query(userSql.query, [], (err, rows) => {
    results = rows;
    console.log("results: " + results);
    callback(err, results)
  });
}



exports.addUser = addUser
exports.getUserInfo = getUserInfo
exports.testUser = testUser