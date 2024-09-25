<template>

  <div class="app-container">

    <!-- /*  *********************************************  */ -->
    <el-form :model="queryParams"
             ref="queryForm"
             size="small"
             :inline="true"
             v-show="showSearch"
             label-width="68px">
      <el-form-item label="商品名称"
                    prop="name">
        <el-input v-model="queryParams.name"
                  placeholder="请输入商品名称"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="内部名称"
                    prop="internalName">
        <el-input v-model="queryParams.internalName"
                  placeholder="请输入商品内部名称以及发货名称"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="商品分类"
                    prop="categoryId">
        <el-select v-model="queryParams.categoryId"
                   placeholder="请选择商品分类"
                   clearable>
          <el-option v-for="dict in dict.type.sys_product_type"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="商品归属"
                    prop="commodityOwnership">
        <el-input v-model="queryParams.commodityOwnership"
                  placeholder="请输入商品归属"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="广告域名"
                    prop="domainName">
        <el-input v-model="queryParams.domainName"
                  placeholder="请输入链接广告域名"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="创建时间"
                    prop="createdAt">
        <el-date-picker clearable
                        v-model="queryParams.createdAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="像素ID"
                    prop="pixelId">
        <el-input v-model="queryParams.pixelId"
                  placeholder="请输入像素ID"
                  clearable
                  @keyup.enter.native="handleQuery" />
      </el-form-item>

      <el-form-item label="商品状态"
                    prop="status">

        <div>
          <el-radio-group v-model="queryParams.status">
            <el-radio-button label=""
                             @click=" this.queryParams.status = null ;  ">
              全部商品</el-radio-button>
            <el-radio-button label="0"
                             @click="this.queryParams.status = 0;  ">上架中...</el-radio-button>
            <el-radio-button label="1"
                             @click=" this.queryParams.status = 1;  ">
              下架中...</el-radio-button>

          </el-radio-group>
        </div>

      </el-form-item>

      <el-form-item>
        <el-button type="primary"
                   icon="el-icon-search"
                   size="mini"
                   @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh"
                   size="mini"
                   @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10"
            class="mb8">
      <el-col :span="1.5">
        <el-button type="primary"
                   plain
                   icon="el-icon-plus"
                   size="mini"
                   @click="handleAdd"
                   v-hasPermi="['system:products:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success"
                   plain
                   icon="el-icon-edit"
                   size="mini"
                   :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['system:products:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger"
                   plain
                   icon="el-icon-delete"
                   size="mini"
                   :disabled="multiple"
                   @click="handleDelete"
                   v-hasPermi="['system:products:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning"
                   plain
                   icon="el-icon-download"
                   size="mini"
                   @click="handleExport"
                   v-hasPermi="['system:products:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch"
                     @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading"
              :data="productsList"
              @selection-change="handleSelectionChange">

      <el-table-column type="selection"
                       width="55"
                       align="center" />
      <el-table-column label="商品ID"
                       align="center"
                       prop="id" />
      <el-table-column label="商品名称"
                       align="center"
                       prop="name" />
      <el-table-column label="商品内部名称以及发货名称"
                       align="center"
                       prop="internalName" />
      <el-table-column label="商品分类"
                       align="center"
                       prop="categoryId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_product_type"
                    :value="scope.row.categoryId" />
        </template>
      </el-table-column>
      <el-table-column label="商品归属"
                       align="center"
                       prop="commodityOwnership" />
      <el-table-column label="链接广告域名"
                       align="center"
                       prop="domainName" />
      <el-table-column label="采购价格"
                       align="center"
                       prop="costPrice" />
      <el-table-column label="采购链接"
                       align="center"
                       prop="purchasingLinks" />
      <el-table-column label="商品描述"
                       align="center"
                       prop="description" />
      <el-table-column label="主图"
                       align="center"
                       prop="mainImage"
                       width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.mainImage"
                         :width="50"
                         :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="主页详情图"
                       align="center"
                       prop="images"
                       width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.images"
                         :width="50"
                         :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="商品状态"
                       align="center">
        <template slot-scope="scope">
          {{scope.row.status == 1 ? "下架中..." : "上架中..."}}
        </template>
      </el-table-column>

      <el-table-column label="创建时间"
                       align="center"
                       prop="createdAt"
                       width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="是否删除"
                       align="center"
                       prop="isDeleted" /> -->
      <el-table-column label="像素ID"
                       align="center"
                       prop="pixelId" />
      <el-table-column label="操作"
                       align="center"
                       class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdateProducts(scope.row)"
                     v-hasPermi="['system:products:edit']"> {{scope.row.status == 1?"上架":"下架"}} </el-button>
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['system:products:edit']">修改</el-button>

          <el-button size="mini"
                     type="text"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)"
                     v-hasPermi="['system:products:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改商品对话框 -->
    <el-dialog :title="title"
               :visible.sync="open"
               width="80%"
               append-to-body>

      <el-tabs v-model="activeName"
               @tab-click="handleClick">
        <el-tab-pane label="商品管理"
                     name="0">

          <el-form ref="form"
                   :model="form"
                   :rules="rules"
                   label-width="80px">
            <el-form-item label="商品名称"
                          prop="name">
              <el-input v-model="form.name"
                        placeholder="请输入商品名称" />
            </el-form-item>
            <el-form-item label="内部名称"
                          prop="internalName">
              <el-input v-model="form.internalName"
                        placeholder="请输入商品内部名称以及发货名称" />
            </el-form-item>
            <el-form-item label="商品分类 "
                          prop="categoryId">
              <el-select v-model="form.categoryId"
                         placeholder="请选择商品分类 ">
                <el-option v-for="dict in dict.type.sys_product_type"
                           :key="dict.value"
                           :label="dict.label"
                           :value="parseInt(dict.value)"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="商品归属"
                          prop="commodityOwnership">
              <el-input v-model="form.commodityOwnership"
                        placeholder="请输入商品归属" />
            </el-form-item>
            <el-form-item label="广告域名"
                          prop="domainName">
              <el-input v-model="form.domainName"
                        placeholder="请输入链接广告域名" />
            </el-form-item>
            <el-form-item label="采购价格"
                          prop="costPrice">
              <el-input v-model="form.costPrice"
                        placeholder="请输入采购价格" />
            </el-form-item>
            <el-form-item label="采购链接"
                          prop="purchasingLinks">
              <el-input v-model="form.purchasingLinks"
                        placeholder="请输入采购链接" />
            </el-form-item>
            <el-form-item label="商品描述"
                          prop="description">
              <el-input v-model="form.description"
                        type="textarea"
                        placeholder="请输入内容" />
            </el-form-item>
            <el-form-item label="主图"
                          prop="mainImage">
              <image-upload v-model="form.mainImage" />
            </el-form-item>

            <el-form-item label="详情图"
                          prop="images">
              <image-upload v-model="form.images"
                            :limit="50"
                            accept="*.*"
                            drag="true" />
            </el-form-item>
            <el-form-item label="像素ID"
                          prop="pixelId">
              <el-input v-model="form.pixelId"
                        placeholder="请输入像素ID" />
            </el-form-item>
            <br>

            <el-button type="primary"
                       @click="submitForm()">确 定</el-button>
            <el-button @click="cancel()">取 消</el-button>

          </el-form>

        </el-tab-pane>
        <el-tab-pane label="添加属性"
                     name="1">

          <el-form :model="dynamicValidateForm"
                   ref="dynamicValidateForm"
                   align="center"
                   class="demo-dynamic">

            <el-form-item prop="value"
                          label="请设置【规格/大小/型号/分类...】" />

            <el-input v-model="dynamicValidateForm.productAttribute"></el-input> <br><br><br>

            <!-- ---------------------------------------------------- -->
            <el-form-item v-for="(domain, index) in dynamicValidateForm.domains"
                          :label="'domains.' + index + '.value'"
                          :key="domain.key"
                          prop="domains.value">

              <el-input v-model="dynamicValidateForm.domains[index].value"></el-input>

              <el-form-item label='商品属性图'
                            prop="domain.attributeImage">
                <image-upload v-model="domain.attributeImage" />
              </el-form-item>

              <el-button @click.prevent="removeDomain(domain)">删除</el-button>

            </el-form-item>

            <!-- /** */ -->
            <el-form-item>
              <el-button type="primary"
                         @click="submitFormforAttribute(dynamicValidateForm)">提交</el-button>
              <el-button @click="addDomain">新增域名</el-button>

            </el-form-item>
          </el-form>
        </el-tab-pane>
        <el-tab-pane label="添加SKU"
                     name="2">
          <!-- <div slot="footer" -->
          <!-- class="dialog-footer"> -->

          <!-- </div> -->
        </el-tab-pane>

      </el-tabs>

    </el-dialog>
  </div>
</template>

<script>
import { listProducts, getProducts, delProducts, addProducts, updateProducts } from "@/api/system/products";
import { listAttribute, getAttribute, delAttribute, addAttribute, updateAttribute } from "@/api/system/attribute";
export default {
  name: "Products",
  dicts: ['sys_product_type'],

  data () {
    return {

      //添加属性参数
      dynamicValidateForm: {
        domains: [{
          value: '',
          attributeImage: ''
        }],
        productAttribute: ''
      },

      // 步骤条参数
      activeName: 0,

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
      // 商品表格数据
      productsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        internalName: null,
        categoryId: null,
        commodityOwnership: null,
        domainName: null,
        status: null,
        createdAt: null,
        pixelId: null
      },

      //当前用户名
      userName: null,

      // 表单参数
      form: {
        id: ""
      },
      //商品表单参数
      attributeform: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "商品名称不能为空", trigger: "blur" }
        ],
        internalName: [
          { required: true, message: "商品内部名称以及发货名称不能为空", trigger: "blur" }
        ],
        categoryId: [
          { required: true, message: "商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 不能为空", trigger: "change" }
        ],
        commodityOwnership: [
          { required: true, message: "商品归属不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "商品状态不能为空", trigger: "change" }
        ],
        isDeleted: [
          { required: true, message: "是否删除不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created () {
    this.getList();
    // this.userName = this.$store.state.user.name

  },

  // mounted () {
  //   this.initDragSort();
  // },

  methods: {


    /** 查询商品列表 */
    getList () {

      this.loading = true;
      listProducts(this.queryParams).then(response => {
        this.productsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel () {
      this.open = false;
      this.reset();
    },
    //商品属性表单重置
    attributeform () {
      this.attributeform = {
        id: null,
        attributeDescribed: null,
        productId: null,
        attributeName: null
      }
      this.resetForm("attributeform");
    },
    // 表单重置
    reset () {
      this.form = {
        id: null,
        name: null,
        internalName: null,
        categoryId: null,
        commodityOwnership: null,
        domainName: null,
        costPrice: null,
        purchasingLinks: null,
        description: null,
        mainImage: null,
        images: null,
        status: null,
        createdAt: null,
        isDeleted: null,
        pixelId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery () {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery () {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd () {
      this.reset();
      this.form.commodityOwnership = this.$store.state.user.name
      this.open = true;
      this.title = "添加商品";
    },
    /** 修改按钮操作 */
    handleUpdate (row) {
      this.reset();
      const id = row.id || this.ids

      getProducts(id).then(response => {
        this.form = response.data;
        this.form.commodityOwnership = this.$store.state.user.name
        this.open = true;
        this.title = "修改商品";
        if (response.data.sysProductAttribute == null || response.data.sysProductAttribute == "") {
          this.resetDynamicValidateForm();
        } else {

          this.dynamicValidateForm = JSON.parse(response.data.sysProductAttribute.attributeDescribed);
          console.log(this.dynamicValidateForm);
        }
      });

    },
    // 修改商品上下架按钮
    handleUpdateProducts (row) {
      this.reset();
      const id = row.id || this.ids
      this.form = row
      this.form.status = (row.status == 1 ? 0 : 1)
      updateProducts(this.form).then(response => {
        this.$modal.msgSuccess("修改成功");
        this.getList();
      });


    },
    /** 提交按钮 */
    submitForm () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateProducts(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.form.id = this.generateRandomID();

            console.log(this.form);
            alert(this.form.id);
            addProducts(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete (row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除商品编号为"' + ids + '"的数据项？').then(function () {
        return delProducts(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport () {
      this.download('system/products/export', {
        ...this.queryParams
      }, `products_${new Date().getTime()}.xlsx`)
    },
    // 步骤条参数方法
    handleClick (tab, event) {
      console.log(tab, event);
    },
    resetDynamicValidateForm () {
      this.dynamicValidateForm = {
        domains: [{
          value: '',
          attributeImage: ''
        }],
        productAttribute: ''
      }
    },

    //商品属性提交............................................................
    submitFormforAttribute () {
      // this.$refs["form"].validate(valid => {
      // if (valid) {
      //   if (this.form.id != null) {
      //     updateProducts(this.attributeform).then(response => {
      //       this.$modal.msgSuccess("修改成功");
      //       this.open = false;
      //       this.getList();
      //     });
      //   } else {
      //     this.form.id = this.generateRandomID();
      // this.attributeform.id = this.enerateRandomID();
      // this.attributeform.attributeName = this.dynamicValidateForm.productAttribute
      this.attributeform.productId = this.form.id;
      this.attributeform.attributeDescribed = JSON.stringify(this.dynamicValidateForm)
      console.log(this.form);
      alert(this.form.id);
      addAttribute(this.attributeform).then(response => {
        this.$modal.msgSuccess("新增成功");
        this.open = false;
        this.getList();
      });
      // }
      // }
      // });
    },


    // submitFormforAttribute (dynamicValidateForm) {
    //   this.attributeform.attributeName = dynamicValidateForm.productAttribute
    //   this.attributeform.attributeDescribed = JSON.stringify(dynamicValidateForm.domains)
    //   this.attributeform.productId = this.form.id
    //   alert(this.attributeform.productId)
    //   this.attributeform.id = generateRandomID();
    //   this.$refs["form"].validate(valid => {
    //     if (valid) {
    //       if (this.form.id != null) {
    //         addAttribute(this.attributeform).then(response => {
    //           this.$modal.msgSuccess("修改成功");
    //         });
    //       }
    //     } else {
    //       this.$modal.msgSuccess("请检查其他选项是否填写完整~");
    //     }
    //   })
    // },


    //随机id 生产
    generateRandomID () {
      const characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      const idLength = 15; // 字符串长度 这里生成30位的
      let randomID = '';

      for (let i = 0; i < idLength; i++) {
        const randomIndex = Math.floor(Math.random() * characters.length);
        randomID += characters.charAt(randomIndex);
      }

      return randomID;
    },

    removeDomain (item) {
      var index = this.dynamicValidateForm.domains.indexOf(item)
      if (index !== -1) {
        this.dynamicValidateForm.domains.splice(index, 1)
      }
    },
    addDomain () {
      this.dynamicValidateForm.domains.push({
        value: '',
        attributeImage: '',
        key: Date.now()
      });
    }
  }
};
</script>

<style>
.el-upload-list__item.is-success.focusing .el-icon-close-tip {
  display: none !important;
}

.el-upload__tip {
  display: none !important;
}
</style>