const express = require('express')
const router = express.Router();

const user = require('./user.js')
const account_router = require('./account')

router.use('/user', user) // http://localhost:3001/api/user
router.use('/account', account_router) // http://localhost:3001/api/account

module.exports = router;