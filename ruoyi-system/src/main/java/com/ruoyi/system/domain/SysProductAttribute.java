package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品属性表对象 sys_product_attribute
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
public class SysProductAttribute extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品属性ID */
    private String id;

    /** 属性描述：JSON */
    @Excel(name = "属性描述：JSON")
    private String attributeDescribed;

    /** 商品ID */
    @Excel(name = "商品ID")
    private String productId;

    /** 属性命名： 颜色 大小 尺码 型号 */
    @Excel(name = "属性命名： 颜色 大小 尺码 型号")
    private String attributeName;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setAttributeDescribed(String attributeDescribed) 
    {
        this.attributeDescribed = attributeDescribed;
    }

    public String getAttributeDescribed() 
    {
        return attributeDescribed;
    }
    public void setProductId(String productId) 
    {
        this.productId = productId;
    }

    public String getProductId() 
    {
        return productId;
    }
    public void setAttributeName(String attributeName) 
    {
        this.attributeName = attributeName;
    }

    public String getAttributeName() 
    {
        return attributeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("attributeDescribed", getAttributeDescribed())
            .append("productId", getProductId())
            .append("attributeName", getAttributeName())
            .toString();
    }
}
