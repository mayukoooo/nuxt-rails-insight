<template>
  <v-container class="con" align-content="center" fluid>
    <div class="top" align="center">
      <div class="logo">
        <ul>
          <li><img src="~/assets/img/logo.png" width="150px"></li>
          <li><img src="~/assets/img/copy.png" width="230px"></li>
        </ul>
      </div>
      <v-btn class="btn" color="#FFAB91"><NuxtLink to="/signup" tag="div">はじめる</NuxtLink></v-btn>
    </div>
  </v-container>
</template>

<script>
</script>

<style>
.con {
  padding: 15px;
  margin-bottom: 100px;
}
.top {
  margin-bottom: 50px;
}
.logo {
  margin-top: 150px;
  margin-bottom: 200px;
}
.logo li {
  list-style-type: none;
}
li {
  margin-bottom: 5px;
}
.btn {
  cursor: pointer;
  color: rgb(76, 86, 95);
}
</style>