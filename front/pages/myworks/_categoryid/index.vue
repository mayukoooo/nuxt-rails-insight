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
    <Footer />
  </div>
</template>

<script>
export default {
  data() {
    return {
      answers: [],
    };
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    },
  },
  async asyncData({ $axios }) {
    const answers = await $axios.$get(
      "/v1/answers"
    );
    console.log(answers)
    return { answers };
  },
  methods: {
    async removeAnswer() {
      const res = confirm("本当に削除しますか？");
      if (res) {
        console.log(this.answers)
        await Promise.all(this.answers.map((async item => {
          console.log(item)
          console.log(item.id)
          await this.$axios.$delete("/v1/answers", {
            id: item.id
          });
        })));
        this.$router.push("/works")
      }
    },
  },

  // fetch({
  //   store,
  //   redirect
  // }) {
  //   store.watch(
  //     state => state.auth.currentUser,
  //     (newUser, oldUser) => {
  //       if (!newUser) {
  //         return redirect("/login");
  //       }
  //     }
  //   );
  // },
}
</script>

<style>
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>