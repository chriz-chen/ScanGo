package com.example.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
@RequestMapping(value = "/logout")
public class LogoutController {

    // 控制使用者登出的方法
    @GetMapping
    public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 取得目前使用者的 session 物件
        HttpSession session = req.getSession();
        // 使目前使用者的 session 失效，即登出操作
        session.invalidate();
        // 將使用者重新導向至登入頁面
        resp.sendRedirect(req.getContextPath() + "/mvc/login");
    }
}
