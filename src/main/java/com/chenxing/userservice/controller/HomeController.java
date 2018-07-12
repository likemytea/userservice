package com.chenxing.userservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chenxing.userservice.domain.Msg;

/**
 * Created by liuxing on 17/1/18.
 */
@Controller
public class HomeController {
	@RequestMapping("/homepage")
	public String goHomePage(Model model) {
		Msg msg = new Msg("测试标题", "测试内容", "欢迎来到HOME页面,您拥有 ROLE_HOME 权限");
		model.addAttribute("msg", msg);
		return "homepage";
	}

	@RequestMapping("/")
    public String index(Model model){
		Msg msg = new Msg("测试标题", "测试内容", "欢迎来到HOME页面,您拥有 ROLE_HOME 权限");
		model.addAttribute("msg", msg);
        return "home";
    }

    @RequestMapping("/login")
    public  String login(){
		return "myLogin";
    }

    @RequestMapping("/admin")
    @ResponseBody
    public String hello(){
        return "hello admin";
    }
}
