package com.homk.project.module.proj.domain;

import com.homk.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.homk.framework.web.domain.BaseEntity;

/**
 * 项目表 biz_proj
 * 
 * @author ruoyi
 * @date 2018-11-07
 */
public class Proj extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 项目ID */
	private Integer id;
	/** 项目名称 */
	private String proName;
	/** 价格 */
	private Long price;
	/** 商家 */
	private Integer merId;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setProName(String proName) 
	{
		this.proName = proName;
	}

	public String getProName() 
	{
		return proName;
	}
	public void setPrice(Long price) 
	{
		this.price = price;
	}

	public Long getPrice() 
	{
		return price;
	}
	public void setMerId(Integer merId) 
	{
		this.merId = merId;
	}

	public Integer getMerId() 
	{
		return merId;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("proName", getProName())
            .append("price", getPrice())
            .append("merId", getMerId())
            .toString();
    }
}
