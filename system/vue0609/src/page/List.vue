<template>
  <div class="home">
    <div data-server-rendered="true" id="__nuxt">
      <!---->
      <div id="__layout">
        <div data-fetch-key="0" class="app light macwk-animation">
          <top :message2="acticve" />
          <div class="app-main mobile-layout">
            <div class="w-full bg auto d-flex layout-min-full-height" :class="gridOrlist">
              <div class="app-sidebar pc-model">
                <div class="pr-3 pl-2">
                  <p class="fs-12 opacity-40 mb-0 pt-1">流浪动物领养</p>
                  <div class="macwk-sidebar mb-4 vsm_expanded">
                    <div class="vsm--scroll-wrapper">
                      <div class="vsm--list">
                        <div class="vsm--item" @click="getList()">
                          <span role="link" class="vsm--link vsm--link_level-1"
                            :class="{ ' vsm--link_active': allIndex }"><span class="vsm--title">动物</span>
                            <!----></span>
                          <!---->
                        </div>
                       
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="app-content pc-model">
                <div class="app-content-main">
                  <div class="app-content-list">
                    <div class="app-content-header">
                      <div class="main-title">
                        <h5 class="i-con-h-a">
                          爱心领养
                          <span class="text-muted fs-13 v-1 ml-1">
                            {{ this.ResourceNumber }}
                          </span>
                        </h5>
                      </div>
                      
                      <div class="target-blank">
                        <div role="switch" class="el-switch mr-6" style="margin-top: -3px">
                          <input type="checkbox" name="" true-value="true" class="el-switch__input" />
                          <!---->
                          <!-- <div>
                            <el-switch v-model="istargetjudje" @change="istargetJudje()" active-color="#13ce66"
                              inactive-color="#ff4949">
                            </el-switch>
                          </div>

                          <span class="el-switch__label el-switch__label--right"><span
                              aria-hidden="true">新窗口打开</span></span> -->
                        </div>
                        <div style="width:600px">
                          <el-select v-model="listQuery.dogType" placeholder="请选择品种" clearable size="small">
                            <el-option
                              v-for="dict in dogTypes"
                              :key="dict.typeId"
                              :label="dict.typeName"
                              :value="dict.typeId"
                            />
                          </el-select>
                          <el-button style="display: inline-block;margin-left: 10px;" type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                      </div>
                      </div>
                
                    </div>
                
                    <div id="listAppContainer" class="app-content-body listAppContainer">
                      <div class="mw-row">
                          <template>
                            <div v-for="item, index in list" :key="item.dogId"
                              class="mw-col list-animation-leftIn delay-3">
                              <!-- <div v-if="!glabledata.glableImageFormat"> -->
                                <div v-if="item.dogStatus==2">
                                  <router-link :target="istarget" :to="'/list/' + item.dogId">
                                    <a class="macwk-app border white cursor-pointer">
                                      <image-preview :src="item.dogImg" :width="250" :height="250"/>

                                      <div class="macwk-app__body">
                                      
                                        <h3 class="heading-tertiary-list">{{ item.dogName }}</h3>
                                      </div>
                                      <div class="extend">
                                        <div class="button">
                                          <div style="margin-left:12px">
                                            <span style="font-size: 36px;line-height: 1;">

                                              <i data-v-1c369514="" class="light-icon-more icon-next-arrow"></i>
                                            </span>
                                          </div>

                                          <div style="margin-right:12px">
                                            <span class="value">品种：{{ item.dogTypeStr }}</span>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="macwk-app__footer">
                                        <div v-show="showfootnext" class="macwk-app__footer--more">
                                          <i class="light-icon-more icon-next-arrow"></i>
                                        </div>
                                      </div>
                                    </a>
                                  </router-link>
                                </div>
                             

                            </div>
                          </template>                   
                      </div>
                    </div>
                    <!---->
                    <pagination class="app-content-bottom" v-show="total > 0" :background="false" :total="total"
                      :page.sync="listQuery.page" :limit.sync="listQuery.limit"  @pagination="getList"/>
                  </div>
                 
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import "../static/mycss/body.css";
import top from './components/Top.vue'
import foot from './components/Foots.vue'
import { formatDate} from '@/utils/date.js'
import { listType, getType } from "@/api/system/type";
import Pagination from '@/components/Pagination'
import { mapState } from 'vuex'
import { listDog } from "@/api/system/dog";
export default ({
  name: 'List',
  components: { top, foot, Pagination },
  computed: {
    ...mapState(['playlist', 'glabledata', 'count'])
  },
  data() {
    return {
      dogTypes:[],

      loading: true,
      list: "",
      listQuery: {
        page: 1,
        limit: 20
      },
      // listQueryClass: {
      //   page: 1,
      //   limit: 20,
      //   class: ""
      // },
      total: 0,
   
      gridOrlist: "grid-grid",
    
    }
  },
  created() {
    this.getList()
    listType().then(res=>{
        this.dogTypes = res.rows;
      })
    // this.getNumber()
  },
  filters: {
   
  },
  methods: {
   

    formatDate(time) {
      let data = new Date(time)
      return formatDate(data, 'yyyy-MM-dd ')
    },
   
    handleQuery(){
      this.getList();
    },
   
    getList() {
      this.allIndex = true
      this.clickIndex = false
      this.listQuery.pageNum = this.listQuery.page;
      this.listQuery.pageSize = this.listQuery.limit;
      this.listQuery.dogStatus =2;
      listDog(this.listQuery).then(response => {
        console.log(response);
          this.list = response.rows;
          this.template = response.rows
          this.total = response.total;
          this.loading = false;
        });
    },
  }
})
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.macwk-app__body {
  padding: 13px 9px 5px;
}

.macwk-animation .delay-3 {
  border-radius: 8px 8px 0px 0px;
}

.listtitleimg {
  height: 155px;
  width: 100%;
}
</style>

<style lang="scss" scoped>
.delay-3 {
  ::v-deep {
    .el-image__inner {
      border-radius: 8px 8px 0px 0px;
    }
  }
}

.delayImg {
  height: 155px;
  width: 100%;
  border-radius: 8px 8px 0px 0px;
}

.app-content-main .app-content-bottom {
  border-radius: 15px;
}

.heading-tertiary-list {
  font-size: 15px;
  line-height: 23px;
  font-weight: 670;
  text-overflow: -o-ellipsis-lastline;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  line-clamp: 2;
  -webkit-box-orient: vertical;
}

.card-meta {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  border-bottom: 1px solid #dcdcdc;
  padding-bottom: 1px;
  margin-bottom: 3px;
}

.post-author {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}

.meta-item {
  margin-right: 18px;
  position: relative;
  font-size: 14px;
}

.author-name {
  font-size: 12px;
  font-weight: 600;
  font-family: "Advent Pro", sans-serif;
  color: #222;
}

.value {
  font-size: 15px;
  font-weight: 700;
  line-height: 10px;
  letter-spacing: 0.0015em;
  color: #50A0FF;
}

.button {
  display: flex;
  font-size: 16px;
  font-weight: 700;
  font-family: "Titillium Web", sans-serif;
  flex-direction: row;
  flex-wrap: nowrap;
  align-content: center;
  justify-content: space-between;
  align-items: center;
}

.meta-item:not(:last-child)::after {
  content: "";
  width: 5px;
  height: 5px;
  background-color: #177ef7;
  border-radius: 50%;
  position: absolute;
  right: -15px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}
</style>
<style  scoped>
.gaosiImg {
  filter: blur(20px) opacity(70%) brightness(110%);
  transition: .3s;
  ;
  z-index: 8
}

.dingweiImg,
.recommendDingweiImg {
  position: absolute;
  top: 15px !important;
  left: 20px !important
}

.img72,
.imgQueXing3 {
  width: 72px;
  height: 72px;
}

.margin-top-90 {
  margin-top: 90px;
}

.text-block {
  color: #3c4248;
}

.text-bold {
  font-weight: 700;
}

.size-18 {
  font-size: 18px;
}

.margin-top {
  margin-top: 10px;
}

.cursor {
  cursor: pointer;
}

.padding-xl {
  padding: 20px;
}

.text-B6BABF {
  color: #b6babf;
}

.size-14 {
  font-size: 14px;
}

.margin-top {
  margin-top: 10px;
}

.limitText {
  max-width: 180px;
  height: 20px;
  overflow: hidden;
}

.flex-row {
  display: flex;
  flex-direction: row !important;
}

.size-12 {
  font-size: 12px;
}

.margin-top2 {
  margin-top: 20px;
}

.home /deep/ .el-skeleton {
  display: flex;
  flex-wrap: wrap;
}
</style>