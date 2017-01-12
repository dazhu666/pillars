package com.pillars.controller;


import java.util.HashMap;
import java.util.Map;

import com.pillars.dao.UserMapper;
import com.pillars.model.User;
import com.pillars.utils.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;




@RequestMapping("/user")
@Controller
public class UserController {
	
	@RequestMapping("/register")
	public @ResponseBody Map register(String login,String password,String mobile){
		
	/*UserDao dao=new UserDao();
	dao.saveUser(login, mobile, login, password);*/
	SqlSessionFactory sessionFactory= MyBatisUtil.getSqlSessionFactory();
		SqlSession sqlSession=sessionFactory.openSession();
		UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
		User user=new User();
		user.setLogin(login);
		user.setPassword(password);
		user.setMobile(mobile);
		user.setName("dz");
		userMapper.insert(user);
		sqlSession.commit();
		sqlSession.close();

	
	Map map=new HashMap();
	map.put("message", "注册成功！");
		return map;
	}

}
