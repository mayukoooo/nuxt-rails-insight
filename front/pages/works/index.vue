<template>
  <v-container class="container" align-content="center" fluid>
    <HeaderMain />
    <v-row>
      <v-col cols="12" md="12">
        <p v-for="question in questions" :key="question">
          {{  question.text }}
          <v-textarea solo v-model="question.answer" label="" name="input-7-4"></v-textarea>
        </p>
      </v-col>
    </v-row>
    <div align="center">
      <!-- <NuxtLink to="/"><v-btn @click="$router.push('/')" color="#FFAB91">もどる</v-btn></NuxtLink> -->
      <v-btn class="btn" @click.prevent="addAnswer" color="#FFAB91">保存</v-btn>
    </div>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      questions: [],
    };
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    },
  },
  async asyncData({ $axios }) {
    const questions = await $axios.$get("/v1/questions");
    return { questions };
  },
  methods: {
    async addAnswer() {
      console.log(this.questions)
      await Promise.all(this.questions.map((async item => {
        console.log(item)
        const answer = {
          user_id: this.user.id,
          question_id: item.id,
          answer: item.answer,
        }
        console.log(answer) 
        await this.$axios.post("/v1/answers", {
          answer
        })
      }))),
      this.$router.push('/')
    },
  },
};
</script>

<style>
.container {
  padding: 15px;
}
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>