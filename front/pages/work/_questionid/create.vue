<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="12">
          {{ questions[$route.params.questionid].text }}
        <v-spacer></v-spacer>
        <v-textarea solo v-model="answer" name="input-7-4" label="入力欄" required></v-textarea>
      </v-col>
    </v-row>
    <v-row justify="space-around">
      <NuxtLink to="/"><v-btn @click="$router.push('/work//create')" color="#FFAB91">もどる</v-btn></NuxtLink>
      <NuxtLink to="/work/1/create"><v-btn @click.prevent="addAnswer" color="#FFAB91">つぎへ</v-btn></NuxtLink>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      user_id: 1,
      answer: '',
      question_id: 1,
    };
  },
  async asyncData({ $axios }) {
    const questions = await $axios.$get("/v1/questions");
    return { questions };
  },
  methods: {
    async addAnswer() {
      const answer = {
        user_id: this.user_id,
        answer: this.answer,
        question_id: this.question_id,
      };
      await this.$axios.post("/v1/answers", {
        answer
      })
      .then(function (res) {
        console.log(res.data);
      })
      this.$router.push('/work/1/create')
    }
  },
}
</script>

<style>
</style>