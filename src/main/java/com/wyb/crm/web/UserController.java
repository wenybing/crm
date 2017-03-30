package com.wyb.crm.web;

import com.wyb.crm.entity.User;
import com.wyb.crm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/22.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceImpl userServiceImpl;
    @RequestMapping("/login")
    public String login(@RequestParam(value = "username",required = true)String username,@RequestParam(value = "password",required = true)String password,HttpServletRequest request,HttpSession session){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("NAME",username);
        map.put("PASSWORD",password);
        User user = userServiceImpl.getUserByUsernameAndPassword(map);
        if(user != null){
            session.setAttribute("user",user);
            return "home/success";
        }
        return "redirect:/index";
    }
}
