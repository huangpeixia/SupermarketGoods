package com.supermarketgoods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    /**
     * 进入登录页面
     * @return 重定向至登录页面
     */
    @GetMapping("/")
    public String toIndex(){
        System.out.println("toIndex-login.html");
        return "redirect:login.html";
    }
}
