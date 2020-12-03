<template>
  <div>
    <form class="register-form">
      <label>Podaj email:
        <input v-model="email" @input="mailValidation" type="email">
        {{ errorEmail }}
      </label>
      <label>Twoje hasło:
        <input v-model="password" @input="passwordValidation" type="password">
        {{ errorPassword }}
      </label>
      <button type="button" @click="handleLogin" v-on:keyup.enter="handleLogin" >Zaloguj</button>
    </form>
  </div>
</template>

<script>
import {login} from "@/api";

export default {
  name: 'Login',
  props: {},
  data() {
    return {
      email: null,
      password: null,
      errorEmail: null,
      errorPassword: null,
      processing: false
    }
  },
  computed:{
    // pola obliczeniowe
    login(){
      return this.mailValidation() ;//&& this.passwordValidation();
    }
  },
  mounted() {

  },
  methods: {
    mailValidation() {
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (!re.test(String(this.email).toLowerCase())) {
        this.errorEmail = 'Error email';
        return false;
      } else {
        this.errorEmail = 'success';
        return true;
      }
    },
    passwordValidation() {
      const re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}/;
      if (!re.test(String(this.password))) {
        this.errorPassword = 'Niepoprawne haslo';
        return false;
      } else {
        this.errorPassword = 'Poprawne haslo';
        return true;
      }
    },
    async handleLogin(){
      const { email, password, $store, $router } = this;
        try {
          this.processing = true;

          const user = await login({ email, password })
          await $store.dispatch('auth/saveUserDetails', user[0]);
          $router.push({ name: 'dashboard' })
        }
        catch (e) {
          console.log(e)
        }
        finally {
          this.processing = false;
        }}
    }


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="css">
.register-form {
  display: inline-grid;
}
</style>
