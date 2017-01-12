package com.pillars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/1/11.
 */
@RequestMapping("/index")
@Controller
public class IndexController {

    @RequestMapping("/home")
    public String index(ModelMap params){

        return "index/index";
    }
}
