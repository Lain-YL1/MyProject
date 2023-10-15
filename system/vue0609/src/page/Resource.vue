<template>
  <div class="Resource">
    <div data-server-rendered="true" id="__nuxt">
      <!---->
      <div id="__layout">
        <div data-fetch-key="0" class="app light macwk-animation">
          <top :message2="acticve" />
          <div class="overflow-hidden pt-5">
            <div class="layout-header pt-5 pb-5 position-relative pc-model">
              <!-- ../static/image/loding.gif -->
              <div>
                <img src="../static/image/shape-1.svg" class="shape-three" /><img src="../static/image/shape-55.svg"
                  class="shape-four" /><img src="../static/image/shape-56.svg" class="shape-five" /><img
                  src="../static/image/shape-57.svg" class="shape-six" /><img src="../static/image/shape-58.svg"
                  class="shape-seven" /><img src="../static/image/shape-59.svg" class="shape-eight" /><img
                  src="../static/image/shape-60.svg" class="shape-nine" /><img src="../static/image/shape-61.svg"
                  class="shape-ten" /><img src="../static/image/shape-62.svg" class="shape-eleven" /><img
                  src="../static/image/shape-10.svg" class="shape-10" /><img src="../static/image/shape-11.svg"
                  class="shape-11" />
              </div>
              <div class="container">
                <div class="row align-items-center">
                  <div class="col-xs-12 col-lg-6 col-xl-6">
                    <div class="header-app">
                      <img class="app-icon mr-24" />
                      <div class="list-body">

                        <h3 style="font-size: 30px;font-weight: 700;
text-rendering: optimizeLegibility;"> {{ this.title }}</h3>
                        <!-- <p style="font-size: 15px;
line-height: 28px;font-weight: 400;" class="mg-bt-42">{{ this.intro }}</p> -->

                        <div class="infor-bid">
                          <div >
                            <div class="content-left">
                              <h6>品种</h6>
                              
                              <div class="value">{{ this.price }} &#8194; &#8194;</div>
                            </div>
                          </div>
                          <!-- <div v-else>
                            <div class="content-left">
                              <div class="free-value">&#8194; &#8194;免&#8194;费</div>
                            </div>
                          </div> -->
                         
                          <div v-if="this.gmtCreate != null" class="pagi">
                            发布时间：
                            {{ formatDate(this.gmtCreate ) }}

                            {{ Theweeks }}
                          </div>
                          <div v-else class="pagi">
                            发布时间：
                            {{ formatDate(this.gmtCreate ) }}
                            {{ Theweeks }}
                          </div>
                        </div>

                        <div class="mb-15">
                          <a v-if="this.price != 0">
                            
                            <a v-if="payJudej" @click="lingyang()" data-toggle="modal" data-target="#popup_bid"
                              class="sc-button style letter style-2 style-item-details"><span
                                style="color: #ffffff;font-weight: 700;">领养</span>
                            </a>
                           
                          </a>
                  
                            
                        </div>

                      
                        <div class="mt-6 fs-13">
                          <!---->
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <div class="soft-layouts bg mb-8 pc-model">
              
              <div class="row gy-5">
                <div class="col-lg-9">
                  <div class="left-content">
                    <!-- Post card -->
                    <div class="post-card">

                      <div class="card-content">

                        <div class="post-content">
                          <div>
                            <h3 class="heading-secondary mar-left">详情</h3>
                            <div class="post-txt mar-left" id="sidelist" v-html="this.content"></div>

                          </div>
                        </div>
                      </div>
                    </div>
                    <h3>评论区</h3>
                    <div id="pinglun" ref="pinglun"  style="letter-spacing: 1px">
                      <div class="head">
                        <!-- 评论区域如果当前用户有头像则显示头像,没有则显示默认头像 -->
                        <!-- <img v-if="picture" :src="`http://` + picture" alt="" /> -->
                        <!-- <img v-else src="../../assets/头像.jpg" alt="" /> -->
                        <!-- 评论框 -->
                        <input
                          type="text"
                          placeholder="请输入评论 . . ."
                         style="width:500px"
                          v-model="firstComments"
          
                        />
                        <!-- 发布按钮 -->
                        <el-tag id="send" style="margin-left:10px;cursor: pointer;" @click="sumbitContext()">发表评论</el-tag>
                      </div>
                      <div class="content" ref="contentDiv">
                        <!-- 一级评论 -->
                        <div class="first" v-for="(item, index) in comments" :key="item.chatId">
                          <a href="javascript:;" class="first-img">
                            <!-- 如果当前用户有头像则显示头像,没有则显示默认头像 -->
                            <!-- <img :src="`http://` + item.picture" /> -->
                            <!-- <img v-if="item.picture" :src="`http://` + item.picture" alt="" /> -->
                            <!-- <img v-else src="../../assets/头像.jpg" alt="" /> -->
                          </a>
                          <div class="first-content" style="margin-top:20px">
                            <!-- 一级评论用户昵称 -->
                            <span style="font-size:20px" class="first-username">用户ID：{{ item.userId }}</span> <span style="color:red" v-if="item.chatUserRole == 77">(工作人员)</span>
                            <!-- 一级评论发布时间 -->
                            <span style="margin-left:20px" class="first-time">{{ formatDate(item.date) }}</span> <el-button size="mini" v-if="item.ifMy" @click="del(item.chatId)" type="danger" icon="el-icon-delete" circle></el-button>
                            <!-- 一级评论评论内容 -->
                            <p class="first-comment">
                              {{ item.content }}
                            </p>
                            <!-- 一级评论评论点赞 -->
                            
                          </div>
                        </div>
                        <!-- 暂无评论的空状态 -->
                        <el-empty description="暂无评论" v-if="show"></el-empty>
                      </div>
                      <pagination
                        v-show="totalChat>0"
                        :total="totalChat"
                        :page.sync="pageNumChat"
                        :limit.sync="pageSizeChat"
                        @pagination="getListChat"
                      />
                    </div>       
                    <div class="author-card">
                
                      <div class="card-text">
                        <h3 class="heading-secondary">提 示</h3>
                        <p class="body-text">
                          放弃贪婪的食欲，不再屠戮；放过弱小的生命，不再滥捕；放下嗜血的屠刀，不再滥杀。世界动物日，一起行动起来，保护动物，人人有责！
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
               
              </div>
            </div>
            <div class="mobile-model">
              <div class="
                  d-flex
                  layout-min-full-height
                  justify-content-center
                  align-items-center
                ">
                <div class="text-center" style="width: 80%; margin: 0 auto">
                  <h1 class="mb-4">哇，窗口太小啦</h1>
                  <p class="mb-6">请调整浏览器窗口大小或者请使用手机查看！</p>
                </div>
              </div>
            </div>
          
          </div>
  
        </div>
      </div>
    </div>
    <el-dialog title="领取" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="理由" prop="acticityName">
          <el-input  maxlength="50" show-word-limit v-model="order.dogOrderReason"  label="描述文字"></el-input>
        </el-form-item>
      
      </el-form>
    
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="open=false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>


import top from './components/Top.vue'
import foot from './components/Foots.vue'





import { formatDate, GetWeekdate } from '@/utils/date.js'

import router from "@/router";
import { getFoodChat,listChat, getChat, delChat, addChat, updateChat } from "@/api/system/chat";
import { listDog, getDog, delDog, addDog, updateDog,lingyang } from "@/api/system/dog";
export default {

  name: 'Resource',
  components: {
    top,
    router
  },
  watch: {
   
  },
  created() {
    //数据回填
    this.fetchData(this.$route.params.id)
  },

  methods: {

    lingyang(){
      this.open=true;
      // this.$confirm('确认申请领养?', '提示', {
      //     confirmButtonText: '确定',
      //     cancelButtonText: '取消',
      //     type: 'warning'
      //   }).then(() => {
      //     lingyang(this.dogId).then(res=>{
      //       this.$modal.msgSuccess(res.msg);
      //     })
      //   }).catch(() => {
           
      //   });
      

    },
    submitForm(){
      this.order.dogId = this.dogId;

        lingyang(this.order).then(res=>{
          this.$modal.msgSuccess(res.msg);
          this.open=false;
        })
 
    },
    formatDate(time) {
      let data = new Date(time)
      return formatDate(data, 'yyyy-MM-dd ')
    },
    //动物数据获取
    fetchData(id) {
      getDog(id).then(resp => {
          this.dogId = resp.data.dogId;
          this.thumb = resp.data.dogImg
          this.title = resp.data.dogName
          this.price = resp.data.dogTypeStr
          this.author = resp.data.dogUserId
          this.content = resp.data.dogContext
          this.intro = resp.data.dogContext
          this.gmtCreate =resp.data.gmtCreate
          this.addTime = resp.data.gmtCreate
          this.resAddress = "地址！！！"
    
        });
        getFoodChat({chatDogId:id}).then(res=>{
          this.comments = res.rows;
          this.totalChat = res.total;
          this.open = false;
  
        })  
    },
    getListChat(){
        getFoodChat({chatDogId:this.dogId,pageSize:this.pageSizeChat,pageNum:this.pageNumChat}).then(res=>{
            this.comments = res.rows;
      
          })
      },
      sumbitContext(){
        if(this.firstComments ==''){
          this.$modal.msgError("请输入内容");
          return
        }
        addChat({chatDogId:this.dogId,chatContext:this.firstComments}).then(res=>{
          this.$modal.msgSuccess("成功");
          this.firstComments="";
          getFoodChat({chatDogId:this.dogId}).then(res=>{
            this.comments = res.rows;    
            this.totalChat = res.total;
          })
        })

      },
      del(id){
        this.$confirm('删除?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          delChat(id).then(res=>{
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
            getFoodChat({chatDogId:this.dogId}).then(res=>{
            this.comments = res.rows;    
            this.totalChat = res.total;
          })
          })
          
        }).catch(() => {
                
        });
      },
  },
  data() {
    return {

      order:{},
      reason:"",
      open:false,
      num:1,

      payJudej: true,
      intro: "",
      content: "",
      price: "",
      title: "",
      dogId:null,
      acticve: 'nav-link active',

      totalChat: 0,
      pageNumChat: 1,
      pageSizeChat: 10,
      comments:"",
      firstComments:"",
    }
  },
}
</script>

<style scoped src="../static/mycss/blog.css">

</style>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import "../static/mycss/body.css";
.mar-left {
  margin-left: 15px;
}

.post-txt {
  font-size: 15px;
  font-weight: 440;
  color: #27222b;
  margin-top: 0;
  margin-bottom: 1rem;
}

.chat-container {
  z-index: 20 !important;
  border-radius: 10px !important;
  -webkit-box-shadow: 0 5px 25px 0 rgb(0 0 0 / 13%) !important;
  box-shadow: 0 5px 25px 0 rgb(0 0 0 / 13%) !important;
  background-color: #fff !important;
  width: 360px !important;
  height: 80% !important;
  left: auto !important;
  right: 20px !important;
  bottom: 20px !important;
}
</style>
  
<style scoped>
.myVEmojiPicker ::v-deep.category {
  background: none;
}

.myVEmojiPicker ::v-deep .border {
  border: 0px solid hsla(210, 8%, 51%, 0.09) !important;
}

.myVEmojiPicker ::v-deep .myVEmojiPicker[data-v-3bfe90b7] .border {
  border: 0px solid hsla(210, 8%, 51%, 0.09) !important;
}

.myVEmojiPicker ::v-deep .category.active[data-v-6d975e7c] {
  border-bottom: 3px solid #50a1ff;
}

.myVEmojiPicker ::v-deep .grid-emojis[data-v-5c988bee] {
  background: #ffffff;
}

.myVEmojiPicker ::v-deep .emoji-picker[data-v-f1d527bc] {
  --ep-color-bg: #ffffff;
  --ep-color-sbg: none;
}

.myVEmojiPicker {
  position: fixed;
  display: flex;
  flex-direction: column;
  right: 390px;
  bottom: 20px;
  z-index: 10;
}

.alipaybig_icon {
  display: inline-block;
  width: 120px;
  margin: 0;
  padding: 0;
  text-align: center;
}

.outh5 {
  padding: 0px;
  display: flex;
  align-content: flex-end;
  justify-content: center;
  flex-wrap: wrap;
}

.outh6 {
  height: 66px;
  text-align: center;
  position: absolute;
  bottom: -8px;
  left: 0;
  width: 320px;
  background-color: #01a7ef;
  padding: 7px;
  display: flex;
  align-content: flex-end;
  justify-content: center;
  flex-wrap: wrap;
  border-radius: 0 0 10px 10px;
}

.outh7 {
  height: 66px;
  text-align: center;
  position: absolute;
  bottom: -8px;
  left: 0;
  width: 320px;
  background-color: #09bb21;
  padding: 7px;
  display: flex;
  align-content: flex-end;
  justify-content: center;
  flex-wrap: wrap;
  border-radius: 0 0 10px 10px;
}
</style>
<style scoped>
.el-dialog--center {
  border-radius: 10px;
}

.el-dialog--center .el-dialog__body {
  border-radius: 10px;
  text-align: initial;
  background-color: #fff;
}

.el-dialog__header {
  display: none;
  background-color: #e0e0e0;
}
</style>
<style scoped>
.pay-button-box {
  padding: 12px 30px;
  z-index: 1;
  text-align: center;
}

.swal2-content {
  z-index: 1;
  justify-content: center;
  margin: 0;
  padding: 0;
  color: #545454;
  font-size: 1.125em;
  font-weight: 300;
  line-height: normal;
  text-align: center;
  word-wrap: break-word;
}

.pay-item {
  width: 100%;
  height: 60px;
  border: 0;
  cursor: pointer;
  font-size: 1.25rem;
  display: inline-block;
  line-height: 60px;
  text-align: center;
}

.device-macbook-pro .device-frame:before {
  bottom: 10px;
  color: #c8cacb;
  content: "IceCMS.com";
  font-size: 12px;
  height: 16px;
  left: 50%;
  line-height: 16px;
  margin-left: -100px;
  position: absolute;
  text-align: center;
  width: 200px;
  z-index: 1;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.dianzan {
  min-height: 25px;
  height: 25px;
}

.btn-outline-theme:hover .dianzan {
  min-height: 25px;
  height: 25px;
  position: relative;
  left: -80px;
  filter: drop-shadow(#fff 80px 0);
}

.soft-layouts {
  margin: 0 auto;
  overflow: hidden;
  width: 1170px;
}

.el-carousel__item[data-v-3aa17da5]:nth-child(2n + 1) {
  background-color: #d3dce6;
  border-radius: 17px;
  -webkit-animation: move 4s linear infinite both;
  -webkit-border-radius: 17px;
}

.el-carousel__item[data-v-3aa17da5]:nth-child(2n) {
  background-color: #d3dce6;
  border-radius: 17px;
  -webkit-animation: move 4s linear infinite both;
  -webkit-border-radius: 17px;
}

.is-animating {
  border-radius: 17px;
  -webkit-animation: move 4s linear infinite both;
  -webkit-border-radius: 17px;
}

.sc-button.style-item-details {
  width: 240px;
  height: 55px;
  line-height: 55px;
  padding: unset;
  text-align: center;
}

.sc-button.style-2:hover {
  background-position: right center;
}

.sc-button.style-2 {
  background-image: linear-gradient(to left, #6345ED 58.12%, #DC39FC 81.74%);
  border: unset;
  background-size: 200% auto;
}

a:hover,
a:focus {
  color: var(--primary-color3);
  text-decoration: none;
  outline: 0;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.sc-button {
  display: inline-block;
  position: relative;
  padding: 9px 22px;
  border-radius: 100px !important;
  border: 0 none;
  outline: 0 none;
  cursor: pointer;
  z-index: 1;
}

.menu-tab {
  display: flex;
  margin-bottom: 29px;
}

.titleactive {
  background-color: #6345ED;
  color: #fff;
  box-shadow: unset;
}

.menu-tab li {
  border-radius: 104px;
  padding: 8px 21px;
  font-size: 14px;
  font-weight: 700;
  margin-right: 8px;
  cursor: pointer;
  box-shadow: 4px 4px 60px rgba(99, 69, 237, 0.3);
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.author-item {
  display: flex;
  align-items: center;
}

.bid-history-list li {
  margin-bottom: 17px;
}

.infor {
  margin-top: -2px;
  display: flex;
}

.infor p {
  margin: 0 auto;
  width: 300px;

}

.btn-outline-theme {
  margin-left: 17px;
}

.btn-outline-theme {
  margin-left: 17px;
}

.btn-outline-theme:hover {
  color: #fff;
}

.dianzan:hover {
  color: #fff;
}

.fas {
  font-weight: 900;
}

.infor-bid {
  background: var(--color-4);
  box-shadow: 4px 4px 60px rgba(99, 69, 237, 0.15);
  border-radius: 8px;
  padding: 17px 31px;
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  font-size: 13px;
  margin-right: 17px;
  margin-bottom: 31px;
}

.value {
  font-size: 15px;
  font-weight: 700;
  line-height: 10px;
  letter-spacing: 0.0015em;
  color: #50A0FF;
}

@media screen and (max-width:991px) {
  .col-lg-3 {
    display: none;
  }

  .post-content {
    width: 617px;
    /* overflow: auto; */
    /* padding: 20px; */
    line-height: 1.5;
    margin-right: 50px;
  }
}

.post-content {
  width: 817px;
  /* overflow: auto; */
  /* padding: 20px; */
  line-height: 1.5;
  margin-right: 50px;
}

.free-value {
  font-size: 20px;
  font-weight: 800;
  /* line-height: 10px; */
  letter-spacing: 0.0015em;
  color: #50A0FF;
}
</style>

