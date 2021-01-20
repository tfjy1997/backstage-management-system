const accountSql = require('../mysql/sql/accountSql')
const db = require('../mysql/index')

// 获取用户密码
const getUserPassword = (user, callback) => {
  let results
    db.query(accountSql.getAccont, [user.userName, user.password], (err, rows) => {
      if(rows.length > 0) {
        results = rows.shift().id;
      } else {
        results = null
      }
      console.log("results: " + results);
      callback(err, results)
    });
}
exports.getUserPassword = getUserPassword