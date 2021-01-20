import http from "./config"
let { fetchGet, fetchPost } = http

export const getAccountPassword = params => fetchGet("/api/account/getAccountPassword", params)
