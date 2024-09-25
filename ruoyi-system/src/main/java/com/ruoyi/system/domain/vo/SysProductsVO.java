package com.ruoyi.system.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.system.domain.SysProductAttribute;
import com.ruoyi.system.domain.SysProductSku;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class SysProductsVO implements Serializable {
    private static final long serialVersionUID = -5951189660529807154L;

    /** 商品ID */
    private String id;

    /** 商品名称 */
    private String name;

    /** 商品内部名称以及发货名称 */
    private String internalName;

    /** 商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包  */
    private Long categoryId;

    /** 商品归属 */
    private String commodityOwnership;

    /** 链接广告域名 */
    private String domainName;

    /** 采购价格 */
    private BigDecimal costPrice;

    /** 采购链接 */
    private String purchasingLinks;

    /** 商品描述 */
    private String description;

    /** 主图 */
    private String mainImage;

    /** 其他图片，JSON格式存储 */
    private String images;

    public String getPixelId() {
        return pixelId;
    }

    public void setPixelId(String pixelId) {
        this.pixelId = pixelId;
    }

    private String pixelId;

    private SysProductAttribute sysProductAttribute;


    public SysProductsVO(List<SysProductSku> sysProductSku) {
        this.sysProductSku = sysProductSku;
    }

    public List<SysProductSku> getSysProductSku() {
        return sysProductSku;
    }

    public void setSysProductSku(List<SysProductSku> sysProductSku) {
        this.sysProductSku = sysProductSku;
    }

    private List<SysProductSku> sysProductSku;



    public SysProductsVO() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInternalName() {
        return internalName;
    }

    public void setInternalName(String internalName) {
        this.internalName = internalName;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCommodityOwnership() {
        return commodityOwnership;
    }

    public void setCommodityOwnership(String commodityOwnership) {
        this.commodityOwnership = commodityOwnership;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public String getPurchasingLinks() {
        return purchasingLinks;
    }

    public void setPurchasingLinks(String purchasingLinks) {
        this.purchasingLinks = purchasingLinks;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public SysProductAttribute getSysProductAttribute() {
        return sysProductAttribute;
    }

    public void setSysProductAttribute(SysProductAttribute sysProductAttribute) {
        this.sysProductAttribute = sysProductAttribute;
    }
}
