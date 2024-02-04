package com.example.controller.user;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.UserDAO;
import com.example.entity.User;

@Controller
@RequestMapping("/member")
public class MemberController {
    
    private final static String ERROR_MESSAGE = "errorMessage";
    private final static String SUCCESS_MESSAGE = "successMessage";
    
    @Autowired
    private UserDAO userDAO;

    /**
     * 進入會員首頁
     * @param session HttpSession 物件
     * @param updateUser 用於更新會員資料的 ModelAttribute
     * @return 會員頁面
     */
    @GetMapping
    public String member(HttpSession session, @ModelAttribute("updateUser") User updateUser) {
        User user = (User) session.getAttribute("user");
        return "member";
    }
    
    /**
     * GET 請求，顯示重設密碼頁面。
     * @return 重設密碼頁面
     */
    @GetMapping("/password")
    public String resetPasswordPage() {
        return "resetPassword";
    }

    /**
     * POST 請求，用於修改密碼。
     * @param oldPassword 舊密碼
     * @param newPasswords 新密碼列表
     * @param session HttpSession 物件
     * @param model Spring MVC 模型
     * @return 包含結果的 JSON 對象
     */
    @PostMapping(value = "/change_password", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, String> resetPassword(@RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPasswords") List<String> newPasswords, HttpSession session, Model model) {

        Map<String, String> result = new HashMap<>();

        User user = (User) session.getAttribute("user");

        Optional<User> optUser = userDAO.findUserByUsername(user.getUsername());

        // 檢查舊密碼是否正確
        if (!BCrypt.checkpw(oldPassword, optUser.get().getPassword())) {
            result.put(ERROR_MESSAGE, "原密碼錯誤");
            return result;
        }

        // 檢查新密碼是否一致
        if (!newPasswords.get(0).equals(newPasswords.get(1))) {
            result.put(ERROR_MESSAGE, "二次新密碼不一致");
            return result;
        }
        
        // 將新密碼進行加密
        String encryptedNewPassword = BCrypt.hashpw(newPasswords.get(0), BCrypt.gensalt());

        // 更新密碼
        user.setPassword(encryptedNewPassword);
        userDAO.updateUserPassword(user.getUserId(), encryptedNewPassword);

        // 返回成功訊息
        result.put(ERROR_MESSAGE, "");
        result.put(SUCCESS_MESSAGE, "密碼修改成功");
        return result;
    }


    /**
     * GET 請求，進入會員資料更新頁面
     * @return 會員資料更新頁面的視圖名稱
     */
    @GetMapping("/updateProfile")
    public String updateProfilePage() {
        return "updateProfile";
    }

    /**
     * POST 請求，更新會員資料
     * @param user 要更新的會員資料
     * @param session HttpSession 物件
     * @param model Spring MVC 模型
     * @return 跳轉至會員首頁或更新資料頁面的視圖名稱
     */
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute("user") User user, HttpSession session, Model model) {

    	// 創建一個新的User對象來存儲更新後的使用者資料
        User updatedUser = new User();
        updatedUser.setUsername(user.getUsername());
        updatedUser.setUserId(user.getUserId());
        updatedUser.setEmail(user.getEmail());
        updatedUser.setPhone(user.getPhone());
        updatedUser.setBirthday(user.getBirthday());

        Boolean updateSuccess = userDAO.updateUserProfile(updatedUser);

        if (updateSuccess) {
            // 如果更新成功，從Session中獲取當前登入的使用者資料
            User sessionUser = (User) session.getAttribute("user");
            // 從資料庫中重新獲取更新後的使用者資料
            User newUser = userDAO.findUserByUserId(sessionUser.getUserId()).get();
            // 更新Session中的使用者資料
            session.setAttribute("user", newUser);
            model.addAttribute("user", newUser); 
            model.addAttribute("message", "使用者資料更新成功");
            
            return "member";
        } else {
            model.addAttribute("error", "使用者資料更新失敗");
            return "updateProfile";
        }
    }

    /**
     * GET 請求，查詢所有 Session 屬性名稱
     * @param session HttpSession 物件
     * @return 所有 Session 屬性名稱的字串表示形式
     */
    @GetMapping("/findAllSessionNames")
    @ResponseBody
    public String findAllSessionNames(HttpSession session) {
        // 創建一個StringBuilder來存儲Session屬性名稱
        StringBuilder names = new StringBuilder();
        // 獲取當前Session中所有的屬性名稱
        Enumeration<String> sessionAttrNames = session.getAttributeNames();
        while (sessionAttrNames.hasMoreElements()) {
            // 獲取下一個屬性名稱
            String name = (String) sessionAttrNames.nextElement();
            // 將屬性名稱添加到StringBuilder中，並換行
            names.append(name + "\n");
        }
        // 返回Session中所有屬性名稱的字串表示形式
        return names.toString();
    }

}
