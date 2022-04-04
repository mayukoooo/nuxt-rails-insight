<template>
  <v-app-bar class="head" fixed app>
      <NuxtLink to="/">
        <div class="logo">
            <img src="~/assets/img/logo.png" width="95px">
        </div>
      </NuxtLink>
      <v-spacer />

      <NuxtLink to="/myworks">
        <v-col class="icon" cols="12" sm="2">
            <img src="~/assets/img/myworks_icon.png" width="45px">
        </v-col>
      </NuxtLink>
    </v-app-bar> 
</template>

<script>
</script>

<style>
</style>