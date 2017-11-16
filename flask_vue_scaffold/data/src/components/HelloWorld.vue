<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>Dice: {{ number }}</h2>
    <p><button @click="rollDice()">Roll Dice</button></p>
  </div>
</template>

<script>

export default {
  name: 'HelloWorld',
  number: '',
  data() {
    return {
      msg: 'Welcome to Your Flask + Vue.js App',
    };
  },
  computed: {
    number() {
      // xxx is undefined in unit test, which results in a failing test
      if (this.$store) {
        return this.$store.state.example.number;
      }
      return '';
    },
  },
  methods: {
    rollDice() {
      this.$store.dispatch('get');
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
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
