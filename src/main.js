import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
// 앱을 시작하기 위해서는 npm run tauri:serve
// https://github.com/tauri-apps/vue-cli-plugin-tauri