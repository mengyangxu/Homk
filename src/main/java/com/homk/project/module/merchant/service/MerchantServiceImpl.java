package com.homk.project.module.merchant.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.homk.project.module.merchant.mapper.MerchantMapper;
import com.homk.project.module.merchant.domain.Merchant;
import com.homk.project.module.merchant.service.IMerchantService;
import com.homk.common.support.Convert;

/**
 * 商家 服务层实现
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
@Service
public class MerchantServiceImpl implements IMerchantService 
{
	@Autowired
	private MerchantMapper merchantMapper;

	/**
     * 查询商家信息
     * 
     * @param id 商家ID
     * @return 商家信息
     */
    @Override
	public Merchant selectMerchantById(Long id)
	{
	    return merchantMapper.selectMerchantById(id);
	}
	
	/**
     * 查询商家列表
     * 
     * @param merchant 商家信息
     * @return 商家集合
     */
	@Override
	public List<Merchant> selectMerchantList(Merchant merchant)
	{
	    return merchantMapper.selectMerchantList(merchant);
	}
	
    /**
     * 新增商家
     * 
     * @param merchant 商家信息
     * @return 结果
     */
	@Override
	public int insertMerchant(Merchant merchant)
	{
	    return merchantMapper.insertMerchant(merchant);
	}
	
	/**
     * 修改商家
     * 
     * @param merchant 商家信息
     * @return 结果
     */
	@Override
	public int updateMerchant(Merchant merchant)
	{
	    return merchantMapper.updateMerchant(merchant);
	}

	/**
     * 删除商家对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteMerchantByIds(String ids)
	{
		return merchantMapper.deleteMerchantByIds(Convert.toStrArray(ids));
	}
	
}
