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
import com.ruoyi.system.domain.SysProductAttribute;
import com.ruoyi.system.service.ISysProductAttributeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品属性表Controller
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
@RestController
@RequestMapping("/system/attribute")
public class SysProductAttributeController extends BaseController
{
    @Autowired
    private ISysProductAttributeService sysProductAttributeService;

    /**
     * 查询商品属性表列表
     */
    @PreAuthorize("@ss.hasPermi('system:attribute:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysProductAttribute sysProductAttribute)
    {
        startPage();
        List<SysProductAttribute> list = sysProductAttributeService.selectSysProductAttributeList(sysProductAttribute);
        return getDataTable(list);
    }

    /**
     * 导出商品属性表列表
     */
    @PreAuthorize("@ss.hasPermi('system:attribute:export')")
    @Log(title = "商品属性表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysProductAttribute sysProductAttribute)
    {
        List<SysProductAttribute> list = sysProductAttributeService.selectSysProductAttributeList(sysProductAttribute);
        ExcelUtil<SysProductAttribute> util = new ExcelUtil<SysProductAttribute>(SysProductAttribute.class);
        util.exportExcel(response, list, "商品属性表数据");
    }

    /**
     * 获取商品属性表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:attribute:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(sysProductAttributeService.selectSysProductAttributeById(id));
    }

    /**
     * 新增商品属性表
     */
    @PreAuthorize("@ss.hasPermi('system:attribute:add')")
    @Log(title = "商品属性表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysProductAttribute sysProductAttribute)
    {
        return toAjax(sysProductAttributeService.insertSysProductAttribute(sysProductAttribute));
    }

    /**
     * 修改商品属性表
     */
    @PreAuthorize("@ss.hasPermi('system:attribute:edit')")
    @Log(title = "商品属性表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysProductAttribute sysProductAttribute)
    {
        return toAjax(sysProductAttributeService.updateSysProductAttribute(sysProductAttribute));
    }

    /**
     * 删除商品属性表
     */
    @PreAuthorize("@ss.hasPermi('system:attribute:remove')")
    @Log(title = "商品属性表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(sysProductAttributeService.deleteSysProductAttributeByIds(ids));
    }
}
