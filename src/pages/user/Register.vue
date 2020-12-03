<template>
  <div>
    <div class="register-form">
      <label>Podaj imię:
        <input v-model="name" @input="nameValidation" type="text">
        {{errorName}}
      </label>
      <label>Podaj nazwisko:
        <input v-model="surname" @input="surnameValidation" type="text">
        {{errorSurname}}
      </label>
      <label>Podaj email:
        <input v-model="email" @input="mailValidation" type="email">
        {{ errorEmail }}
      </label>
      <label>Twoje hasło:
        <input v-model="password" @input="passwordValidation" type="password">
        {{ errorPassword }}
      </label>
      <label>Powtórz hasło:
        <input v-model="confirmPassword" @input="passwordSimilarity" type="password">
        {{ errorConfirmPassword }}
      </label>
      <button type="button" @click="registration" v-on:keyup.enter="registration">Zarejestruj</button>
    </div>
  </div>
</template>

<script>
import {register} from "@/api";

export default {
  name: 'Register',
  props: {},
  data() {
    return {
      name: null,
      surname: null,
      email: null,
      password: null,
      confirmPassword: null,
      errorName: "",
      errorSurname: "",
      errorEmail: "",
      errorPassword: "",
      errorConfirmPassword: '',
    }
  },
  mounted() {
  },
  methods: {
    nameValidation(){
      if(this.name === ""){
        this.errorName = "Wymagane pole";
        return false;
      }else{
        return true;
      }
    },
    surnameValidation(){
      if(this.surname === ""){
        this.errorSurname = "Wymagane pole";
        return false;
      }else{
        return true;
      }
    },
    mailValidation() {
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (!re.test(String(this.email).toLowerCase())) {
        this.errorEmail = 'Error email';
        return false;
      } else {
        this.errorEmail = 'Success';
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
    passwordSimilarity() {
      if (this.password === this.confirmPassword) {
        this.errorConfirmPassword = 'Haslo poprawne';
        return true;
      } else {
        this.errorConfirmPassword = 'Haslo niepoprawne';
        return false;
      }
    },
    async registration(){
      const {name, surname,email, password, $router } = this;
      try {
        this.processing = true;

        await register({name, surname, email, password })
        $router.push({ name: 'login' })
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
