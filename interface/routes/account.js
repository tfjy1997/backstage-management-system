const express = require('express')
const bodyParser = require('body-parser')
const accountController = require('../src/account')
const responce = require('./responce')
const router = express.Router()

// http://localhost:3000/api/account/getAccountPassword
router.get('/getAccountPassword', (req, res) => {
  // res.send("显示用户密码")
  try {
    console.log(req.query)
    accountController.getUserPassword(req.query, (err, results) => {
      if(err) {
        responce.result500(res)
      }
      responce.result200(res, results)
    })
  } catch (err) {
    responce.result500(res)
  }
}) 

module.exports = router;