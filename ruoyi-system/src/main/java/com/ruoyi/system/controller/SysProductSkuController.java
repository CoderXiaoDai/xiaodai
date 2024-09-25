package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.uuid.UUID;
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
import com.ruoyi.system.domain.SysProductSku;
import com.ruoyi.system.service.ISysProductSkuService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品表SKUController
 * 
 * @author ruoyi
 * @date 2024-09-26
 */
@RestController
@RequestMapping("/system/sku")
public class SysProductSkuController extends BaseController
{
    @Autowired
    private ISysProductSkuService sysProductSkuService;

    /**
     * 查询商品表SKU列表
     */
    @PreAuthorize("@ss.hasPermi('system:sku:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysProductSku sysProductSku)
    {
        startPage();
        List<SysProductSku> list = sysProductSkuService.selectSysProductSkuList(sysProductSku);
        return getDataTable(list);
    }

    /**
     * 导出商品表SKU列表
     */
    @PreAuthorize("@ss.hasPermi('system:sku:export')")
    @Log(title = "商品表SKU", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysProductSku sysProductSku)
    {
        List<SysProductSku> list = sysProductSkuService.selectSysProductSkuList(sysProductSku);
        ExcelUtil<SysProductSku> util = new ExcelUtil<SysProductSku>(SysProductSku.class);
        util.exportExcel(response, list, "商品表SKU数据");
    }

    /**
     * 获取商品表SKU详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sku:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(sysProductSkuService.selectSysProductSkuById(id));
    }

    /**
     * 新增商品表SKU
     */
    @PreAuthorize("@ss.hasPermi('system:sku:add')")
    @Log(title = "商品表SKU", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<SysProductSku> sysProductSku)
    {


        if(sysProductSku.size() != 0  || sysProductSku != null ){
            sysProductSku.forEach(i -> {
                sysProductSkuService.deleteSysProductSkuById(i.getProductId());
            });

        }

        if(sysProductSku.size() != 0  || sysProductSku != null ){
            sysProductSku.forEach(i -> {
                i.setId(UUID.randomUUID().toString());
                System.out.println(i);
                AjaxResult ajaxResult = toAjax(sysProductSkuService.insertSysProductSku(i));
            });

        }

        return new AjaxResult();

    }

    /**
     * 修改商品表SKU
     */
    @PreAuthorize("@ss.hasPermi('system:sku:edit')")
    @Log(title = "商品表SKU", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysProductSku sysProductSku)
    {
        return toAjax(sysProductSkuService.updateSysProductSku(sysProductSku));
    }

    /**
     * 删除商品表SKU
     */
    @PreAuthorize("@ss.hasPermi('system:sku:remove')")
    @Log(title = "商品表SKU", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(sysProductSkuService.deleteSysProductSkuByIds(ids));
    }
}
