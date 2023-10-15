<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="狗ID" prop="dogId">
          <el-input
            v-model="queryParams.dogId"
            placeholder="请输入狗ID"
            clearable
            size="small"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
  
        <el-form-item label="狗名称" prop="dogName">
          <el-input
            v-model="queryParams.dogName"
            placeholder="请输入狗名称"
            clearable
            size="small"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="状态" prop="dogOrderStatus">
          <el-select v-model="queryParams.dogOrderStatus" placeholder="请选择状态" clearable size="small">
            <el-option
              v-for="dict in dict.type.sys_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
  
      <el-row :gutter="10" class="mb8">
       
        <!-- <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
      
          >删除</el-button>
        </el-col> -->

        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
  
      <el-table v-loading="loading" :data="dogOrderList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="领养订单" align="center" prop="dogOrderId" />
        <el-table-column label="狗ID" align="center" prop="dogId" />
        <el-table-column label="用户ID" align="center" prop="dogUserId" />
        <el-table-column label="狗名称" align="center" prop="dogName" />
        <el-table-column label="主图" align="center" prop="dogImg" width="100">
       
        <template slot-scope="scope">
          <image-preview :src="scope.row.dogImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="理由" align="center" prop="dogOrderReason" />
        <el-table-column label="状态" align="center" prop="dogOrderStatus">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_status" :value="scope.row.dogOrderStatus"/>
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
  
    </div>
  </template>
  
  <script>
  import { listDogOrder,listDogOrderMy, getDogOrder, delDogOrder, addDogOrder, updateDogOrder } from "@/api/system/dogOrder";
  
  export default {
    name: "DogOrder",
    dicts: ['sys_status'],
    data() {
      return {
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
        // dogOrder表格数据
        dogOrderList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          dogId: null,
          dogUserId: null,
          dogName: null,
          dogOrderStatus: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          dogId: [
            { required: true, message: "狗ID不能为空", trigger: "blur" }
          ],
          dogUserId: [
            { required: true, message: "用户ID不能为空", trigger: "blur" }
          ],
          dogName: [
            { required: true, message: "狗名称不能为空", trigger: "blur" }
          ],
          dogOrderStatus: [
            { required: true, message: "状态不能为空", trigger: "change" }
          ],
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询dogOrder列表 */
      getList() {
        this.loading = true;
        listDogOrderMy(this.queryParams).then(response => {
          this.dogOrderList = response.rows;
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
          dogOrderId: null,
          dogId: null,
          dogUserId: null,
          dogName: null,
          dogOrderStatus: null,
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
        this.ids = selection.map(item => item.dogOrderId)
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
        const dogOrderId = row.dogOrderId || this.ids
        getDogOrder(dogOrderId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.dogOrderId != null) {
              updateDogOrder(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addDogOrder(this.form).then(response => {
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
        const dogOrderIds = row.dogOrderId || this.ids;
        this.$modal.confirm('是否确认删除？').then(function() {
          return delDogOrder(dogOrderIds);
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
          updateDogOrder({dogOrderId:row.dogOrderId,dogOrderStatus:2}).then(response => {
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
          updateDogOrder({dogOrderId:row.dogOrderId,dogOrderStatus:3}).then(response => {
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