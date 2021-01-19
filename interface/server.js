const express = require('express');
const api = express();

const router = require('./routes/routes.js')

api.use('/api', router) // http://localhost:3000/api

const server = api.listen( 3000,'localhost', function() {
  const host = server.address().address;
  const port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
})