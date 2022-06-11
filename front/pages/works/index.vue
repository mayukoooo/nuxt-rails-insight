<template>
<div>
  <HeaderMain />
  <div v-if="user" class="welcome">
    <p>こんにちは🐈　{{ user.name }}さん</p>
    <p>今日はどのワークに取り組みますか？</p>
  </div>
 
  <v-row class="home" justify="center" align-content="center">
    <v-col class="item" cols="6" align="center">
        <v-card height="150" max-width="150" @click.prevent="newCreate1">
          <v-card-text>価値観</v-card-text>
        </v-card>
    </v-col>
    <v-col class="item" cols="6" align="center">
        <v-card height="150" max-width="150" @click.prevent="newCreate2">
          <v-card-text>情熱</v-card-text>
        </v-card>
    </v-col>
    <v-col class="item" cols="6" align="center">
        <v-card height="150" max-width="150" @click.prevent="newCreate3">
          <v-card-text>願望</v-card-text>
        </v-card>
    </v-col>
    <v-col class="item" cols="6" align="center">
        <v-card height="150" max-width="150" @click.prevent="newCreate4">
          <v-card-text>影響力</v-card-text>
        </v-card>
    </v-col>  
  </v-row>
  <Footer />
  </div>
</template>

<script>
export default {
  data() {
    return {
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    }
  },
  created() {
    // location.reload();
    // console.log("API_KEY:", process.env.API_KEY);
  },
  methods: {
    async newCreate1() {
      let answers = await this.$axios.$get("/v1/answers");
      // console.log(answers);
      answers = answers.filter((answer) => {
        return answer.question.category_id == 1 && answer.user_id == this.user.id;
      });
      // console.log(answers); 
      if(answers.length > 1) {
        this.$router.push("/myworks/1");
      }else{
        this.$router.push("/works/1");
      }
    },
    async newCreate2() {
      let answers = await this.$axios.$get("/v1/answers");
      // console.log(answers);
      answers = answers.filter((answer) => {
        return answer.question.category_id == 2 && answer.user_id == this.user.id;
      });
      // console.log(answers); 
      if(answers.length > 1) {
        this.$router.push("/myworks/2");
      }else{
        this.$router.push("/works/2");
      }
    },
    async newCreate3() {
      let answers = await this.$axios.$get("/v1/answers");
      // console.log(answers);
      answers = answers.filter((answer) => {
        return answer.question.category_id == 3 && answer.user_id == this.user.id;
      });
      // console.log(answers); 
      if(answers.length > 1) {
        this.$router.push("/myworks/3");
      }else{
        this.$router.push("/works/3");
      }
    },
    async newCreate4() {
      let answers = await this.$axios.$get("/v1/answers");
      // console.log(answers);
      answers = answers.filter((answer) => {
        return answer.question.category_id == 4 && answer.user_id == this.user.id;
      });
      // console.log(answers); 
      if(answers.length > 1) {
        this.$router.push("/myworks/4");
      }else{
        this.$router.push("/works/4");
      }
    },
    fetch({
    store,
    redirect
  }) {
    store.watch(
      state => state.auth.currentUser,
      (newUser, oldUser) => {
        if (!newUser) {
          return redirect("/login");
        }
      }
    );
  },
  }
}
</script>

<style>
.welcome {
  margin: 10px;
}
.welcome p {
  text-align: center;
  color: #130569;
  font-size: 14px;
  font-weight: bold;
}
.home {
  margin-top: 10px;
  margin-bottom: 150px;
}
.item {
  padding: 5px;
  margin-bottom: 5px;
}
</style>