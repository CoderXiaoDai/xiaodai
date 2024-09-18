package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysProductsMapper;
import com.ruoyi.system.domain.SysProducts;
import com.ruoyi.system.service.ISysProductsService;

/**
 * 商品Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-17
 */
@Service
public class SysProductsServiceImpl implements ISysProductsService 
{
    @Autowired
    private SysProductsMapper sysProductsMapper;

    /**
     * 查询商品
     * 
     * @param id 商品主键
     * @return 商品
     */
    @Override
    public SysProducts selectSysProductsById(Long id)
    {
        return sysProductsMapper.selectSysProductsById(id);
    }

    /**
     * 查询商品列表
     * 
     * @param sysProducts 商品
     * @return 商品
     */
    @Override
    public List<SysProducts> selectSysProductsList(SysProducts sysProducts)
    {
        return sysProductsMapper.selectSysProductsList(sysProducts);
    }

    /**
     * 新增商品
     * 
     * @param sysProducts 商品
     * @return 结果
     */
    @Override
    public int insertSysProducts(SysProducts sysProducts)
    {
        return sysProductsMapper.insertSysProducts(sysProducts);
    }

    /**
     * 修改商品
     * 
     * @param sysProducts 商品
     * @return 结果
     */
    @Override
    public int updateSysProducts(SysProducts sysProducts)
    {
        return sysProductsMapper.updateSysProducts(sysProducts);
    }

    /**
     * 批量删除商品
     * 
     * @param ids 需要删除的商品主键
     * @return 结果
     */
    @Override
    public int deleteSysProductsByIds(Long[] ids)
    {
        return sysProductsMapper.deleteSysProductsByIds(ids);
    }

    /**
     * 删除商品信息
     * 
     * @param id 商品主键
     * @return 结果
     */
    @Override
    public int deleteSysProductsById(Long id)
    {
        return sysProductsMapper.deleteSysProductsById(id);
    }
}
