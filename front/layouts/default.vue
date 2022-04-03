<template>
  <div>
    <v-main>
      <v-container class="container">
        <Nuxt />
      </v-container>
    </v-main>
    
    <div>
      <Footer />
    </div>
  </div>
</template>

<script>
</script>

<style>
.container {
  background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
  /* background-image: url("../assets/img/background.png"); */
}
.logo {
  /* margin-right: auto;
  margin-left: auto;
  align-items: center; */
  text-align: center;
}
.head {
  padding: 4px;
}
/* .icon {
  background-image: url("../assets/img/kiiro.png");
  width: 80px;
} */
</style>

