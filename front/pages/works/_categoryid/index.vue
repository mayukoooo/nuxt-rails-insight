<template>
  <v-container class="container" align-content="center" fluid>
    <HeaderMain />
    <div class="message">
      <p>☁️ あなたの{{ questions[1].category.name }}は？ ☁️</p>
    </div>
    <v-row>
      <v-col cols="12" md="12">
        <p v-for="question in questions" :key="question">
          {{ question.text }}
          <v-textarea solo v-model="question.answer" label="" name="input-7-4"></v-textarea>
        </p>
      </v-col>
    </v-row>
    <div align="center">
      <v-btn class="btn" @click.prevent="addAnswer" color="#FFAB91">保存</v-btn>
    </div>
    <Footer />
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      questions: [],
      id: this.$route.params.categoryid,
    };
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    },
  },
  async asyncData({ $axios, params }) {
    let questions = await $axios.$get("/v1/questions");
    questions = questions.filter((question) => {
      return question.category_id == params.categoryid;
    });
      return { questions };
  },
  methods: {
    async addAnswer() {
      await Promise.all(this.questions.map((async item => {
        const answer = {
          user_id: this.user.id,
          question_id: item.id,
          answer: item.answer,
        }
        await this.$axios.post("/v1/answers", {
          answer
        })
      }))),
      this.$router.push('/works')
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
  },
};
</script>

<style>
.container {
  padding: 15px;
}
.message {
  text-align: center;
}
.message p {
  color: #130569;
  font-size: 15px;
  font-weight: bold;
  margin-bottom: 20px;
}
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>