package com.kaifa.testMybatis;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.kaifa.authority.pojo.User;
import com.kaifa.authority.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class TestMyBatis {

	private static Logger logger = Logger.getLogger(TestMyBatis.class);  
	@Resource  
	private IUserService userService = null; 
	
	@Test  
    public void test1() {  
        User user = userService.selectByPrimaryKey("1");
        List<User> userList = new ArrayList<User>();
        userList.add(user);
        // System.out.println(user.getUserName());  
        // logger.info("值："+user.getUserName());  
        logger.info(JSON.toJSONString(userList));  
    }  
	 
}
