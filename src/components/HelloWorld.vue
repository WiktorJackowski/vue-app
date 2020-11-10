<template>
  <div class="hello">
    {{wynik}}
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data() {
    return {
      wynik: null
    }
  },
  mounted() {
    this.roundToNext5(2);
  },
  methods: {
    roundToNext5(n){
      while (n%5 != 0){
        n++;
      }

      console.log(n);
      return n;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
