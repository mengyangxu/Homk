package com.homk.project.module.merchant.service;

import java.util.*;

import com.homk.common.utils.StringUtils;
import com.homk.project.system.menu.domain.Menu;
import com.homk.project.system.role.domain.Role;
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

	public List<Map<String, Object>> findCitys(String merId){
		List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
		List<Map> cityList = merchantMapper.findCitys();
		if(StringUtils.isEmpty(merId)) {
			trees = getTrees(cityList, false, null, true);
		}else {
			Merchant merchant = merchantMapper.selectMerchantById(Long.valueOf(merId));
			String cityIds = merchant.getCityIds();
			if(StringUtils.isEmpty(cityIds)) {
				trees = getTrees(cityList, false, null, true);
			}else {
				List citys = Arrays.asList(cityIds.split(","));
				trees = getTrees(cityList, true, citys, true);
			}
		}
		return trees;
	}

	public List<Map<String, Object>> getTrees(List<Map> cityList, boolean isCheck, List<String> cityIds,
											  boolean permsFlag)
	{
		List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
		for (Map city: cityList)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", city.get("id"));
			map.put("name", city.get("name"));
			map.put("pId", city.get("parentId"));
			map.put("title", city.get("name"));
			if(isCheck){
				if(cityIds.contains(city.get("id").toString())){
					map.put("checked", true);
				}else {
					map.put("checked", false);
				}
			}else {
				map.put("checked", false);
			}
			trees.add(map);
		}
		return trees;
	}
	
}
