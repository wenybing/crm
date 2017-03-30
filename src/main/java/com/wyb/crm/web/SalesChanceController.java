package com.wyb.crm.web;

/**
 * Created by Administrator on 2017/2/23.
 */

import com.wyb.crm.entity.SalesChance;
import com.wyb.crm.entity.User;
import com.wyb.crm.service.impl.SalesChanceImpl;
import com.wyb.crm.service.impl.UserServiceImpl;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 销售机会
 */
@Controller
@RequestMapping("/chance/")
public class SalesChanceController {
    /**
     * 获取销售所机会
     */
    @Autowired
    private SalesChanceImpl salesChanceImpl;
    @Autowired
    private UserServiceImpl userServiceImpl;
    @RequestMapping("list")
    public Object salesChanceList(HttpServletRequest request){
        List<SalesChance> list = salesChanceImpl.getSalesChanceList();
        System.out.println(list);
        request.setAttribute("list",list);
        return "chance/list";
    }

    /**
     * 新建销售机会
     * @param request
     * @return
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public Object saveSalesChance(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("SOURCE",request.getParameter("source"));
        map.put("CUST_NAME",request.getParameter("custName"));
        map.put("RATE",request.getParameter("rate"));
        map.put("TITLE",request.getParameter("title"));
        map.put("CONTACT",request.getParameter("contact"));
        map.put("CONTACT_TEL",request.getParameter("contactTel"));
        map.put("DESCRIPTION",request.getParameter("description"));
        map.put("CREATED_USER_ID",Integer.parseInt(request.getParameter("createById")));
        map.put("CREATE_DATE",request.getParameter("createDate"));
        map.put("STATUS",1);
        salesChanceImpl.insertSalesChance(map);
        return "redirect:/chance/list";
    }

    /**
     * 删除销售计划
     * @param request
     * @return
     */
    @RequestMapping(value = "delete",method = RequestMethod.DELETE)
    public Object deleteSalesChance(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ID",request.getParameter("id"));
        salesChanceImpl.deleteSalesChance(map);
        return "redirect:/chance/list";
    }

    /**
     * 编辑销售计划
     * @param request
     * @return
     */
    @RequestMapping(value = "edit",method = RequestMethod.GET)
    public Object editSalesChance(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ID",request.getParameter("id"));
        SalesChance salesChance = salesChanceImpl.getSalesChanceById(map);
        request.setAttribute("salesChance",salesChance);
        return "chance/edit";
    }

    /**
     * 更新销售计划
     * @param request
     * @return
     */
    @RequestMapping(value = "update" ,method = RequestMethod.PUT)
    public Object updateSalesChance(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ID",request.getParameter("id"));
        map.put("SOURCE",request.getParameter("source"));
        map.put("CUST_NAME",request.getParameter("custName"));
        map.put("RATE",request.getParameter("rate"));
        map.put("TITLE",request.getParameter("title"));
        map.put("CONTACT",request.getParameter("contact"));
        map.put("CONTACT_TEL",request.getParameter("contactTel"));
        map.put("DESCRIPTION",request.getParameter("description"));
        //map.put("CREATE_DATE",request.getParameter("createDate"));
        //map.put("STATUS",1);
        salesChanceImpl.updateSalesChance(map);
        return "redirect:/chance/list";
    }
    @RequestMapping(value="dispatch",method = RequestMethod.GET)
    public Object dispatchSalseChance(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ID",request.getParameter("id"));
        SalesChance salesChance = salesChanceImpl.getSalesChanceById(map);
        request.setAttribute("salesChance",salesChance);
        //获取所有的user信息
        List<User> users = userServiceImpl.getUserList();
        request.setAttribute("users",users);
        return "chance/dispatch";
    }
    @RequestMapping(value = "disignee",method = RequestMethod.PUT)
    public Object disigneeSalesChance(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ID", request.getParameter("id"));
        map.put("DESIGNEEDATE",request.getParameter("designeeDate"));
        map.put("DESIGNEEID",request.getParameter("designeeId"));
        map.put("STATUS","2");
        salesChanceImpl.designeeSalesChance(map);
        return "redirect:/chance/list";
    }
    @RequestMapping(value = "plan/list" ,method = RequestMethod.GET)
    public Object planList(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        HashMap map = new HashMap();
        map.put("USERID",user.getId());
        List<SalesChance> salesChanceList = salesChanceImpl.getSalesChancePlan();
        request.setAttribute("salePlan",salesChanceList);
        return "plan/list";
    }
}
