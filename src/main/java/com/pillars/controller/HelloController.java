package com.pillars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/hello")
public class HelloController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		model.addAttribute("dd","sdsdf");
		return "hello";
	}


	@RequestMapping("/login")
	@ResponseBody
	public  Map login(ModelMap params){
		System.out.print(params);
		Map result=new HashMap();
		result.put("aa","aa");
		return result;
	}
}