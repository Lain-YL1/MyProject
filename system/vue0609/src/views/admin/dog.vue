<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="名称" prop="dogName">
          <el-input
            v-model="queryParams.dogName"
            placeholder="请输入名称"
            clearable
            size="small"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="品种" prop="dogType">
          <el-select v-model="queryParams.dogType" placeholder="请选择状态" clearable size="small">
            <el-option
              v-for="dict in dogTypes"
              :key="dict.typeId"
              :label="dict.typeName"
              :value="dict.typeId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="dogStatus">
          <el-select v-model="queryParams.dogStatus" placeholder="请选择状态" clearable size="small">
            <el-option
              v-for="dict in dict.type.sys_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="领养人ID" prop="dogBelongUserId">
          <el-input
            v-model="queryParams.dogBelongUserId"
            placeholder="请输入领养人ID"
            clearable
            size="small"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
  
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
  
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
    
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
          >删除</el-button>
        </el-col>

        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
  
      <el-table v-loading="loading" :data="dogList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="动物ID" align="center" prop="dogId" />
        <el-table-column label="名称" align="center" prop="dogName" />
        <el-table-column label="品种" align="center" prop="dogTypeStr" />
        <el-table-column label="年龄" align="center" prop="dogYear" />
        <el-table-column label="状态" align="center" prop="dogStatus">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_status" :value="scope.row.dogStatus"/>
          </template>
        </el-table-column>
        <el-table-column label="领养人ID" align="center" prop="dogBelongUserId" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              v-if="scope.row.dogStatus == 1"
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="success(scope.row)"
  
            >审核通过</el-button>
            <el-button
            v-if="scope.row.dogStatus  == 1"
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="fail(scope.row)"
  
            >审核失败</el-button> 
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
          
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
     
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
  
      <!-- 添加或修改dog对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
          <el-form-item label="名称" prop="dogName">
            <el-input :disabled="form.dogId !=null" v-model="form.dogName" placeholder="请输入名称" />
          </el-form-item>
          <el-form-item label="详情">
            <editor v-model="form.dogContext" :min-height="192"/>
          </el-form-item>
          <el-form-item label="品种" prop="dogType">
            <el-select :disabled="form.dogId !=null" v-model="form.dogType" placeholder="请选择状态" clearable size="small">
              <el-option
                v-for="dict in dogTypes"
                :key="dict.typeId"
                :label="dict.typeName"
                :value="dict.typeId"
              />
            </el-select>
    
          </el-form-item>
          <el-form-item label="年龄" prop="dogYear">
            <el-input type="number" v-model="form.dogYear" placeholder="请输入年龄" />
          </el-form-item>
          <el-form-item label="主图">
          <image-upload :limit=1 v-model="form.dogImg"/>
        </el-form-item>
          <el-form-item label="状态" prop="dogStatus">
            <el-select v-model="form.dogStatus" placeholder="请选择状态">
              <el-option
                v-for="dict in dict.type.sys_status"
                :key="dict.value"
                :label="dict.label"
  :value="dict.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="领养人ID" prop="dogBelongUserId">
            <el-input :disabled="form.dogId !=null" v-model="form.dogBelongUserId" placeholder="请输入领养人ID" />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import { listDog, getDog, delDog, addDog, updateDog } from "@/api/system/dog";
  import { listType, getType } from "@/api/system/type";
  export default {
    name: "Dog",
    dicts: ['sys_status'],
    data() {
      return {
        dogTypes:[],
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // dog表格数据
        dogList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          dogName: null,
          dogType: null,
          dogStatus: null,
          dogBelongUserId: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          dogName: [
            { required: true, message: "名称不能为空", trigger: "blur" }
          ],
          dogContext: [
            { required: true, message: "详情不能为空", trigger: "blur" }
          ],
          dogType: [
            { required: true, message: "品种不能为空", trigger: "blur" }
          ],
          dogYear: [
            { required: true, message: "年龄不能为空", trigger: "blur" }
          ],
          dogStatus: [
            { required: true, message: "状态不能为空", trigger: "change" }
          ],
          dogImg: [
          { required: true, message: "主图不能为空", trigger: "blur" }
        ]
        }
      };
    },
    created() {
      this.getList();
      listType().then(res=>{
        this.dogTypes = res.rows;
      })
    },
    methods: {
      /** 查询dog列表 */
      getList() {
        this.loading = true;
        listDog(this.queryParams).then(response => {
          this.dogList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          dogId: null,
          dogName: null,
          dogContext: null,
          dogType: null,
          dogYear: null,
          dogStatus: null,
          dogBelongUserId: null,
          gmtCreate: null,
          gmtUpdate: null,
          deleted: null,
          version: null
        };
        this.resetForm("form");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.dogId)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const dogId = row.dogId || this.ids
        getDog(dogId).then(response => {
          this.form = response.data;
          this.form.dogType = parseInt(this.form.dogType);
          this.form.dogStatus = this.form.dogStatus+"";
          this.open = true;
          this.title = "修改";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.dogId != null) {
              updateDog(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addDog(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const dogIds = row.dogId || this.ids;
        this.$modal.confirm('是否确认删除？').then(function() {
          return delDog(dogIds);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      success(row){
        this.$confirm('通过此请求吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          updateDog({dogId:row.dogId,dogStatus:2}).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
        }).catch(() => {
           
        });
      },
      fail(row){
        this.$confirm('拒绝此请求吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          updateDog({dogId:row.dogId,dogStatus:3}).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
        }).catch(() => {
               
        });
      }
    }
  };
  </script>