package com.homk.project.monitor.logininfor.controller;

import com.homk.common.utils.poi.ExcelUtil;
import com.homk.framework.aspectj.lang.annotation.Log;
import com.homk.framework.aspectj.lang.enums.BusinessType;
import com.homk.framework.web.controller.BaseController;
import com.homk.framework.web.domain.AjaxResult;
import com.homk.framework.web.page.TableDataInfo;
import com.homk.project.monitor.logininfor.domain.Logininfor;
import com.homk.project.monitor.logininfor.service.ILogininforService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 系统访问记录
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/monitor/logininfor")
public class LogininforController extends BaseController
{
    private String prefix = "monitor/logininfor";

    @Autowired
    private ILogininforService logininforService;

    @RequiresPermissions("monitor:logininfor:view")
    @GetMapping()
    public String logininfor()
    {
        return prefix + "/logininfor";
    }

    @RequiresPermissions("monitor:logininfor:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Logininfor logininfor)
    {
        startPage();
        List<Logininfor> list = logininforService.selectLogininforList(logininfor);
        return getDataTable(list);
    }

    @Log(title = "登陆日志", businessType = BusinessType.EXPORT)
    @RequiresPermissions("monitor:logininfor:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Logininfor logininfor) throws Exception
    {
        try
        {
            List<Logininfor> list = logininforService.selectLogininforList(logininfor);
            ExcelUtil<Logininfor> util = new ExcelUtil<Logininfor>(Logininfor.class);
            return util.exportExcel(list, "logininfor");
        }
        catch (Exception e)
        {
            return error("导出Excel失败，请联系网站管理员！");
        }
    }

    @RequiresPermissions("monitor:logininfor:remove")
    @Log(title = "登陆日志", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(logininforService.deleteLogininforByIds(ids));
    }
}
