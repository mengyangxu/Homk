package com.homk.project.module.order.mapper;

import com.homk.project.module.order.domain.Order;
import java.util.List;
import java.util.Map;

/**
 * 订单 数据层
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
public interface OrderMapper 
{
	/**
     * 查询订单信息
     * 
     * @param userId 订单ID
     * @return 订单信息
     */
	public Order selectOrderById(Long userId);
	
	/**
     * 查询订单列表
     * 
     * @param order 订单信息
     * @return 订单集合
     */
	public List<Order> selectOrderList(Order order);
	
    List<Map> findOrderList(Order order);

	/**
     * 新增订单
     *
     * @param order 订单信息
     * @return 结果
     */
	public int insertOrder(Order order);
	
	/**
     * 修改订单
     * 
     * @param order 订单信息
     * @return 结果
     */
	public int updateOrder(Order order);
	
	/**
     * 删除订单
     * 
     * @param userId 订单ID
     * @return 结果
     */
	public int deleteOrderById(Long userId);
	
	/**
     * 批量删除订单
     * 
     * @param userIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteOrderByIds(String[] userIds);

}