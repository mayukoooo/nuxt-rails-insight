<template>
  <div>
    <HeaderEdit />
    <p v-for="answer in answers" :key="answer.id">
      <v-container fluid>
        <v-col
          cols="12"
          sm="12"
        >
          {{ answer.question.text }}
        <v-card
          class="mx-auto"
        >
        <v-card-text class="font-weight-medium mt-4 text-left text-subtitle-1">
          {{ answer.answer }}
        </v-card-text>
        </v-card>
        </v-col>
      </v-container>
    </p>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    const answers = await $axios.$get(
      "/v1/answers"
    );
    return { answers };
  },
}
</script>

<style>

</style>