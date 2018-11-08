package com.homk.project.module.merchant.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.homk.framework.aspectj.lang.annotation.Log;
import com.homk.framework.aspectj.lang.enums.BusinessType;
import com.homk.project.module.merchant.domain.Merchant;
import com.homk.project.module.merchant.service.IMerchantService;
import com.homk.framework.web.controller.BaseController;
import com.homk.framework.web.page.TableDataInfo;
import com.homk.framework.web.domain.AjaxResult;

import javax.servlet.http.HttpServletRequest;

/**
 * 商家 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
@Controller
@RequestMapping("/module/merchant")
public class MerchantController extends BaseController
{
    private String prefix = "module/merchant";
	
	@Autowired
	private IMerchantService merchantService;
	
	@RequiresPermissions("module:merchant:view")
	@GetMapping()
	public String merchant()
	{
	    return prefix + "/merchant";
	}
	
	/**
	 * 查询商家列表
	 */
	@RequiresPermissions("module:merchant:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Merchant merchant)
	{
		startPage();
        List<Merchant> list = merchantService.selectMerchantList(merchant);
		return getDataTable(list);
	}
	
	/**
	 * 新增商家
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}

	@PostMapping("/addInit")
	@ResponseBody
	public AjaxResult addInit(HttpServletRequest req)
	{
		AjaxResult result = new AjaxResult();
		//省份

		//城市


		return result;
	}

	
	/**
	 * 新增保存商家
	 */
	@RequiresPermissions("module:merchant:add")
	@Log(title = "商家", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Merchant merchant)
	{		
		return toAjax(merchantService.insertMerchant(merchant));
	}

	/**
	 * 修改商家
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap)
	{
		Merchant merchant = merchantService.selectMerchantById(id);
		mmap.put("merchant", merchant);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存商家
	 */
	@RequiresPermissions("module:merchant:edit")
	@Log(title = "商家", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Merchant merchant)
	{		
		return toAjax(merchantService.updateMerchant(merchant));
	}
	
	/**
	 * 删除商家
	 */
	@RequiresPermissions("module:merchant:remove")
	@Log(title = "商家", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(merchantService.deleteMerchantByIds(ids));
	}
	
}
