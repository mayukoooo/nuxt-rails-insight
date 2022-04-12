<template>
  <div>
    <v-app-bar class="head" fixed app>
    <!-- <NuxtLink to="/myworks/1" tag="div">戻る</NuxtLink> -->
    <input type="button" onclick="window.history.back();" value="戻る">
    <v-spacer />
    <NuxtLink to="/works"><img src="~/assets/img/logo.png" width="95px"></NuxtLink>
    <v-spacer />
    <v-btn class="save" @click.prevent="updateAnswer" color="#FFAB91">保存</v-btn>
    </v-app-bar>

    <p v-for="answer in answers" :key="answer.id">
      <v-container fluid>
        <v-col cols="12" sm="12">
          {{ answer.question.text }}
          <v-textarea solo v-model="answer.answer" label="" name="input-7-4"></v-textarea>
        </v-col>
      </v-container>
    </p>
    <!-- <div align="center">
      <v-btn class="btn" @click.prevent="removeAnswer" color="#FFAB91">削除</v-btn>
    </div> -->
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
    async updateAnswer() {
      console.log(this.answers)
      await Promise.all(this.answers.map((async item => {
        console.log(item)
        console.log(item.answer)
        await this.$axios.$put(`/v1/answers/${item.id}`, {
          answer: {
            id: item.id,
            answer: item.answer,
            question_id: item.question_id,
          }
        });
      })));
      this.$router.push("/works")
    },
    // async removeAnswer() {
    //   const res = confirm("本当に削除しますか？");
    //   if (res) {
    //     console.log(this.answers)
    //     await Promise.all(this.answers.map((async item => {
    //       console.log(item)
    //       console.log(item.id)
    //       await this.$axios.$delete(`/v1/answers/${item.id}`, {
    //         id: item.id
    //       });
    //     })));
    //     this.$router.push("/works")
    //   }
    // },
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
.save {
  color: rgb(44, 51, 56);
  margin-bottom: 10px;
}
.btn {
  margin: 20px;
  cursor: pointer;
}
</style>