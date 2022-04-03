<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="12">
        <v-textarea solo v-model="answer" name="input-7-4" label="入力欄" required></v-textarea>
      </v-col>
    </v-row>
    <v-row justify="space-around">
      <NuxtLink to="/"><v-btn color="#FFAB91">もどる</v-btn></NuxtLink>
      <v-btn @click.prevent="addAnswer" color="#FFAB91">
        つぎへ
      </v-btn>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      answer: "",
    };
  },
  methods: {
    handleSubmit() {
      this.$emit("submit", this.answer);
      this.answer =  "";
    }
  }
};
</script>

<style>

</style>