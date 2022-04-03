<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="12">
        {{ questions[$route.params.questionid].text }}
        <AddAnswer @submit="addAnswer" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import AddAnswer from "@/components/AddAnswer";
import axios from "@/plugins/axios"; 

export default {
  components: {
    AddAnswer,
  },
  async asyncData({ $axios }) {
    const questions = await $axios.$get(
      "http://localhost:3000/v1/questions"
    );
    return { questions };
  },
  data() {
    return {
      // さっき送られた答えanswerが入る
      answers: [],
    };
  },
  methods: {
    async addAnswer(answer) {
      await axios.post("http://localhost:3000/v1/answers", { answer }); 
      // this.answers.push({
      //   answer,
      // });
      this.$router.push("/work/1/create");
    },
  },
};
</script>

<style>

</style>