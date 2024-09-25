package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysProducts;
import com.ruoyi.system.domain.vo.SysProductsVO;

/**
 * 商品Service接口
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
public interface ISysProductsService 
{
    /**
     * 查询商品
     * 
     * @param id 商品主键
     * @return 商品
     */
    public SysProductsVO selectSysProductsById(String id);

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
     * 批量删除商品
     * 
     * @param ids 需要删除的商品主键集合
     * @return 结果
     */
    public int deleteSysProductsByIds(String[] ids);

    /**
     * 删除商品信息
     * 
     * @param id 商品主键
     * @return 结果
     */
    public int deleteSysProductsById(String id);
}
