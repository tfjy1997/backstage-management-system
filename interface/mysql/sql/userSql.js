const UserSql = {
  insert: 'INSERT INTO User(id, gender, name, birth_date, education_background, account_id) VALUES (?, ?, ?, ?, ?, ?)',
  query: 'SELECT * FROM user',
  getUserById: 'SELECT * FROM user WHERE id = ?',
  delete: 'DELETE user where id = ?'
}

module.exports = UserSql