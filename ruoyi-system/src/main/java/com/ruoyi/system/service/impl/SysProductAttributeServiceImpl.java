package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.Objects;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.uuid.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysProductAttributeMapper;
import com.ruoyi.system.domain.SysProductAttribute;
import com.ruoyi.system.service.ISysProductAttributeService;

/**
 * 商品属性表Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
@Service
public class SysProductAttributeServiceImpl implements ISysProductAttributeService 
{
    @Autowired
    private SysProductAttributeMapper sysProductAttributeMapper;

    /**
     * 查询商品属性表
     * 
     * @param id 商品属性表主键
     * @return 商品属性表
     */
    @Override
    public SysProductAttribute selectSysProductAttributeById(String id)
    {
        return sysProductAttributeMapper.selectSysProductAttributeById(id);
    }

    /**
     * 查询商品属性表列表
     * 
     * @param sysProductAttribute 商品属性表
     * @return 商品属性表
     */
    @Override
    public List<SysProductAttribute> selectSysProductAttributeList(SysProductAttribute sysProductAttribute)
    {
        return sysProductAttributeMapper.selectSysProductAttributeList(sysProductAttribute);
    }

    /**
     * 新增商品属性表
     * 
     * @param sysProductAttribute 商品属性表
     * @return 结果
     */
    @Override
    public int insertSysProductAttribute(SysProductAttribute sysProductAttribute)
    {
        SysProductAttribute productAttribute = sysProductAttributeMapper.selectSysProductAttributeBySysProductsId(sysProductAttribute.getProductId());
        if(!Objects.isNull(productAttribute)){
            sysProductAttributeMapper.deleteSysProductAttributeById(productAttribute.getId());
        }
        sysProductAttribute.setId(UUID.randomUUID().toString());
        return sysProductAttributeMapper.insertSysProductAttribute(sysProductAttribute);
    }

    /**
     * 修改商品属性表
     * 
     * @param sysProductAttribute 商品属性表
     * @return 结果
     */
    @Override
    public int updateSysProductAttribute(SysProductAttribute sysProductAttribute)
    {
        return sysProductAttributeMapper.updateSysProductAttribute(sysProductAttribute);
    }

    /**
     * 批量删除商品属性表
     * 
     * @param ids 需要删除的商品属性表主键
     * @return 结果
     */
    @Override
    public int deleteSysProductAttributeByIds(String[] ids)
    {
        return sysProductAttributeMapper.deleteSysProductAttributeByIds(ids);
    }

    /**
     * 删除商品属性表信息
     * 
     * @param id 商品属性表主键
     * @return 结果
     */
    @Override
    public int deleteSysProductAttributeById(String id)
    {
        return sysProductAttributeMapper.deleteSysProductAttributeById(id);
    }
}
