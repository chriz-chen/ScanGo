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

/**
 * /ScanGo/mvc/member
 */
@Controller
@RequestMapping
public class MemberController {
	
	private final static String ERROR_MESSAGE = "errorMessage";
	private final static String SUCCESS_MESSAGE = "successMessage";
	
	@Autowired
	private UserDAO userDAO;

	@GetMapping("/member")
	public String member() {
		return "member";
	}
	
	/**
     * GET 請求，顯示重設密碼頁面。
     * @return resetPassword 頁面
     */
	@GetMapping("/password")
	public String resetPasswordPage() {
		return "resetPassword";
	}

	/**
	 * 密碼變更
	 * @param oldPassword
	 * @param newPasswords
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping(value ="/member/change_password", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, String> resetPassword(@RequestParam("oldPassword") String oldPassword,@RequestParam("newPasswords") List<String> newPasswords,
			HttpSession session,Model model) {

		Map<String, String> result = new HashMap<>();
		
	    // 從 Session 中獲取當前登入用戶的資訊
	    User user = (User) session.getAttribute("user");

	    // 從資料庫中查詢使用者資料
	    Optional<User> optUser = userDAO.findUserByUsername(user.getUsername());

	    // 如果使用者不存在或密碼錯誤，返回登入頁面
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

	    // 進行密碼變更
	    user.setPassword(encryptedNewPassword);
	    userDAO.updateUserPassword(user.getUserId(), encryptedNewPassword);

	    result.put(ERROR_MESSAGE, "");
	    result.put(SUCCESS_MESSAGE, "密碼修改成功");
	    return result;
	}
	
	
	
	// 修改會員資料
	// http://localhost:8080/ScanGo/mvc/member/updateProfile
	
	@GetMapping("/member/updateProfile")
	public String updateProfilePage() {
		return "updateProfile";
	}
	
	@PostMapping("/member/updateProfile")
	public String updateProfile(@ModelAttribute("user") User user,HttpSession session,
                                Model model) {

        // 創建 User 對象，用於更新
        User updatedUser = new User();
        updatedUser.setUserId(user.getUserId());
        updatedUser.setEmail(user.getEmail());
        updatedUser.setPhone(user.getPhone());
        updatedUser.setBirthday(user.getBirthday());

        // 調用 DAO 更新使用者資料
        Boolean updateSuccess = userDAO.updateUserProfile(updatedUser);

        if (updateSuccess) {
        	
    		User sessionUser = (User)session.getAttribute("user");
    		session.setAttribute("user", userDAO.findUserByUserId(sessionUser.getUserId()).get());
        	
            // 更新成功，返回成功訊息
            model.addAttribute("message", "使用者資料更新成功");
            return "redirect:/mvc/member"; // 導向成功頁面
        } else {
            // 更新失敗，返回失敗訊息
            model.addAttribute("error", "使用者資料更新失敗");
            return "updateProfile"; // 導向錯誤頁面
        }
    }


	// 得到目前所有 session attribute names
	@GetMapping("/findAllSessionNames")
	@ResponseBody
	public String findAllSessionNames(HttpSession session) {
		StringBuilder names = new StringBuilder();
		// 目前系統中在使用的 Session 屬性名稱
		Enumeration<String> sessionAttrNames = session.getAttributeNames();
		while (sessionAttrNames.hasMoreElements()) {
			String name = (String) sessionAttrNames.nextElement();
			names.append(name + "\n");
		}
		return names.toString();
	}
	
	
	

}
