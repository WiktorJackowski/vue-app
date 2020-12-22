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
    this.arrayDiff([1,2,2],[2]);
  },
  methods: {
    arrayDiff(a, b){
      let arr = [];

      for(let i = 0; i < a.length; i++){
        if(!a.includes(b[i])){
          arr.push(a[i]);
        }
      }

      // a.map(item => {
      //   if(item.includes(b)){
      //     console.log(item);
      //   }else{
      //     console.log(b);
      //   }
      // })

      console.log(arr);

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
