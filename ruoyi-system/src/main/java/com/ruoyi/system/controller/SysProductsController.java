package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysProducts;
import com.ruoyi.system.service.ISysProductsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品Controller
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
@RestController
@RequestMapping("/system/products")
public class SysProductsController extends BaseController
{
    @Autowired
    private ISysProductsService sysProductsService;

    /**
     * 查询商品列表
     */
    @PreAuthorize("@ss.hasPermi('system:products:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysProducts sysProducts)
    {
        startPage();
        List<SysProducts> list = sysProductsService.selectSysProductsList(sysProducts);
        return getDataTable(list);
    }

    /**
     * 导出商品列表
     */
    @PreAuthorize("@ss.hasPermi('system:products:export')")
    @Log(title = "商品", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysProducts sysProducts)
    {
        List<SysProducts> list = sysProductsService.selectSysProductsList(sysProducts);
        ExcelUtil<SysProducts> util = new ExcelUtil<SysProducts>(SysProducts.class);
        util.exportExcel(response, list, "商品数据");
    }

    /**
     * 获取商品详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:products:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(sysProductsService.selectSysProductsById(id));
    }

    /**
     * 新增商品
     */
    @PreAuthorize("@ss.hasPermi('system:products:add')")
    @Log(title = "商品", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysProducts sysProducts)
    {
        return toAjax(sysProductsService.insertSysProducts(sysProducts));
    }

    /**
     * 修改商品
     */
    @PreAuthorize("@ss.hasPermi('system:products:edit')")
    @Log(title = "商品", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysProducts sysProducts)
    {
        return toAjax(sysProductsService.updateSysProducts(sysProducts));
    }

    /**
     * 删除商品
     */
    @PreAuthorize("@ss.hasPermi('system:products:remove')")
    @Log(title = "商品", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(sysProductsService.deleteSysProductsByIds(ids));
    }
}
