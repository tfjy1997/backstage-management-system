const accountSql = {
  query: 'SELECT * FROM account',
  getAccont: 'SELECT id FROM account WHERE name = ? and password = ?',
}

module.exports = accountSql