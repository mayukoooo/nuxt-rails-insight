<template>
<div>
  <HeaderMain />
  <v-row class="home" justify="center" align-content="center">
    <v-col class="item" cols="6" align="center">
      <NuxtLink to="/works" tag="div">
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