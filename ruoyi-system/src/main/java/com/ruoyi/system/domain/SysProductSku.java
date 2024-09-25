package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品表SKU对象 sys_product_sku
 * 
 * @author ruoyi
 * @date 2024-09-26
 */
public class SysProductSku extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** skuID */
    private String id;

    /** 商品的价格（售价） */
    @Excel(name = "商品的价格", readConverterExp = "售=价")
    private BigDecimal price;

    /** SKU卖法的描述 */
    @Excel(name = "SKU卖法的描述")
    private String skuDescribed;

    /** 发货数量 */
    @Excel(name = "发货数量")
    private Long number;

    /** 排序 */
    @Excel(name = "排序")
    private Long skuLimit;

    /** 商品ID */
    @Excel(name = "商品ID")
    private String productId;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setSkuDescribed(String skuDescribed) 
    {
        this.skuDescribed = skuDescribed;
    }

    public String getSkuDescribed() 
    {
        return skuDescribed;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setSkuLimit(Long skuLimit) 
    {
        this.skuLimit = skuLimit;
    }

    public Long getSkuLimit() 
    {
        return skuLimit;
    }
    public void setProductId(String productId) 
    {
        this.productId = productId;
    }

    public String getProductId() 
    {
        return productId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("price", getPrice())
            .append("skuDescribed", getSkuDescribed())
            .append("remark", getRemark())
            .append("number", getNumber())
            .append("skuLimit", getSkuLimit())
            .append("productId", getProductId())
            .toString();
    }
}
