<template>
  <div class="container">
    <div class="users">
      <h1>Użytkownicy:</h1>
      <p>Pierwszy</p>
      <p>Drugi</p>
    </div>
    <div class="chat-window">
      <h1>Okno rozmowy</h1>
      <small>Wyslij</small>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Dashboard',
  props: {},
  data() {
    return {
    }
  },
  computed:{

  },
  mounted() {

  },
  methods: {
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
    text-align: right;
  }
}

.chat-window {
  h1{
    text-align: center;
  }

  float: right;
  width: 75%;
  position: relative;
  border-top-style: solid;
  width: 79%;

  small{
    float: right;
    color: green;
  }
}

</style>
