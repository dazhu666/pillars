package com.pillars.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import com.pillars.model.Menu;
import com.pillars.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@RequestMapping("/index")
@Controller
public class IndexController {

	@Autowired
	MenuService menuService;
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	@RequestMapping("/login")
	public ModelAndView login(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	@RequestMapping("/home")
	public ModelAndView home(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("home");
		return modelAndView;
	}
	@RequestMapping("/menu")
	@ResponseBody
	public Map<String,Object> menu(){

		Map<String,Object> rs=new HashMap<String, Object>();
		rs.put("data", menuService.getMenu());
		
		return rs;
	}
	
	@RequestMapping("/menus")
	public ModelAndView menus(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("menu");
		return modelAndView;
	}
	@RequestMapping("/menuAdd")
	public Map<String,Object> addMenu(HttpServletRequest request){
		Menu parentMenu=menuService.findMenuByCode(request.getParameter("parentNode"));
		Menu menu=new Menu();
		menu.setCode(request.getParameter("code"));
		menu.setParentnode(request.getParameter("parentNode"));
		menu.setTitle(request.getParameter("title"));
		menu.setHavechild(Byte.parseByte("0"));
		menu.setRank(Integer.valueOf(request.getParameter("rank")));
		menu.setLink(request.getParameter("link"));
		Boolean result=menuService.insertMenu(menu);
		Map<String,Object> rs=new HashMap<String,Object>();
		rs.put("result",result);
		return rs;

	}
}
