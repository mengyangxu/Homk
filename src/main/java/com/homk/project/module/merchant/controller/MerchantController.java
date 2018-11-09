package com.homk.project.module.merchant.controller;

import java.util.List;
import java.util.Map;

import com.homk.common.utils.file.FileUploadUtils;
import com.homk.project.system.role.domain.Role;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.homk.framework.aspectj.lang.annotation.Log;
import com.homk.framework.aspectj.lang.enums.BusinessType;
import com.homk.project.module.merchant.domain.Merchant;
import com.homk.project.module.merchant.service.IMerchantService;
import com.homk.framework.web.controller.BaseController;
import com.homk.framework.web.page.TableDataInfo;
import com.homk.framework.web.domain.AjaxResult;
import org.springframework.web.multipart.MultipartFile;

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

	private static final Logger log = LoggerFactory.getLogger(BaseController.class);

    private String prefix = "module/merchant";

	@Value("${homk.picPrefix}")
	private String picPrefix;
	
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
	public String add(ModelMap mmp)
	{
		return prefix + "/add";
	}

	/**
	 * 加载city列表树
	 */
	@GetMapping("/cityTreeData")
	@ResponseBody
	public List<Map<String, Object>> cityTreeData(HttpServletRequest req)
	{
		String merId = req.getParameter("merId");
		List<Map<String, Object>> tree = merchantService.findCitys(merId);
		return tree;
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
		mmap.put("picPrefix", picPrefix);
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


	@PostMapping("/updateFile")
	@ResponseBody
	public AjaxResult updateFile( @RequestParam("file") MultipartFile file)
	{
		try
		{
			if (!file.isEmpty())
			{
				String filePath = FileUploadUtils.upload(file);
				return success().put("filePath", filePath).put("picPrefix", picPrefix);

			}
			return error();
		}
		catch (Exception e)
		{
			log.error("保存图片失败！", e);
			return error(e.getMessage());
		}
	}

	
}
