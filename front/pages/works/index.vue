<template>
<div>
  <HeaderMain />
    <div v-if="user"></div>
    <!-- <p>名前：{{ user.name }}</p> -->
  <v-row class="home" justify="center" align-content="center">
    <v-col class="item" cols="6" align="center">
      <NuxtLink to="/works/_id" tag="div">
        <v-card height="150" max-width="150">
          <v-card-text>価値観</v-card-text>
        </v-card>
      </NuxtLink>
    </v-col>
    <v-col class="item" cols="6" align="center">
      <NuxtLink to="" tag="div">
        <v-card height="150" max-width="150">
          <v-card-text>カテゴリ２</v-card-text>
        </v-card>
      </NuxtLink>
    </v-col>
    <v-col class="item" cols="6" align="center">
      <NuxtLink to="" tag="div">
        <v-card height="150" max-width="150">
          <v-card-text>カテゴリ３</v-card-text>
        </v-card>
      </NuxtLink>
    </v-col>
    <v-col class="item" cols="6" align="center">
      <NuxtLink to="" tag="div">
        <v-card height="150" max-width="150">
          <v-card-text>カテゴリ４</v-card-text>
        </v-card>
      </NuxtLink>
    </v-col>
  </v-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    }
  },
  created() {
    console.log("API_KEY:", process.env.API_KEY);
  },
}
</script>

<style>
.home {
  margin-top: 10px;
}
.item {
  padding: 5px;
  margin-bottom: 5px;
}
</style>