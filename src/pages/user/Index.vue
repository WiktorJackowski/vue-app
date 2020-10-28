<template>
  <div>
    <div class="register-form">
      <label>Podaj email:
        <input v-model="email" @input="mailValidation" type="email">
        {{ errorEmail }}
      </label>
      <label>Twoje hasło:
        <input v-model="password" @input="passwordValidation" type="password">
        {{errorPassword}}
      </label>
      <label>Powtórz hasło:
        <input v-model="confirmPassword" @input="passwordSimilarity" type="password">
        {{errorConfirmPassword}}
      </label>
      <button>Zarejestruj</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Register',
  props: {},
  data() {
    return {
      email: null,
      password: null,
      confirmPassword: null,
      errorEmail: "",
      errorPassword: "",
      errorConfirmPassword: '',
    }
  },
  mounted() {
  },
  methods: {
    mailValidation() {
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (!re.test(String(this.email).toLowerCase())) {
        this.errorEmail = 'Error email';
      } else {
        this.errorEmail = 'success';
      }
    },

    passwordValidation(){
      const re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}/;
      if(!re.test(String(this.password))){
        this.errorPassword = 'Niepoprawne haslo';
      }else{
        this.errorPassword = 'Poprawne haslo';
      }
    },

    passwordSimilarity(){
      if(this.password === this.confirmPassword){
        this.errorConfirmPassword = 'Haslo poprawne';
      }else{
        this.errorConfirmPassword = 'Haslo niepoprawne';
      }
    }


  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="css">
.register-form {
  display: inline-grid;
}
</style>
