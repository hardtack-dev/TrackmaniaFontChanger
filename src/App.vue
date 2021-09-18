<template>
  <div id="screen">
    <div class="pop-up" v-if="popup_show">
      <div class="pop-title">
         <p> {{popup.title}} </p>
      </div>
     
      <div class="pop-body">

        <p>{{popup.message}}</p>

        <div class="btn-popup-close" @click="popUpClose">
          <p>ok</p>
        </div>
      </div>

    </div>

    <!-- left section -->
    <div class="screen__left">
      <!-- list -->
      <div class="list-title">
        <p>Font list</p>
      </div>
      <ul class="list-table">
        <li 
        v-for="(font, index) in list" 
        v-bind:key="index"
        v-bind:class="{ selected: index == selected_index}"
        @click="fontClicked(index)"
        >{{font}}</li>
      </ul>
    </div>

    <!-- right section -->
    <div class="screen__right">
      <!-- preview -->
      <div class="preview-title">
        <p>Preview</p>
      </div>
      <div class="preview-img">

      </div>

      <div class="btn-settings">
        <img src="./assets/settings.png" alt="settings" />
      </div>

      <div class="btn-apply">
        <p>apply</p>
      </div>
    </div>
  </div>
</template>

<script>
import { readDir } from "@tauri-apps/api/fs";

export default {
  mounted: function() {
    readDir("../fonts").then((result) => {
      if(result == [])
        this.popup_show = true

    
    });
  },

  
  data:()=> {
    return {
      popup_show: true,

      popup:{
        title: "Error",
        message: "Fonts are not found",
        specific: "Please check 'fonts' folder "
      },

      list:[
        "Default", "bbb", "ccc"
      ],

      selected_index: 0

      
    }
  },

  methods:{
    popUpClose: function(){
      this.popup_show = false;
    },

    fontClicked: function(index){
      this.selected_index = index

      console.log(index)
    }
  }


};
</script>

<style>
#screen {
  width: 100vw;
  height: 100vh;

  display: flex;
}

.pop-up{
  position: absolute;

  width: 450px;
  height: 300px;

  border-radius: 15px;
  transform: translate(35%, 25%);

  background-color: rgb(255, 255, 255);
  box-shadow: 1px 1px 60px -10px rgba(0,0,0,0.25);
  z-index: 999;
}

.pop-title{
  width: 450px;
  height: 35px;

  line-height: 35px;
  background-color: rgb(246, 246, 246);
}

.pop-title > p{
    color: red;
    padding-left: 10px;
}

.pop-body{
  width: 450px;
  height: 265px;
}

.pop-body > p{
  margin-left: 10px;
}

.screen__left {
  width: 225px;
  height: 100%;
}

.list-title {
  font-family: "JetBrains Mono", monospace;

  width: 225px;
  height: 30px;

  line-height: 30px;

  background-color: rgb(230, 230, 230);
}

.list-title > p {
  margin: 5px;
}

.list-table{
  display: block;

  width: 99%;
  height: 450px;

  margin-top: 1px;
  padding-left: 0;

  border: 1px solid rgb(231, 231, 231);
  
}

.list-table > li{
  cursor: pointer;
  border-radius: 3px;
  transition: 0.15s ease-in-out;
}

.list-table > li:hover{
  background-color: rgb(233, 240, 255);
  transform: scale(0.99);
}

.list-table > .selected{
  background-color: rgb(154, 203, 243);
}

.list-table > .selected:hover{
  background-color: rgb(137, 202, 255)
}

.btn-popup-close {
  width: 70px;
  height: 35px;

  border-radius: 8.5px;

  float: right;
  margin-top: 150px;
  margin-right: 20px;

  cursor: pointer;
  background-color: rgb(240, 240, 240);
  transition: 0.2s ease-in-out;
}

.btn-popup-close > p{
  display: block;
  
  margin: 0;
  text-align: center;
  line-height: 35px;
}

.btn-popup-close:hover {
  background-color: rgb(226, 225, 225);
}

.preview-title{
  width: 540px;
  height: 30px;

  margin-left: 15px;

  background-color: rgb(122, 209, 100);
}

.preview-title > p{
  margin: 5px;
  line-height: 30px;
}

.preview-img{
  width: 540px;
  height: 305px;

  margin-top: 1px;
  margin-left: 15px;
  background-color: rgb(248, 245, 245);
}


.btn-settings {
  width: 35px;
  height: 35px;

  margin: 10px;

  cursor: pointer;
  border-radius: 35px;
  background-color: rgb(240, 240, 240);
  transition: 0.2s ease-in-out;
}

.btn-settings:hover {
  background-color: rgb(226, 225, 225);
}

.btn-settings > img {
  width: 25px;
  height: 25px;

  margin-top: 5px;
  margin-left: 5px;

  opacity: 30%;
}

.btn-apply{
  width: 85px;
  height: 35px;

  float: right;

  margin-top: 45px;
  margin-right: 25px;

  line-height: 35px;
  text-align: center;
  
  border: 1px solid rgb(167, 167, 167);
  border-radius: 6px;
  background-color: rgb(231, 231, 231);
  
  transition: 0.2s ease-in-out;
}

.btn-apply:hover{
  cursor: pointer;

  background-color: rgb(206, 206, 206);
}

.btn-apply > p{
  margin: 0px;
}

.screen__right {
  width: 575px;
  height: 100%;
}
</style>
