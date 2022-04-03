<template>
  <v-container class="container" align-content="center" fluid>
    <HeaderMain />
    <v-row>
      <v-col cols="12" md="12">
        <p v-for="question in questions" :key="question">
          {{  question.text }}
          <v-textarea solo v-model="answer" label="入力欄" name="input-7-4" required></v-textarea>
        </p>
      </v-col>
    </v-row>
    <div align="center">
      <!-- <NuxtLink to="/"><v-btn @click="$router.push('/')" color="#FFAB91">もどる</v-btn></NuxtLink> -->
      <NuxtLink to="/" tag="div"><v-btn class="btn" @click.prevent="addAnswer" color="#FFAB91">保存</v-btn></NuxtLink>
    </div>
  </v-container>
  
</template>

<script>
export default {
  data() {
    return {
      questions: []
    };
  },
  async asyncData({ $axios }) {
    const questions = await $axios.$get("/v1/questions");
    return { questions };
    },
  methods: {
    async addAnswer() {
      const answers = new FormData()
      if(this.questions.length > 0) {
        this.questions.forEach((user_id, answer, question_id) => {
          param.append(1, this.answer, this.question_id)
        })
      };
      await this.$axios.post("/v1/answers", {
        answers
      })
      // .then(function (res) {
      //   console.log(res.data);
      // })
      this.$router.push('/')
    }
  }
};
</script>

<style>
.container {
  /* margin: 0px 0px; */
  padding: 15px;
}
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>