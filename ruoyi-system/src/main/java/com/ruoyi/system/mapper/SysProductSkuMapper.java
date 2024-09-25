package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysProductSku;

/**
 * 商品表SKUMapper接口
 * 
 * @author ruoyi
 * @date 2024-09-26
 */
public interface SysProductSkuMapper 
{
    /**
     * 查询商品表SKU
     * 
     * @param id 商品表SKU主键
     * @return 商品表SKU
     */
    public SysProductSku selectSysProductSkuById(String id);

    /**
     * 查询商品表SKU列表
     * 
     * @param sysProductSku 商品表SKU
     * @return 商品表SKU集合
     */
    public List<SysProductSku> selectSysProductSkuList(SysProductSku sysProductSku);

    /**
     * 新增商品表SKU
     * 
     * @param sysProductSku 商品表SKU
     * @return 结果
     */
    public int insertSysProductSku(SysProductSku sysProductSku);

    /**
     * 修改商品表SKU
     * 
     * @param sysProductSku 商品表SKU
     * @return 结果
     */
    public int updateSysProductSku(SysProductSku sysProductSku);

    /**
     * 删除商品表SKU
     * 
     * @param id 商品表SKU主键
     * @return 结果
     */
    public int deleteSysProductSkuById(String id);

    /**
     * 批量删除商品表SKU
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysProductSkuByIds(String[] ids);
}
