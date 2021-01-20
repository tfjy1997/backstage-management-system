module.exports = {
  css: {
    loaderOptions: {
      sass: {
        additionalData: `
          @import "@/assets/style/index.scss";
          
        `
      }
    }
  },
  devServer: {
    port: 1516,     // 端口号
    proxy: {
      '/api': {    
          target: 'http://127.0.0.1:3000',
          changeOrigin: true,  //是否跨域
          pathRewrite: {
              '^/api': ''   //需要rewrite的,
          }              
      },
    },
  }
};