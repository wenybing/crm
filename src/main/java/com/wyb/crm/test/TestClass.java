package com.wyb.crm.test;

import com.wyb.crm.entity.User;
import com.wyb.crm.service.impl.UserServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/21.
 */
public class TestClass {
    private ApplicationContext act = new ClassPathXmlApplicationContext("spring.xml");
    private UserServiceImpl userServiceImpl = null;
    @Test
    public void testDB() throws SQLException {
        DataSource data = act.getBean(DataSource.class);
        System.out.println(data.getConnection());
    }
    @Test
    public void testMapper(){
        userServiceImpl = act.getBean(UserServiceImpl.class);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("NAME","bcde");
        map.put("PASSWORD","4f6ed9e4ab25a6dac05933a8a0c5822ada8177e5");
        User user = userServiceImpl.getUserByUsernameAndPassword(map);
        System.out.println(user.getName());
    }
}
