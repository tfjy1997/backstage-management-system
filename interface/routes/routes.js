const express = require('express')
const router = express.Router();

const user = require('./user.js')

router.use('/user', user) // http://localhost:3001/api/user

module.exports = router;