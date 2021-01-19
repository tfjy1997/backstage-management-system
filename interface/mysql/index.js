const mysql = require('mysql')
const $dbConfig = require('./config')

const pool = mysql.createPool($dbConfig)

const query = (sql, values, callback) => {
  pool.getConnection( (err, connection) => {
    if(err) throw err;
    console.log('get connection')
    connection.query(sql, values, (err, results, fields) => {
      console.log(JSON.stringify(results))

      callback(err, results);
      // 只是释放链接，存放于在缓存池，没有被销毁
      connection.release()
      if(err) throw error
    })
  })
}

exports.query = query