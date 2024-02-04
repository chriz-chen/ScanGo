package com.example.controller.user;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bean.LoginUser;
import com.example.bean.ResetPassword;
import com.example.dao.UserDAO;
import com.example.entity.User;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserDAO userDAO;

    // 進入寄送電子郵件重設密碼頁面
    @GetMapping("/sendEmail")
    public String SendEmailToResetPasswordPage(@ModelAttribute ResetPassword resetPassword) {
        return "sendEmail";
    }

    /**
     * POST 請求，忘記密碼發送電子信件。
     * 
     * @param email 使用者提供的電子信箱
     * @param session 目前的 session
     * @param model Spring MVC 模型
     * @return 成功：發送電子信件；失敗：錯誤頁面
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeyException
     */
    @PostMapping("/sendEmail")
    public String sendEmailToResetPassword(@RequestParam("email") String email, HttpSession session, Model model)
            throws InvalidKeyException, NoSuchAlgorithmException {

        Optional<User> userOpt = userDAO.getUserByEmail(email);

        if (userOpt.isPresent()) {
            // 獲取 TOTP 密碼
            String totp = userDAO.getTotp();
            // 發送電子郵件包含 TOTP 驗證碼
            userDAO.sentEamil(email, totp);

            session.setAttribute("totp", totp);
            session.setAttribute("email", email);
            // 重定向至重設密碼頁面
            return "redirect:/mvc/auth/resetPassword";
        }
        // 如果使用者不存在，顯示錯誤訊息
        model.addAttribute("message", "查無此信箱");
        return "sendEmail";
    }


    // 進入驗證並重設密碼頁面
    @GetMapping("/resetPassword")
    public String verifyAndResetPage(HttpSession session) throws InvalidKeyException, NoSuchAlgorithmException {
        String totp = (String) session.getAttribute("totp");
        return "resetPassword";
    }

    @PostMapping("/resetPassword")
    public String verifyAndReset(@RequestParam("totp") String totp, @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword, HttpSession session, Model model) {

        // 從 session 中獲取儲存的 TOTP 驗證碼
        String sessionTotp = (String) session.getAttribute("totp");

        // 檢查使用者輸入的 TOTP 是否與 session 中的一致
        if (!totp.equals(sessionTotp)) {
            model.addAttribute("message", "驗證碼錯誤");
            return "resetPassword";
        }

        // 檢查兩次輸入的新密碼是否一致
        if (!password.equals(confirmPassword)) {
            model.addAttribute("message", "兩次新密碼不一致");
            return "resetPassword";
        }

        // 從 session 中獲取儲存的電子信箱
        String email = (String) session.getAttribute("email");
        // 根據電子信箱從資料庫中獲取對應的使用者資訊
        User user = userDAO.getUserByEmail(email).get();

        // 將新密碼進行加密
        String encryptedNewPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        // 更新使用者密碼
        user.setPassword(encryptedNewPassword);
        userDAO.updateUserPassword(user.getUserId(), encryptedNewPassword);

        // 將成功訊息傳遞至視圖模型
        model.addAttribute("message", "密碼修改成功");
        // 重導向到登入頁面
        return "redirect:/mvc/login";
    }


}
