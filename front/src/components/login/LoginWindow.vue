<template>
  <div class="login-window">
    <p v-show="message">{{message}}</p>
    <van-field v-model="account.userName" label="用户"  placeholder="请输入用户名" />
    <van-field v-model="account.password" type="password" label="密码"   placeholder="请输入密码" />
    <div class="btn-option">
      <van-button plain hairline type="primary" @click="login">登录</van-button>
      <van-button plain hairline type="primary" @click="register">注册</van-button>
    </div>
  </div>
</template>

<script>
import { getAccountPassword } from '@/api'

export default {
  name: 'LoginWindow',
  data() {
    return {
      account: {
        userName: '',
        password: ''
      },
      message: ''
    }
  },
  methods: {
    register() {
      this.$router.push({name: 'Register'})
    },
    async login() {
      let userId = await this.getAccountPassword()
      if(userId) {
        this.$router.push({name: 'Home'})
      } else {
        this.message = '错误'
      }
    },
    async getAccountPassword() {
      let res = await getAccountPassword(this.account)
      console.log(res)
      if(res.code === 200) {
        return res.result
      } else {
        console.log("服务器异常")
      }
    }
  },
}
</script>

<style lang="scss" scoped>
  .login-window {
    width: 100%;
    height: 100%;
    // border: 1px solid white;
    text-align: center;
    .van-field {
      margin-bottom: 15px;
      .van-field__label {
        width: 3.2em;
      }
    }
    .btn-option {
      .van-button {
        display: inline-block;
        width: 132px;
        margin-right: 20px;
        &:last-child {
          margin-right: 0;
        }
      }
    }
  }
</style>