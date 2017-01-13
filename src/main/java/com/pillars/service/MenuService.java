package com.pillars.service;

import com.pillars.dao.MenuMapper;
import com.pillars.model.Menu;
import com.pillars.utils.DateUtil;
import com.pillars.utils.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("menuService")
public class MenuService {

	public List<Map<String, Object>> getMenu(){
		List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();
		SqlSession session= MyBatisUtil.getSession();
		MenuMapper menuMapper=session.getMapper(MenuMapper.class);
		List<Menu> menuList=menuMapper.getAllMenus();
		for (Menu menu : menuList) {
			Map<String, Object> rs=new HashMap<String, Object>();
			rs.put("id", menu.getId());
			rs.put("title", menu.getTitle());
			rs.put("code", menu.getCode());
			rs.put("parentNode", menu.getParentnode());
			rs.put("haveChild", menu.getHavechild());
			rs.put("link", menu.getLink());
			rs.put("dateCreated", DateUtil.Format(menu.getDatecreated()));
			rs.put("lastUpdated", DateUtil.Format(menu.getLastupdated()));
			rs.put("rank", menu.getRank());
			list.add(rs);
		}
		return list;
	}

}
