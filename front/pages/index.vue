<template>
  <v-container class="con" align-content="center" fluid>
    <div class="kiiro">
    <img src="~/assets/img/kiiro.png" width="150px">
    </div>
    <div class="top" align="center">
    <div class="logo">
      <ul>
        <li><img src="~/assets/img/logo.png" width="150px"></li>
        <li><img src="~/assets/img/copy.png" width="230px"></li>
      </ul>
    </div>
    <div class="orange">
    <img src="~/assets/img/orange.png" width="150px">
    </div>
    <v-btn class="btn" color="#FFAB91"><NuxtLink to="/signup" tag="div">はじめる</NuxtLink></v-btn>
      <div class="description">
        <h4>Use Case</h4>
        <h3>こんなことありませんか？</h3>
        <li>
          <h5>自分がどうしたいのかわからない</h5>
          <p>家族や仕事、学業を優先する毎日。結局自分って何がやりたかったんだっけ？何を感じてるんだっけ？</p>
          <img src="~/assets/img/woman1.png" width="180px">
        </li>
        <li>
          <h5>今の環境に不満がある</h5>
          <p>今の職場に不満があるけど、自分に合う環境ってなんだろう？</p>
          <img src="~/assets/img/man1.png" width="180px">
        </li>
        <li>
          <h5>家族、友達、恋人と上手くいかない</h5>
          <p>一番近いはずの人がなんだか最近遠く感じる。自分の気持ちを伝えていないし、相手が何を考えているのかわからない。</p>
          <img src="~/assets/img/family1.png" width="180px">
        </li>
      </div>
      <div class="description">
        <h4>How to use</h4>
        <h3>さぁ、自分探しをはじめよう！</h3>
        <li>
          <h5>自分を知るための質問に答える</h5>
          <p>今の自分に不満があるのは、自分のことがよくわかっていないから。さまざまな問いに対してじっくり向き合ってみよう。</p>
          <img src="~/assets/img/women2.png" width="180px">
        </li>
        <li>
          <h5>自分を色んな角度から見つめてみる</h5>
          <p>今まで見えていなかった自分が見えてくるかも？</p>
          <img src="~/assets/img/women3.png" width="180px">
        </li>
        <li>
          <h5>自分が心地よく感じる行動をしてみる</h5>
          <p>自分のことが知れたら、自分で自分を満たす行動をしよう！</p>
          <img src="~/assets/img/women4.png" width="180px">
        </li>
      </div>
      <div class="description">
        <h4>Coming soon</h4>
          <h5>家族、友達、恋人と新しい自分をシェアしよう！</h5>
          <p>身近にいる人ほどわかってるつもりになってませんか？お互いのInsightをシェアすることで、知らない部分が出てくるかも？</p>
          <img src="~/assets/img/family2.png" width="180px">
      </div>
      <v-btn class="btn" color="#FFAB91"><NuxtLink to="/signup" tag="div">はじめる</NuxtLink></v-btn>
    </div>
  </v-container>
</template>

<script>
</script>

<style>
.container.con.container--fluid.align-content {
  margin: 0;
}
.container {
  padding: 0px;
}
.kiiro {
  text-align: left;
}
.orange {
  text-align: right;
  margin-bottom: 150px;
}
.con {
  padding: 15px;
  margin-bottom: 100px;
}
.top {
  margin-bottom: 50px;
}
.logo {
  margin-top: 50px;
  margin-bottom: 50px;
}
.logo li {
  margin-bottom: 5px;
  list-style-type: none;
}
.description {
  margin-bottom: 80px;
}
.description li {
  margin-bottom: 50px;
  list-style-type: none;
}
.description p {
  font-size: 14px;
  color: #130569;
  margin-bottom: 10px;
  width: 300px;
}
h3 {
  color: #130569;
  margin-bottom: 20px;
}
h4 {
  color: hsl(15, 100%, 64%);
  margin-bottom: 3px;
}
h5 {
  color: #130569;
  font-size: 15.5px;
  margin-bottom: 5px;
}
.btn {
  margin-bottom: 100px;
  cursor: pointer;
  color: rgb(76, 86, 95);
}
</style>