package com.wyb.crm.service.impl;

import com.wyb.crm.entity.User;
import com.wyb.crm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/21.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserService userService;
    public User getUserByUsernameAndPassword(Map<String, Object> map) {
        return userService.getUserByUsernameAndPassword(map);
    }

    public List<User> getUserList() {
        return userService.getUserList();
    }
}
