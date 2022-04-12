<template>
  <v-container fluid>
    <v-row> 
      <HeaderEdit />
      <v-col align="center" class="items" cols="12" md="12">
        <div class="item">
          <h4>ユーザーID</h4>
          <v-card class="mx-auto" max-width="344">
            <v-card-text>
              <p>{{ user.id }}</p>
            </v-card-text>
          </v-card>
        </div>
        <div class="item">
          <h4>ユーザー名</h4>
          <v-card class="mx-auto" max-width="344">
            <v-card-text>
              <p>{{ user.name }}</p>
            </v-card-text>
          </v-card>
        </div>
        <div class="item">
          <h4>メールアドレス</h4>
          <v-card class="mx-auto" max-width="344">
            <v-card-text>
              <p>{{ user.email }}</p>
            </v-card-text>
          </v-card>
        </div>
        <div class="logout">
          <v-btn @click="logOut" color="#FFAB91">ログアウト</v-btn>
        </div>
      </v-col>
    </v-row>
    <Footer />
  </v-container>
</template>

<script>
import firebase from "@/plugins/firebase";
export default {
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    },
  },
  methods: {
    async logOut() {
      await firebase
        .auth()
        .signOut()
        .catch((error) => {
          console.log(error);
        });
      this.$store.dispatch("auth/setUser", null);
      this.$router.push("/login");
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
  },
};
</script>

<style>
.items {
  margin-top: 5px;
  margin-bottom: 20px;
}
.item {
  margin-bottom: 40px;
}
.item p {
  margin-bottom: 5px;
  color: rgb(76, 86, 95);
}
.item h4 {
  color: rgb(76, 86, 95);
}
.logout {
  margin-top: 100px;
}
</style>
