package com.homk.project.module.proj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.homk.project.module.proj.mapper.ProjMapper;
import com.homk.project.module.proj.domain.Proj;
import com.homk.project.module.proj.service.IProjService;
import com.homk.common.support.Convert;

/**
 * 项目 服务层实现
 * 
 * @author ruoyi
 * @date 2018-11-07
 */
@Service
public class ProjServiceImpl implements IProjService 
{
	@Autowired
	private ProjMapper projMapper;

	/**
     * 查询项目信息
     * 
     * @param id 项目ID
     * @return 项目信息
     */
    @Override
	public Proj selectProjById(Integer id)
	{
	    return projMapper.selectProjById(id);
	}
	
	/**
     * 查询项目列表
     * 
     * @param proj 项目信息
     * @return 项目集合
     */
	@Override
	public List<Proj> selectProjList(Proj proj)
	{
	    return projMapper.selectProjList(proj);
	}

	public List<Map> findProjList(Proj proj){
		return projMapper.findProjList(proj);
	}
	
    /**
     * 新增项目
     * 
     * @param proj 项目信息
     * @return 结果
     */
	@Override
	public int insertProj(Proj proj)
	{
	    return projMapper.insertProj(proj);
	}
	
	/**
     * 修改项目
     * 
     * @param proj 项目信息
     * @return 结果
     */
	@Override
	public int updateProj(Proj proj)
	{
	    return projMapper.updateProj(proj);
	}

	/**
     * 删除项目对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteProjByIds(String ids)
	{
		return projMapper.deleteProjByIds(Convert.toStrArray(ids));
	}
	
}
