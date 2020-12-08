<template>
  <div class="container">
    <div class="users">
      <h1>
      </h1>
      <p v-for="(user, key) in users" :key="key">{{user.name}} {{user.surname}} <span v-if="user.id === currentUser.id"> <img src="../../assets/profile.jpg"></span></p>
      <div class="logout-box">
        <button>Wyloguj</button>
      </div>
    </div>
    <div class="chat-window">
      <h1></h1>
      <div class="send-box">
        <input>
        <button>Wyslij</button>
      </div>
    </div>
  </div>
</template>

<script>

import { getUsers } from "@/api";
import { mapState } from 'vuex';

export default {
  name: 'Dashboard',
  props: {},
  data() {
    return {
      users: []
    }
  },
  computed:{
    ...mapState({
      currentUser: state => state.auth.user,
    }),
  },
  mounted() {
    this.loadUsers();
    console.log(this.currentUser);
  },
  methods: {
    async loadUsers() {
      try {
        this.users = await getUsers();
      } catch (e) {
        console.log(e);
      }
    }
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
.container {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
}
.users{
  border-right: 2px solid black;
  width: 20%;
  height: 100%;
  position: relative;
  float: left;

  h1{
    text-align: center;
  }
  p{
    color: aqua;
    text-align: left;
    margin-left: 20px;
  }
img{
  float: left;
  height: 50px;
}
  .logout-box{
    button {
      position: fixed;
      bottom: 0;
      display: inline-flex;
      width: 20%;
      left: 0;
    }
  }

}

.chat-window {

  float: right;
  position: relative;
  border-top-style: solid;
  width: 79%;

  .send-box{
    position: fixed;
    bottom: 0;
    display: inline-flex;
    right: 0;
    width: 80%;

    input{
      width: 100%;
    }
  }
}



</style>
