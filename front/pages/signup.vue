<template>
<div>
  <HeaderSignup />
  <v-container class="container">
    <v-col class="form" align="center">
      <h2>Sign Up</h2>
      <form>
        <v-text-field v-model="name" :counter="10" label="Name" data-vv-name="name" required></v-text-field>
        <v-text-field v-model="email" :counter="20" label="Email" data-vv-name="email" required></v-text-field>
        <v-text-field
          v-model="password"
          label="password"
          data-vv-name="password"
          required
          :type="show1 ? 'text' : 'password'"
          :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="show1 = !show1"
        ></v-text-field>
        <v-text-field
          v-model="passwordConfirm"
          label="passwordConfirm"
          data-vv-name="passwordConfirm"
          required
          :type="show2 ? 'text' : 'password'"
          :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="show2 = !show2"
        ></v-text-field>
        <v-btn class="btn" @click="signup" color="#FFAB91">登録</v-btn>
        <p>既にアカウントをお持ちの方は<NuxtLink to="/login">ログイン</NuxtLink></p>
        <p v-if="error" class="errors">{{ error }}</p>
      </form>
    </v-col>
  </v-container>
</div>
</template>

<script>
import firebase from "@/plugins/firebase";

export default {
  data() {
    return {
      email: "",
      name: "",
      password: "",
      passwordConfirm: "",
      show1: false,
      show2: false,
      error: ""
    };
  },
  methods: {
    async signup() {
      if (this.password !== this.passwordConfirm) {
        this.error = "※パスワードとパスワード確認が一致していません";
      }
      const res = await firebase
        .auth()
        .createUserWithEmailAndPassword(this.email, this.password)
        .catch(error => {
          this.error = (code => {
            switch (code) {
              case "auth/email-already-in-use":
                return "既にそのメールアドレスは使われています";
              case "auth/wrong-password":
                return "※パスワードが正しくありません";
              case "auth/weak-password":
                return "※パスワードは最低6文字以上にしてください";
              default:
                return "※メールアドレスとパスワードをご確認ください";
            }
          })(error.code);
        });
        const user = {
          email: res.user.email,
          name: this.name,
          password: this.password,
          uid: res.user.uid
        };
      
    await this.$axios.post("/v1/users", {
        user
      })
      .catch(err => {
        console.log({
          err
        });
      });
      this.$router.push("/works");
    }
  }
};
</script>

<style scoped>
.form.col {
  padding: 50px;
  margin: 0px;
}
.form{
  margin-top: 40px;
  margin-bottom: 100px;
}
h2 {
  color: rgb(76, 86, 95);
}
.errors {
  color: red;
  margin-top: 20px;
}
.btn {
  margin-top: 40px;
  margin-bottom: 15px;
}
p {
  color: rgb(44, 51, 56);
  font-size: 13px;
  margin-bottom: 310px;
}
.container {
  margin: 0px;
  margin-right: auto;
  margin-left: auto;
}
</style>

