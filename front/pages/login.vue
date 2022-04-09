<template>
  <v-row justify="center">
    <HeaderSignup />
    <v-col class="form" cols="12" md="4" align="center">
      <h2>Login</h2>
      <form>
        <v-text-field v-model="email" :counter="20" label="email" required></v-text-field>
        <v-text-field v-model="password" label="password" required :type="show1 ? 'text' : 'password'"
          :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'" @click:append="show1 = !show1"></v-text-field>
        <v-btn class="btn" @click="login" color="#FFAB91">ログイン</v-btn>
        <p>アカウントの新規作成は<NuxtLink to="/signup">こちら</NuxtLink></p>
        <p v-if="error" class="errors">{{ error }}</p>
      </form>
    </v-col>
  </v-row>
</template>

<script>
import firebase from "@/plugins/firebase";
export default {
  data() {
    return {
      email: "",
      password: "",
      show1: false,
      error: null,
    };
  },
  methods: {
    async login() {
      this.error = null;
      await firebase
        .auth()
        .signInWithEmailAndPassword(this.email, this.password)
        .catch((error) => {
          switch (error.code) {
            case "auth/user-not-found":
              this.error = "メールアドレスが間違っています";
              return
            case "auth/wrong-password":
              this.error = "※パスワードが正しくありません";
              return
            default:
              this.error = "※メールアドレスとパスワードをご確認ください";
              return
          };
        });
        
      if (this.error === null) {
        this.$router.push("/works");
      }
    },
  },
};
</script>

<style scoped>
.form{
  margin-top: 40px;
  margin-bottom: 100px;
}
.errors {
  color: red;
  margin-top: 20px;
}
h2 {
  color: rgb(76, 86, 95);
}
.btn {
  margin-top: 40px;
  margin-bottom: 15px;
}
p {
  color: rgb(44, 51, 56);
  font-size: 13px;
  margin-bottom: 160px;
}
</style>