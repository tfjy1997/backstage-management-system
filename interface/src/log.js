const logSql = require('../mysql/sql/logSql')
const db = require('../mysql/index')

let logParam = {
  id: '',
  systemId: '',
  accountId: '',
  logType: '',
  operationType: '',
  dataTableName: '',
  content: ''
}

/**
 * @method 日志表添加【新增】操作
 * @param { Object } logObj 日志对象
 * { 
 *   systemId  系统Id
 *   userId    用户Id 
 *   typeName  操作状态
 *   tableName 操作表
 *   content   内容
 * }
 */
const insertAdd = ( logObj ) => {
  logParam = {
    id: ''
  }
  db.query(logSql.id, [], (err, rows) => {
    results = rows;
    console.log("results: " + results);
    callback(err, results)
  });
}