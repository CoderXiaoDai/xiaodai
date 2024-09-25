package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品对象 sys_products
 * 
 * @author ruoyi
 * @date 2024-09-25
 */
public class SysProducts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private String id;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String name;

    /** 商品内部名称以及发货名称 */
    @Excel(name = "商品内部名称以及发货名称")
    private String internalName;

    /** 商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包  */
    @Excel(name = "商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 ")
    private Long categoryId;

    /** 商品归属 */
    @Excel(name = "商品归属")
    private String commodityOwnership;

    /** 链接广告域名 */
    @Excel(name = "链接广告域名")
    private String domainName;

    /** 采购价格 */
    @Excel(name = "采购价格")
    private BigDecimal costPrice;

    /** 采购链接 */
    @Excel(name = "采购链接")
    private String purchasingLinks;

    /** 商品描述 */
    @Excel(name = "商品描述")
    private String description;

    /** 主图 */
    @Excel(name = "主图")
    private String mainImage;

    /** 其他图片，JSON格式存储 */
    @Excel(name = "其他图片，JSON格式存储")
    private String images;

    /** 商品状态（1：下架，0：上架） */
    @Excel(name = "商品状态", readConverterExp = "1=：下架，0：上架")
    private Integer status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 是否删除 */
    @Excel(name = "是否删除")
    private Integer isDeleted;

    /** 像素ID */
    @Excel(name = "像素ID")
    private String pixelId;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setInternalName(String internalName) 
    {
        this.internalName = internalName;
    }

    public String getInternalName() 
    {
        return internalName;
    }
    public void setCategoryId(Long categoryId) 
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() 
    {
        return categoryId;
    }
    public void setCommodityOwnership(String commodityOwnership) 
    {
        this.commodityOwnership = commodityOwnership;
    }

    public String getCommodityOwnership() 
    {
        return commodityOwnership;
    }
    public void setDomainName(String domainName) 
    {
        this.domainName = domainName;
    }

    public String getDomainName() 
    {
        return domainName;
    }
    public void setCostPrice(BigDecimal costPrice) 
    {
        this.costPrice = costPrice;
    }

    public BigDecimal getCostPrice() 
    {
        return costPrice;
    }
    public void setPurchasingLinks(String purchasingLinks) 
    {
        this.purchasingLinks = purchasingLinks;
    }

    public String getPurchasingLinks() 
    {
        return purchasingLinks;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setMainImage(String mainImage) 
    {
        this.mainImage = mainImage;
    }

    public String getMainImage() 
    {
        return mainImage;
    }
    public void setImages(String images) 
    {
        this.images = images;
    }

    public String getImages() 
    {
        return images;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }
    public void setIsDeleted(Integer isDeleted) 
    {
        this.isDeleted = isDeleted;
    }

    public Integer getIsDeleted() 
    {
        return isDeleted;
    }
    public void setPixelId(String pixelId)
    {
        this.pixelId = pixelId;
    }

    public String getPixelId()
    {
        return pixelId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("internalName", getInternalName())
            .append("categoryId", getCategoryId())
            .append("commodityOwnership", getCommodityOwnership())
            .append("domainName", getDomainName())
            .append("costPrice", getCostPrice())
            .append("purchasingLinks", getPurchasingLinks())
            .append("description", getDescription())
            .append("mainImage", getMainImage())
            .append("images", getImages())
            .append("status", getStatus())
            .append("createdAt", getCreatedAt())
            .append("isDeleted", getIsDeleted())
            .append("pixelId", getPixelId())
            .toString();
    }
}
