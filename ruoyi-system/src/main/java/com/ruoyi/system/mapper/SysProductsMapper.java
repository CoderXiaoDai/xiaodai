package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysProducts;

/**
 * 商品Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
public interface SysProductsMapper 
{
    /**
     * 查询商品
     * 
     * @param id 商品主键
     * @return 商品
     */
    public SysProducts selectSysProductsById(String id);

    /**
     * 查询商品列表
     * 
     * @param sysProducts 商品
     * @return 商品集合
     */
    public List<SysProducts> selectSysProductsList(SysProducts sysProducts);

    /**
     * 新增商品
     * 
     * @param sysProducts 商品
     * @return 结果
     */
    public int insertSysProducts(SysProducts sysProducts);

    /**
     * 修改商品
     * 
     * @param sysProducts 商品
     * @return 结果
     */
    public int updateSysProducts(SysProducts sysProducts);

    /**
     * 删除商品
     * 
     * @param id 商品主键
     * @return 结果
     */
    public int deleteSysProductsById(String id);

    /**
     * 批量删除商品
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysProductsByIds(String[] ids);
}
