package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysProductAttribute;
import org.apache.ibatis.annotations.Param;

/**
 * 商品属性表Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
public interface SysProductAttributeMapper 
{
    /**
     * 查询商品属性表
     * 
     * @param id 商品属性表主键
     * @return 商品属性表
     */
    public SysProductAttribute selectSysProductAttributeById(String id);

    /**
     * 查询商品属性表列表
     * 
     * @param sysProductAttribute 商品属性表
     * @return 商品属性表集合
     */
    public List<SysProductAttribute> selectSysProductAttributeList(SysProductAttribute sysProductAttribute);

    /**
     * 新增商品属性表
     * 
     * @param sysProductAttribute 商品属性表
     * @return 结果
     */
    public int insertSysProductAttribute(SysProductAttribute sysProductAttribute);

    /**
     * 修改商品属性表
     * 
     * @param sysProductAttribute 商品属性表
     * @return 结果
     */
    public int updateSysProductAttribute(SysProductAttribute sysProductAttribute);

    /**
     * 删除商品属性表
     * 
     * @param id 商品属性表主键
     * @return 结果
     */
    public int deleteSysProductAttributeById(String id);

    /**
     * 批量删除商品属性表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysProductAttributeByIds(String[] ids);

    SysProductAttribute selectSysProductAttributeBySysProductsId(@Param("productId") String productId);
}
