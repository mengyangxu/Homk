package com.homk.project.module.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.homk.project.module.order.mapper.OrderMapper;
import com.homk.project.module.order.domain.Order;
import com.homk.project.module.order.service.IOrderService;
import com.homk.common.support.Convert;

/**
 * 订单 服务层实现
 * 
 * @author ruoyi
 * @date 2018-11-06
 */
@Service
public class OrderServiceImpl implements IOrderService 
{
	@Autowired
	private OrderMapper orderMapper;

	/**
     * 查询订单信息
     * 
     * @param userId 订单ID
     * @return 订单信息
     */
    @Override
	public Order selectOrderById(Long userId)
	{
	    return orderMapper.selectOrderById(userId);
	}
	
	/**
     * 查询订单列表
     * 
     * @param order 订单信息
     * @return 订单集合
     */
	@Override
	public List<Order> selectOrderList(Order order)
	{
	    return orderMapper.selectOrderList(order);
	}

    @Override
    public List<Map> findOrderList(Order order) {
        return orderMapper.findOrderList(order);
    }

    /**
     * 新增订单
     * 
     * @param order 订单信息
     * @return 结果
     */
	@Override
	public int insertOrder(Order order)
	{
	    return orderMapper.insertOrder(order);
	}
	
	/**
     * 修改订单
     * 
     * @param order 订单信息
     * @return 结果
     */
	@Override
	public int updateOrder(Order order)
	{
	    return orderMapper.updateOrder(order);
	}

	/**
     * 删除订单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteOrderByIds(String ids)
	{
		return orderMapper.deleteOrderByIds(Convert.toStrArray(ids));
	}
	
}
