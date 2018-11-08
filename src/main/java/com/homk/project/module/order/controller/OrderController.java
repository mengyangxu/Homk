package com.homk.project.module.order.controller;

import java.util.List;
import java.util.Map;

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
import com.homk.project.module.order.domain.Order;
import com.homk.project.module.order.service.IOrderService;
import com.homk.framework.web.controller.BaseController;
import com.homk.framework.web.page.TableDataInfo;
import com.homk.framework.web.domain.AjaxResult;

/**
 * 订单 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
@Controller
@RequestMapping("/module/order")
public class OrderController extends BaseController
{
    private String prefix = "module/order";
	
	@Autowired
	private IOrderService orderService;
	
	@RequiresPermissions("module:order:view")
	@GetMapping()
	public String order()
	{
	    return prefix + "/order";
	}
	
	/**
	 * 查询订单列表
	 */
	@RequiresPermissions("module:order:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Order order)
	{
		startPage();
        //List<Order> list = orderService.selectOrderList(order);
        List<Map> list = orderService.findOrderList(order);
		return getDataTable(list);
	}
	
	/**
	 * 新增订单
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存订单
	 */
	@RequiresPermissions("module:order:add")
	@Log(title = "订单", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Order order)
	{		
		return toAjax(orderService.insertOrder(order));
	}

	/**
	 * 修改订单
	 */
	@GetMapping("/edit/{userId}")
	public String edit(@PathVariable("userId") Long userId, ModelMap mmap)
	{
		Order order = orderService.selectOrderById(userId);
		mmap.put("order", order);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存订单
	 */
	@RequiresPermissions("module:order:edit")
	@Log(title = "订单", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Order order)
	{		
		return toAjax(orderService.updateOrder(order));
	}
	
	/**
	 * 删除订单
	 */
	@RequiresPermissions("module:order:remove")
	@Log(title = "订单", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(orderService.deleteOrderByIds(ids));
	}
	
}
