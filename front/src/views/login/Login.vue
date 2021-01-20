<template>
  <div class="login">
    <div class="top"></div>
    <div class="content">
      <login-window class="login-window"></login-window>
    </div>
    <div class="down"></div>
  </div>
</template>

<script>
import LoginWindow from '@/components/login/LoginWindow.vue'
export default {
  name: "Login",
  components: {
    LoginWindow
  }
};
</script>

<style lang="scss" scoped>
.login {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  background-color: cornflowerblue;

  .top {
    height: $TopHeight;
    width: 100%;
    background-color: darkblue;
  }
  .content {
    width: 100%;
    text-align: center;
    min-height: 500px;
    .login-window {
      margin: auto;
      margin-top: 10%;
      width: 285px;
      height: 100px
    }
  }
  .down {
    height: $DownHeight;
    width: 100%;
    background-color: darkblue;
    position: absolute;
    bottom: 0;
  }
}
</style>