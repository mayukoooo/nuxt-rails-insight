<template>
  <div>
    <v-app-bar class="head" fixed app>
      <NuxtLink to="/works" tag="div">戻る</NuxtLink>
      <v-spacer />
      <NuxtLink to="/works"
        ><img src="~/assets/img/logo.png" width="95px"
      /></NuxtLink>
      <v-spacer />
      <NuxtLink :to="'/myworks/' + $route.params.categoryid + '/edit'" tag="div"><v-btn class="save" color="#FFAB91">編集</v-btn></NuxtLink>
    </v-app-bar>
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
      <v-btn class="btn" @click.prevent="removeAnswer" color="#D65850">削除</v-btn>
    </div>
    <Footer />
  </div>
</template>

<script>
export default {
  data() {
    return {
      answers: [],
      params_id: this.$route.params.categoryid,
    };
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    },
  },
  async asyncData({ $axios, params, store }) {
    let answers = await $axios.$get("/v1/answers");
    answers = answers.filter((answer) => {
      return answer.question.category_id == params.categoryid && answer.user_id == store.state.auth.currentUser.id;
    });
    answers.sort((a, b) => {
      return a.question_id - b.question_id;
    });
    return { answers };
  },
  methods: {
    async removeAnswer() {
      const res = confirm("本当に削除しますか？");
      if (res) {
        // console.log(this.answers);
        await Promise.all(
          this.answers.map(async (item) => {
            // console.log(item);
            // console.log(item.id);
            await this.$axios.$delete(`/v1/answers/${item.id}`, {
              id: item.id,
            });
          })
        );
        this.$router.push("/works");
      }
    },
  },
  fetch({ store, redirect }) {
    store.watch(
      (state) => state.auth.currentUser,
      (newUser, oldUser) => {
        if (!newUser) {
          return redirect("/login");
        }
      }
    );
  },
};
</script>

<style>
.save {
  color: rgb(44, 51, 56);
  margin-bottom: 10px;
}
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>