let resultObj = {
  code: '',
  message: '',
  result: ''
}

const result200 = (responce, result) => {
  resultObj.code = 200,
  resultObj.message = ''
  resultObj.result = result
  responce.json(resultObj)
}

const result500 = (responce) => {
  resultObj.code = 500,
  resultObj.message = 'Server Error'
  resultObj.result = null
  responce.json(resultObj)
}

exports.result200 = result200
exports.result500 = result500

