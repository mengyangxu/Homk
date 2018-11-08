package com.homk.project.module.proj.controller;

import java.util.List;
import java.util.Map;

import com.homk.framework.web.controller.BaseController;
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
import com.homk.project.module.proj.domain.Proj;
import com.homk.project.module.proj.service.IProjService;
import com.homk.framework.web.controller.BaseController;
import com.homk.framework.web.page.TableDataInfo;
import com.homk.framework.web.domain.AjaxResult;

import javax.servlet.http.HttpServletRequest;

/**
 * 项目 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-11-07
 */
@Controller
@RequestMapping("/module/proj")
public class ProjController extends BaseController
{
    private String prefix = "module/proj";
	
	@Autowired
	private IProjService projService;
	
	//@RequiresPermissions("module:proj:view")
	@GetMapping()
	public String proj(HttpServletRequest req)
	{
		String merId = req.getParameter("merId");
		req.getSession().setAttribute("merId", merId);
	    return prefix + "/proj";
	}
	
	/**
	 * 查询项目列表
	 */
//	@RequiresPermissions("module:proj:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Proj proj, HttpServletRequest req)
	{
		startPage();
		String merId = req.getSession().getAttribute("merId").toString();
		proj.setMerId(Integer.parseInt(merId));
        //List<Proj> list = projService.selectProjList(proj);
        List<Map> list = projService.findProjList(proj);
		return getDataTable(list);
	}
	
	/**
	 * 新增项目
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存项目
	 */
	//@RequiresPermissions("module:proj:add")
	@Log(title = "项目", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Proj proj , HttpServletRequest req)
	{
		String merId = req.getSession().getAttribute("merId").toString();
		proj.setMerId(Integer.parseInt(merId));
		return toAjax(projService.insertProj(proj));
	}

	/**
	 * 修改项目
	 */
	//@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Proj proj = projService.selectProjById(id);
		mmap.put("proj", proj);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存项目
	 */
	//@RequiresPermissions("module:proj:edit")
	@Log(title = "项目", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Proj proj)
	{
		return toAjax(projService.updateProj(proj));
	}
	
	/**
	 * 删除项目
	 */
	//@RequiresPermissions("module:proj:remove")
	@Log(title = "项目", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(projService.deleteProjByIds(ids));
	}
	
}
