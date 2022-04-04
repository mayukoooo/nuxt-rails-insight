<template>
  <v-container fluid>
    <HeaderShow /> 
    <v-row> 
      <v-col align="center" class="items" cols="12" md="12">
        <div class="item">
          <h4>ユーザーID</h4>
          <v-card class="mx-auto" max-width="344">
            <v-card-text>
              <p>{{ users[$route.params.userid].id }}</p>
            </v-card-text>
          </v-card>
        </div>
        <div class="item">
          <h4>ユーザー名</h4>
          <v-card class="mx-auto" max-width="344">
            <v-card-text>
              <p>{{ users[$route.params.userid].name }}</p>
            </v-card-text>
          </v-card>
        </div>
        <div class="item">
          <h4>メールアドレス</h4>
          <v-card class="mx-auto" max-width="344">
            <v-card-text>
              <p>{{ users[$route.params.userid].email }}</p>
            </v-card-text>
          </v-card>
        </div>
        <div class="edit">
          <NuxtLink to="/profile/edit" tag="div">
            <v-btn color="#FFAB91"><p>編集する</p></v-btn>
          </NuxtLink>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
    };
  },
  async asyncData({ $axios }) {
    const users = await $axios.$get("/v1/users");
    return { users };
  },
}
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
.edit {
  margin-top: 100px;
}
</style>