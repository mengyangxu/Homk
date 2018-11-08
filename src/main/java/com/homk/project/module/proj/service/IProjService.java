package com.homk.project.module.proj.service;

import com.homk.project.module.proj.domain.Proj;
import java.util.List;
import java.util.Map;

/**
 * 项目 服务层
 * 
 * @author ruoyi
 * @date 2018-11-07
 */
public interface IProjService 
{
	/**
     * 查询项目信息
     * 
     * @param id 项目ID
     * @return 项目信息
     */
	public Proj selectProjById(Integer id);
	
	/**
     * 查询项目列表
     * 
     * @param proj 项目信息
     * @return 项目集合
     */
	public List<Proj> selectProjList(Proj proj);
	
    List<Map> findProjList(Proj proj);
	/**
     * 新增项目
     * 
     * @param proj 项目信息
     * @return 结果
     */
	public int insertProj(Proj proj);
	
	/**
     * 修改项目
     * 
     * @param proj 项目信息
     * @return 结果
     */
	public int updateProj(Proj proj);
		
	/**
     * 删除项目信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteProjByIds(String ids);

}
