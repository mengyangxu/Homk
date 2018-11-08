package com.homk.project.module.order.domain;

import com.homk.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.homk.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 订单表 biz_order
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
public class Order extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 用户ID */
	private Long userId;
	/** 客户名 */
	private String userName;
	/** 客户电话 */
	private String userPhone;
	/** 省份ID */
	private Integer provinceId;
	/** 城市 */
	private Integer cityId;
	/** 商家 */
	private Integer merId;
	/** 项目 */
	private Integer projectId;
	/** 价格 */
	private Long price;
	/** 下单时间 */
	private Date createTime;

	private String projName;
	private String province;
	private String city;

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setUserId(Long userId)
	{
		this.userId = userId;
	}

	public Long getUserId() 
	{
		return userId;
	}
	public void setUserName(String userName) 
	{
		this.userName = userName;
	}

	public String getUserName() 
	{
		return userName;
	}
	public void setUserPhone(String userPhone) 
	{
		this.userPhone = userPhone;
	}

	public String getUserPhone() 
	{
		return userPhone;
	}
	public void setProvinceId(Integer provinceId) 
	{
		this.provinceId = provinceId;
	}

	public Integer getProvinceId() 
	{
		return provinceId;
	}
	public void setCityId(Integer cityId) 
	{
		this.cityId = cityId;
	}

	public Integer getCityId() 
	{
		return cityId;
	}
	public void setMerId(Integer merId) 
	{
		this.merId = merId;
	}

	public Integer getMerId() 
	{
		return merId;
	}
	public void setProjectId(Integer projectId) 
	{
		this.projectId = projectId;
	}

	public Integer getProjectId() 
	{
		return projectId;
	}
	public void setPrice(Long price) 
	{
		this.price = price;
	}

	public Long getPrice() 
	{
		return price;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("userPhone", getUserPhone())
            .append("provinceId", getProvinceId())
            .append("cityId", getCityId())
            .append("merId", getMerId())
            .append("projectId", getProjectId())
            .append("price", getPrice())
            .append("createTime", getCreateTime())
            .toString();
    }
}
