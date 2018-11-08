package com.homk.project.module.merchant.mapper;

import com.homk.project.module.merchant.domain.Merchant;
import java.util.List;	

/**
 * 商家 数据层
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
public interface MerchantMapper 
{
	/**
     * 查询商家信息
     * 
     * @param id 商家ID
     * @return 商家信息
     */
	public Merchant selectMerchantById(Long id);
	
	/**
     * 查询商家列表
     * 
     * @param merchant 商家信息
     * @return 商家集合
     */
	public List<Merchant> selectMerchantList(Merchant merchant);
	
	/**
     * 新增商家
     * 
     * @param merchant 商家信息
     * @return 结果
     */
	public int insertMerchant(Merchant merchant);
	
	/**
     * 修改商家
     * 
     * @param merchant 商家信息
     * @return 结果
     */
	public int updateMerchant(Merchant merchant);
	
	/**
     * 删除商家
     * 
     * @param id 商家ID
     * @return 结果
     */
	public int deleteMerchantById(Long id);
	
	/**
     * 批量删除商家
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteMerchantByIds(String[] ids);
	
}