

const express = require('express')
const bodyParser = require('body-parser')
const userController = require('../src/user')
const responce = require('./responce')
const router = express.Router()


router.use(bodyParser.urlencoded({extended: true})) // 解析 www-form-urlencoded 格式数据



// http://localhost:3000/api/user
router.get('/', (req, res) => {
  // res.send("显示用户信息")
  userData = userController.testUser((err, results) => {
    if(err) {
      responce.result500(res)
    }
    responce.result200(res, results)

  })
}) 

// http://localhost:3000/api/user/add
router.post('/add', (req, res) => {
  // res.send("录入用户信息")
  data = userController.addUser(req.body)
  console.log(data)

  res.json(data)
}) 

module.exports = router;