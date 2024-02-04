package com.example.controller.user;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bean.GoogleUser;
import com.example.dao.UserDAO;
import com.example.entity.User;
import com.example.util.OIDCUtil;
import com.nimbusds.jwt.JWTClaimsSet;

@Controller
@RequestMapping("/login/secure")
public class SecureCallbackOauth2Controller {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping("/customlogin/google")
    public String loginGoogle() {
        // 取得 Google 登入授權頁面的 URL
        String auth = OIDCUtil.getAuthorizationUrl("code", "email openid profile");
        System.out.println(auth);
        return "redirect:" + auth;
    }

    @RequestMapping("/callback/google")
    public String callbackGoogle(@RequestParam("code") String code, HttpSession session) {
        try {
            // 取得 Google 登入後的 ID Token
            String idToken = OIDCUtil.getIDToken(code);

            // 解析 ID Token 取得用戶資訊
            JWTClaimsSet claimsSet = OIDCUtil.getClaimsSetAndVerifyIdToken(idToken);
            String email = claimsSet.getStringClaim("email");
            String name = claimsSet.getStringClaim("name");
            String id = claimsSet.getStringClaim("sub");

            // 創建 GoogleUser 對象
            GoogleUser googleUser = new GoogleUser(id, name, email);

            // 檢查資料庫中是否存在該用戶，若不存在則新增用戶
            Optional<User> userOpt = userDAO.findAllUsers().stream()
                    .filter(user -> "google".equalsIgnoreCase(user.getAuthType()) && googleUser.getId().equals(user.getAuthId()))
                    .findFirst();
            
            User user = null;
            if (userOpt.isEmpty()) {
                user = new User(0, googleUser.getName(), "None", googleUser.getEmail(), "None", null, 1, "Google", googleUser.getId(), null, null);
                userDAO.addUser(user);
            } else {
                user = userOpt.get();
            }

            // 將用戶存入 Session 中
            session.setAttribute("user", user);

            // 重定向到首頁
            return "redirect:/mvc/index";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/mvc/login";
        }
    }
}
