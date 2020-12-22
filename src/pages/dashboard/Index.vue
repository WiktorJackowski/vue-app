<template>
  <div class="container">
    <div class="users">
      <div class="logged-in-user">
        <img class="profile-pics" src="@/assets/profile.jpg">
        <div class="logged-user-data">
          <p>Mariusz Pudzian</p>
          <small>IT status</small>
        </div>
      </div>
      <br>
      <br>
        <p v-for="(user, key) in users" :key="key">{{user.name}} {{user.surname}} <img class="profile-pics" src="@/assets/profile.jpg"> <small class="date">Received data msg</small><br><small>Last message</small>
        </p>
    </div>
    <div class="chat-window">
      <div class="header">
        <img class="profile-pics" src="@/assets/profile.jpg">
        <p>Adam Mickiewicz</p>
      </div>
      <div class="chatting-board">
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>That's great</p>
          </div>
        </div>
        <div class="send-msg">
          <div class="box">
            <p>I am refer to the project structure and found some mistakes.</p>
            <img class="profile-pics" src="@/assets/profile.jpg">
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>I see that Project</p>
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>Yes there are many Bugs in that project</p>
          </div>
        </div>
        <div class="send-msg">
          <div class="box">
            <p>Can you send me the report?</p>
            <img class="profile-pics" src="@/assets/profile.jpg">
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>Hello I'm fine and you?</p>
          </div>
        </div>
        <div class="send-msg">
          <div class="box">
            <p>Hello i am also feeling fine today</p>
            <img class="profile-pics" src="@/assets/profile.jpg">
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>That's great</p>
          </div>
        </div>
        <div class="send-msg">
          <div class="box">
            <p>I am refer to the project structure and found some mistakes.</p>
            <img class="profile-pics" src="@/assets/profile.jpg">
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>I see that Project</p>
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>Yes there are many Bugs in that project</p>
          </div>
        </div>
        <div class="send-msg">
          <div class="box">
            <p>Can you send me the report?</p>
            <img class="profile-pics" src="@/assets/profile.jpg">
          </div>
        </div>
        <div class="received-msg">
          <div class="box">
            <img class="profile-pics" src="@/assets/profile.jpg">
            <p>Hello I'm fine and you?</p>
          </div>
        </div>
        <div class="send-msg">
          <div class="box">
            <p>Hello i am also feeling fine today</p>
            <img class="profile-pics" src="@/assets/profile.jpg">
          </div>
        </div>
      </div>
      <div class="send-box">
        <input placeholder="Write something">
        <button class="wyslij">Wyślij</button>
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
      users: [
        {name: 'Adam', surname: 'Mickiewicz'},
        {name: 'Adam', surname: 'Mickiewicz'},
        {name: 'Adam', surname: 'Mickiewicz'},
        {name: 'Adam', surname: 'Mickiewicz'},
      ]
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
  border-right: ridge;
  width: 20%;
  height: 100%;
  position: fixed;
  float: left;

  .logged-in-user{
    color: blue;
    text-align: left;
    margin-bottom: 70px;
    margin-top: 30px;
    position: relative;

    img{
      border-radius: 100%;
      float: left;
      height: 60px;
      margin-left: 10px;
      margin-right: 20px;
    }
    p{
      font-size: 40%;
      color: black;
    }

    .logged-user-data{
      position: relative;
      padding: 1px;
      p{
        color: blue;
        font-size: 16px;
        margin-bottom: 0;
      }
    }
  }

  p{
    color: blue;
    text-align: left;
  }
  small{
    color: black;
    line-height: 1.8;
  }

  .profile-pics{
    border-radius: 100%;
    float: left;
    height: 50px;
    margin-left: 10px;
    margin-right: 20px;
  }

  .date{
    float: right;
    color: red;
    font-size: 70%;
    overflow-wrap: break-word;
  }
}

.chat-window {
  float: right;
  position: relative;
  border-top-style: ridge;
  width: 79%;

  img{
    border-radius: 100%;
    float: left;
    height: 50px;
    margin-left: 10px;
    margin-top: 25px;
  }
  p{
    float: left;
    padding: 18px;
    font-size: 20px;
  }

  .header{
    width: 100%;
    position: fixed;
    background: white;
    top: 0;
  }

  .chatting-board{
    width: 100%;
    height: 100%;

    .received-msg{
      display: inline-block;
      margin-right: 10px;
      width: 100%;
      .box {
        float: left;
        align-items: center;
        display: flex;
        img{
          float: left;
          height: 25px;
        }
        p{
          background: lightgray;
          border-radius: 11px 11px 11px 2px;
          font-size: 12px;
        }
      }
    }

    .send-msg{
      display: inline-block;
      margin-right: 10px;
      width: 100%;
      color: white;
      .box {
        float: right;
        align-items: center;
        display: flex;
        img{
          height: 25px;
          margin-left: 0;
        }
        p{
          font-size: 12px;
          border-radius: 11px 11px 2px 11px;
          background: #4d7dfd;
        }

      }
    }
  }

  .send-box{
    position: fixed;
    bottom: 0;
    display: inline-flex;
    right: -21px;
    width: 80%;

    .wyslij{
      color: white;
      border: 0;
      border-radius: 50%;
      background: #4d7dfd;
      height: 50px;
      width: 50px;
      font-size: 14px;
      font-weight: 800;
      text-align: center;
      margin-left: 5px;
      margin-right: 5px;
    }

    input{
      width: 91%;
      border: 0;
    }
  }
}



</style>
