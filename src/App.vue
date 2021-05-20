<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'

import {login} from "@/api";

export default {
  name: 'App',
  components: {
    // HelloWorld
  },
  mounted() {
    this.handleLogin();
  },
  methods:{
    async handleLogin(){
      const{$store} = this;
      try {
        const user = await login({ email: 'robert@op.pl' , password: 'student' })
        await $store.dispatch('auth/saveUserDetails', user[0]);
      }
      catch (e) {
        console.log(e)
      }
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
