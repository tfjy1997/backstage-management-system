import axios from 'axios'

const axios_api = axios.create()
const dataApiPrefix = process.env.VUE_APP_API_HOST

axios_api.interceptors.response.use(res => {
  return res.data
}, err => {
  return Promise.resolve("fail")
})

const fetchGet = (url, params = {}) => {
  return axios_api.get(dataApiPrefix + url, { params })
}
const fetchPost = (url, data = {}) => {
  return axios_api.post(dataApiPrefix + url, data)
}

export default {
  fetchGet,
  fetchPost,
}