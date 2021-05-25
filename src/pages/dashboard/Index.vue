<template>
  <div class="container">
    <div class="users">
      <div class="logged-in-user">
        <div class="logged-user-data">
          <img class="profile-pics" src="@/assets/profile.jpg">
          <div class="main-user">
            <div>
              <p>{{currentUser.name + ' ' + currentUser.surname}}</p>
              <font-awesome-icon :icon="['fas', 'pencil-alt']" />
            </div>
            <br>
            <small>IT status</small>
          </div>
        </div>
      </div>
      <br>
      <br>
        <p v-for="(user, key) in users" :key="key" @click="openChat(user.id, currentUser.id, user.name + ' ' + user.surname + ' - ' + currentUser.name + ' ' + currentUser.surname)">{{user.name}} {{user.surname}} <img class="profile-pics" src="@/assets/profile.jpg"> <small class="date">10:26 AM</small><br><small>I am refer to the project structure and found some mistakes.</small>
        </p>
    </div>
    <div v-if="chat" class="chat-window">
      <div class="header">
        <img class="profile-pics" src="@/assets/profile.jpg">
        <p>{{chat.name}}</p>
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
        <input v-model="message" placeholder="Write something" @keydown.enter="postMessage">
        <font-awesome-icon @click="postMessage" :icon="['far', 'arrow-alt-circle-right']" />
      </div>
    </div>
    <div v-if="chat" class="user-details">
      <div class="user-conversation">
        <img class="profile-pics" src="@/assets/profile.jpg">
        <h2>Adam Mickiewicz</h2>
        <h3>IT status</h3>
      </div>
      <div class="calling-menu">
        <h1 class="chat-img"> <font-awesome-icon :icon="['fas', 'envelope']" /> <p>Chat</p> </h1>
        <h1 class="video-chat-img"> <font-awesome-icon :icon="['fas', 'camera']" /> <p>Video chat</p> </h1>
      </div>
      <div class="favourite-editor">
        <h5><font-awesome-icon :icon="['fas', 'user']" /> View Friends</h5>
        <h5> <font-awesome-icon :icon="['far', 'heart']" /> Add to Favourite</h5>
        <br>
        <h3>Attachments</h3>
      </div>
      <div class="icons">
        <br>
        <span>PDF</span>
        <span>Video</span>
        <span>MP4</span>
        <span>Image</span>
      </div>
      <div class="sent-photos"></div>
      <small class="hide-photos">View all</small>
    </div>
    <div v-else>
    </div>
  </div>
</template>

<script>

import { getUsers, openChat, postMessage} from "@/api";
import { mapState } from 'vuex';

export default {
  name: 'Dashboard',
  props: {},
  data() {
    return {
      users: [],
      chat: null,
      message: null,
      receiverId: null,
    }
  },
  computed: {
    ...mapState({
      currentUser: state => state.auth.user,
    }),
  },
  mounted() {
    this.loadUsers();
  },
  methods: {
    async loadUsers() {
      try {
        this.users = (await getUsers()).filter(item => (item.id !== this.currentUser.id));
      } catch (e) {
        console.log(e);
      }
    },
    async openChat(userId, currentUser, chatName) {
      try {
        this.receiverId = userId;
        this.chat = (await openChat({user_id: userId, current_user_id: currentUser, chat_name: chatName}))[0];
      } catch (e) {
        console.log(e);
      }
    },
    async postMessage(){
      try {
        await postMessage({chat_id: this.chat.id, sender_id: this.currentUser.id, receiver_id: this.receiverId, text: this.message});
      } catch (e) {
        console.log(e);
      } finally {
        this.message = '';
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
  left: 0;
  z-index: 1111111;

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
      width: 100%;
      display: inline-flex;

      .main-user{
        width: 100%;
        div{
          display: inline-flex;
          svg{
            align-self: flex-end;
            right: 3px;
            position: absolute;
            color: darkgrey;
          }
        }
      }

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
    color: grey;
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
    color: darkgrey;
    font-size: 70%;
    overflow-wrap: break-word;
  }
}

.chat-window {
  float: left;
  position: relative;
  border-top-style: ridge;
  width: 54%;

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
    width: 54%;
    position: fixed;
    background: white;
    top: 0;
    z-index: 11111111111;
    transform: translateX(38%);
  }

  .chatting-board{
    width: 100%;
    height: 100%;
    margin-top: 100px;
    margin-bottom: 100px;
    transform: translateX(38%);
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
    right: 25.5%;
    width: 54%;
    border: 0;
    background: white;

    svg{
      font-size: 44px;
    }

    input{
      width: 92%;
      border: 0;
    }
  }
}
.user-details{
  float: right;
  height: 100%;
  width: 20%;
  position: fixed;
  right: 0;

  .user-conversation{
    img{
      border-radius: 100%;
      width: 50%;
      margin-top: 25%;
    }
  }
  .calling-menu{
    height: 17%;
    .chat-img{
      float: left;
      margin-left: 60px;
      margin-top: 50px;
      p{
        font-size: small;
      }
    }
    .video-chat-img{
      float: right;
      margin-right: 60px;
      margin-top: 50px;
      p{
        font-size: small;
      }
    }
  }
  .favourite-editor{
    text-align: left;
  }
  .icons{
    text-align: center;
    span{
      padding: 20px;
      color: #4d7dfd;
    }
  }
  .sent-photos{
    margin-top: 35%;
  }
  .hide-photos{
    color: #4d7dfd;
    border-radius: 25px;
    border: 2px solid #4d7dfd;
    padding: 5px;
  }
}




</style>
