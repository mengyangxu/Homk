package com.homk.project.module.merchant.domain;

import com.homk.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 商家表 biz_merchant
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
public class Merchant extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/**  */
	private Long id;
	/**  */
	private String bizName;
	/**  */
	private String desc;
	/**  */
	private String logo;
	/**  */
	private String userName;
	/**  */
	private String phone;
	/**  */
	private String pic;
	/**  */
	private String prodesc;
	/**  */
	private Integer sort;
	/** 1-5 */
	private Integer rankk;
	/**  */
	private Long provinceId;
	/**  */
	private Long city;

	private Date createTime;

	private String cityIds;

	public void setId(Long id) 
	{
		this.id = id;
	}

	public Long getId() 
	{
		return id;
	}
	public void setDesc(String desc) 
	{
		this.desc = desc;
	}

	public String getDesc() 
	{
		return desc;
	}
	public void setLogo(String logo) 
	{
		this.logo = logo;
	}

	public String getLogo() 
	{
		return logo;
	}
	public void setUserName(String userName) 
	{
		this.userName = userName;
	}

	public String getUserName() 
	{
		return userName;
	}
	public void setPhone(String phone) 
	{
		this.phone = phone;
	}

	public String getPhone() 
	{
		return phone;
	}
	public void setPic(String pic) 
	{
		this.pic = pic;
	}

	public String getPic() 
	{
		return pic;
	}
	public void setProdesc(String prodesc) 
	{
		this.prodesc = prodesc;
	}

	public String getProdesc() 
	{
		return prodesc;
	}
	public void setSort(Integer sort) 
	{
		this.sort = sort;
	}

	public Integer getSort() 
	{
		return sort;
	}
	public void setRankk(Integer rankk)
	{
		this.rankk = rankk;
	}

	public Integer getRankk()
	{
		return rankk;
	}
	public void setProvinceId(Long provinceId) 
	{
		this.provinceId = provinceId;
	}

	public Long getProvinceId() 
	{
		return provinceId;
	}
	public void setCity(Long city) 
	{
		this.city = city;
	}

	public Long getCity() 
	{
		return city;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("desc", getDesc())
            .append("logo", getLogo())
            .append("userName", getUserName())
            .append("phone", getPhone())
            .append("pic", getPic())
            .append("prodesc", getProdesc())
            .append("sort", getSort())
            .append("rankk", getRankk())
            .append("provinceId", getProvinceId())
            .append("city", getCity())
            .toString();
    }

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	@Override
	public Date getCreateTime() {
		return createTime;
	}

	@Override
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCityIds() {
		return cityIds;
	}

	public void setCityIds(String cityIds) {
		this.cityIds = cityIds;
	}
}
