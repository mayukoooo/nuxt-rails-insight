<template>
  <v-container fluid>
    <HeaderMain />
    <v-row>
      <v-col cols="12" md="12">
          {{ questions[$route.params.questionid].text }}
        <v-spacer></v-spacer>
        <v-textarea solo v-model="answer" name="input-7-4" label="入力欄" required></v-textarea>
      </v-col>
    </v-row>
    <v-row justify="space-around">
      <NuxtLink to="/"><v-btn @click="$router.push('/')" color="#FFAB91">もどる</v-btn></NuxtLink>
      <!-- <NuxtLink to="/work/1/create"><v-btn @click.prevent="addAnswer" color="#FFAB91">つぎへ</v-btn></NuxtLink> -->
      <v-btn @click.prevent="addAnswer" color="#FFAB91">つぎへ</v-btn>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      answer: '',
      question_id: 1,
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
      const answer = {
        user_id: this.user.id,
        answer: this.answer,
        question_id: this.question_id,
      };
      // console.log(answer)
      const { data } = await $axios.post("/v1/answers", {
        answer
      });
      // console.log(data)
      this.$store.dispatch("auth/setUser", {
        ...this.user,
        answers: [...this.user.answers, data]
      });

      // await this.$axios.post("/v1/answers", {
      //   answer
      // })
      // .then(function (res) {
      //   console.log(res.data);
      // })

        // this.$router.push('/work/1')

      // for (i = 0; i <= questions.length; i++){
      //   const questionid = i
      //   this.$router.push('/work/${questionid}/create')
      // }
    }
  },
}
</script>

<style>
</style>