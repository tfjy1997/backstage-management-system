const LogSql = {
  insert: 'INSERT INTO log(id, system_id, account_id, log_type, operation_type, data_table_name, content) ' + 
          'VALUES (?, ?, ?, ?, ?, ?, ?)',
  query: 'SELECT * FROM log',
  getUserById: 'SELECT * FROM log WHERE id = ?',
  delete: 'DELETE log where id = ?'
}

module.exports = LogSql