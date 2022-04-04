<template>
  <v-container fluid>
  <HeaderMain />
    <v-row>
      <v-col cols="12" md="12">
        <p v-for="question in questions" :key="question.text">
          {{  question.text }}
          <v-textarea solo v-model="answer" label="入力欄" name="input-7-4"  required></v-textarea>
        </p>
      </v-col>
    </v-row>
    <v-row justify="space-around">
      <v-btn @click.prevent="addAnswer" color="#FFAB91">保存</v-btn>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      questions: []
    };
  },
  
  methods: {
    async addAnswer() {
      const answers = {
        answers: [
          {
            user_id: 1,
            question_id: 1,
            answer: this.answer,
          },
          {
            user_id: 1,
            question_id: 2,
            answer: this.answer,
          },
          {
            user_id: 1,
            question_id: 3,
            answer: this.answer,
          },
          {
            user_id: 1,
            question_id: 4,
            answer: this.answer,
          },
          {
            user_id: 1,
            question_id: 5,
            answer: this.answer,
          },
          {
            user_id: 1,
            question_id: 6,
            answer: this.answer,
          },
        ]
      };
      await this.$axios.post("/v1/answers", 
        answers
      )
      .then(function (res) {
        console.log(res.data);
      })
      this.$router.push('/')
    }
  },
}
</script>

<style>
</style>