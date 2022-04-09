<template>
  <div>
    <HeaderEdit />
    <p v-for="answer in answers" :key="answer.id">
      <v-container fluid>
        <v-col cols="12" sm="12">
          {{ answer.question.text }}
        <v-card class="mx-auto">
        <v-card-text class="font-weight-medium mt-4 text-left text-subtitle-1">
          {{ answer.answer }}
        </v-card-text>
        </v-card>
        </v-col>
      </v-container>
    </p>
    <div align="center">
      <v-btn class="btn" @click.prevent="removeAnswer" color="#FFAB91">削除</v-btn>
    </div>
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
  methods: {
    async removeAnswer(answer) {
      const res = confirm("本当に削除しますか？");
      if (res) {
        await axios.delete(`/v1/answers/${answer.id}`);
      }
    this.$router.push('/')
    },
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
</script>

<style>
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>