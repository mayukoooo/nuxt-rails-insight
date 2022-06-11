<template> 
<div>
  <p>友達のワーク一覧</p>
  <v-for share in shares :key="shares.id">
    {{ shares }}
  </v-for>
  {{ shares[0].answer_id.user_id }}
  
</div>
  
</template>

<script>
export default {
data(){

},
computed: {
  user() {
    return this.$store.state.auth.currentUser;
  },
},
async asyncData({ $axios, store }) {
    let shares = await $axios.$get("/v1/shares", {
      params: {
          user_id: store.state.auth.currentUser.id,
        },
    });
    if(shares){
      return { shares }; 
    }else{

    }
    console.log(shares);  
    // shares = shares.filter((shares) => {
    //   return shares.user_id == store.state.auth.currentUser.id;
    // });
      
  },
}
</script>

<style>

</style>