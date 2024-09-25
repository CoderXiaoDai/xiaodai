package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysProductSkuMapper;
import com.ruoyi.system.domain.SysProductSku;
import com.ruoyi.system.service.ISysProductSkuService;

/**
 * 商品表SKUService业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-26
 */
@Service
public class SysProductSkuServiceImpl implements ISysProductSkuService 
{
    @Autowired
    private SysProductSkuMapper sysProductSkuMapper;

    /**
     * 查询商品表SKU
     * 
     * @param id 商品表SKU主键
     * @return 商品表SKU
     */
    @Override
    public SysProductSku selectSysProductSkuById(String id)
    {
        return sysProductSkuMapper.selectSysProductSkuById(id);
    }

    /**
     * 查询商品表SKU列表
     * 
     * @param sysProductSku 商品表SKU
     * @return 商品表SKU
     */
    @Override
    public List<SysProductSku> selectSysProductSkuList(SysProductSku sysProductSku)
    {
        return sysProductSkuMapper.selectSysProductSkuList(sysProductSku);
    }

    /**
     * 新增商品表SKU
     * 
     * @param sysProductSku 商品表SKU
     * @return 结果
     */
    @Override
    public int insertSysProductSku(SysProductSku sysProductSku)
    {
        return sysProductSkuMapper.insertSysProductSku(sysProductSku);
    }

    /**
     * 修改商品表SKU
     * 
     * @param sysProductSku 商品表SKU
     * @return 结果
     */
    @Override
    public int updateSysProductSku(SysProductSku sysProductSku)
    {
        return sysProductSkuMapper.updateSysProductSku(sysProductSku);
    }

    /**
     * 批量删除商品表SKU
     * 
     * @param ids 需要删除的商品表SKU主键
     * @return 结果
     */
    @Override
    public int deleteSysProductSkuByIds(String[] ids)
    {
        return sysProductSkuMapper.deleteSysProductSkuByIds(ids);
    }

    /**
     * 删除商品表SKU信息
     * 
     * @param id 商品表SKU主键
     * @return 结果
     */
    @Override
    public int deleteSysProductSkuById(String id)
    {
        return sysProductSkuMapper.deleteSysProductSkuById(id);
    }
}
