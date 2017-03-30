package com.wyb.crm.service;

import com.wyb.crm.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/21.
 */
public interface UserService {
    User getUserByUsernameAndPassword(Map<String,Object> map);

    /**
     * 获取所有的用户信息
     * @return
     */
    List<User> getUserList();
}
