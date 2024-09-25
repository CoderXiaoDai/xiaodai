package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.SysProductAttribute;
import com.ruoyi.system.domain.vo.SysProductsVO;
import com.ruoyi.system.mapper.SysProductAttributeMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysProductsMapper;
import com.ruoyi.system.domain.SysProducts;
import com.ruoyi.system.service.ISysProductsService;

/**
 * 商品Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
@Service
public class SysProductsServiceImpl implements ISysProductsService 
{
    @Autowired
    private SysProductsMapper sysProductsMapper;
    @Autowired
    private SysProductAttributeMapper sysProductAttributeMapper;

    /**
     * 查询商品
     * 
     * @param id 商品主键
     * @return 商品
     */
    @Override
    public SysProductsVO selectSysProductsById(String id)
    {
        SysProducts sysProducts = sysProductsMapper.selectSysProductsById(id);
        SysProductsVO sysProductsVO = new SysProductsVO();
        BeanUtils.copyProperties(sysProducts,sysProductsVO);
        SysProductAttribute  sysProductAttribute = sysProductAttributeMapper.selectSysProductAttributeBySysProductsId(id);
        sysProductsVO.setSysProductAttribute(sysProductAttribute);
        return sysProductsVO;
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
    public int deleteSysProductsByIds(String[] ids)
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
    public int deleteSysProductsById(String id)
    {
        return sysProductsMapper.deleteSysProductsById(id);
    }
}
