<template>
<div>
    <!-- <img src="../assets/img/orange.png" width="80px"> -->
    <v-footer color="#FAF6ED" fixed app>
      <div class="nav">
        <div class="menu"><NuxtLink to="/works"><img src="~/assets/img/works.png" width="70px"></NuxtLink></div>
        <!-- <NuxtLink to="/friends"><div class="menu"><img src="~/assets/img/friends.png" width="75px"></div></NuxtLink> -->
        <div class="menu"><NuxtLink to="/profile"><img src="~/assets/img/profile.png" width="70px"></NuxtLink></div>
      </div>
    </v-footer>
</div>
</template>

<script>
export default {

}
</script>

<style>
.nav {
 margin-right: auto;
 margin-left: auto;
 align-items: center; 
}
.menu{
  float: left;
  padding: 15px 20px;
  /* font-size: 20px; */
}
</style>