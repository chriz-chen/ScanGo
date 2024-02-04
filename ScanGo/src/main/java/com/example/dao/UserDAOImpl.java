package com.example.dao;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.User;
import com.example.util.KeyUtil;

import aweit.mail.GMail;

@Component
public class UserDAOImpl implements UserDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private LevelDAO levelDAO;

    /**
     * 1. 查詢所有使用者(多筆)。
     *
     * @return 所有使用者列表
     */
    @Override
    public List<User> findAllUsers() {
        String sql = "select userId, username, password, phone, email, birthday, authType, authId, createDate ,levelId from user";
        List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
        users.forEach(userInfo -> {
            levelDAO.findLevelNameById(userInfo.getLevelId()).ifPresent(userInfo::setLevel);
        });
        return users;
    }

    /**
     * 2. 新增使用者。
     *
     * @param user 要新增的使用者
     * @return 影響的行數
     */
    @Override
    public int addUser(User user) {
        String sql = "insert into user(username, password, phone, email, birthday, authType, authId) VALUES (?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getPhone(), user.getEmail(), user.getBirthday(), user.getAuthType(), user.getAuthId());
    }

    /**
     * 3. 修改密碼。
     *
     * @param userId      使用者ID
     * @param newPassword 新密碼
     * @return 是否成功修改密碼
     */
    @Override
    public Boolean updateUserPassword(Integer userId, String newPassword) {
        String sql = "update user set password = ? where userId = ?";
        int rowcount = jdbcTemplate.update(sql, newPassword, userId);
        return rowcount > 0;
    }

    /**
     * 4. 根據使用者名稱查找使用者(登入用-單筆)。
     *
     * @param username 使用者名稱
     * @return 使用者資訊
     */
    @Override
    public Optional<User> findUserByUsername(String username) {
        String sql = "select userId, userName, password, email, phone, birthday, levelId, authType, authId, createDate FROM user where username = ?";
        try {
            return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username));
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    /**
     * 5. 根據使用者信箱查找使用者(更改密碼用-單筆)。
     *
     * @param email 使用者信箱
     * @return 使用者資訊
     */
    @Override
    public Optional<User> getUserByEmail(String email){
        String sql = "select userId, userName, password, email, phone, birthday, levelId, authType, authId, createDate from user where email = ?";
        try {
            return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), email));
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    /**
     * 6. 根據使用者Id查找使用者(單筆)。
     *
     * @param userId 使用者ID
     * @return 使用者資訊
     */
    @Override
    public Optional<User> findUserByUserId(Integer userId) {
        String sql = "select userId, userName, password, email, phone, birthday, levelId, authType, authId, createDate FROM user where userId = ?";
        try {
            return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), userId));
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    /**
     * 生成一個在十分鐘內有效的一次性密碼（TOTP）。
     *
     * @return TOTP 密碼
     * @throws InvalidKeyException      當密鑰無效時拋出此例外
     * @throws NoSuchAlgorithmException 當指定的加密算法無效時拋出此例外
     */
    @Override
    public String getTotp() throws InvalidKeyException, NoSuchAlgorithmException {
        int secretLength = 16; // 定義密鑰的長度
        StringBuilder secretBuilder = new StringBuilder(); // 建立一個 StringBuilder 物件來儲存密鑰
        for (int i = 0; i < secretLength; i++) {
            secretBuilder.append(generateLetter()); // 使用 generateLetter() 方法生成隨機字母並追加到 StringBuilder 中
        }
        String secret = Base64.getEncoder().encodeToString(secretBuilder.toString().getBytes()); // 將 StringBuilder 轉換為字串，並將其編碼為 Base64 格式，作為密鑰
        System.out.println(secret); // 輸出生成的密鑰
        long timeInterval = System.currentTimeMillis() / 1000L / 60L / 10L; // 計算時間間隔，以十分鐘為單位
        // 使用 HMACSHA256 作為加密算法，生成 TOTP 密碼
        String totp = KeyUtil.generateTOTP(secret, timeInterval, "HMACSHA256");
        return totp; // 返回生成的 TOTP 密碼
    }


    /**
     * 8. 發送有 TOPT 驗證碼的重設密碼信件。
     *
     * @param email 使用者電子信箱
     * @param totp  TOTP 驗證碼
     */
    @Override
    public void sentEamil(String email, String totp) {
        GMail mail = new GMail("yfchen1217@gmail.com", "hyhm yiwj czpv esbu");
        mail.from("yfchen1217@gmail.com")
                .to(email)
                .personal("ScanGo 自助結帳系統").subject("ScanGo 自助結帳系統 一次性驗證碼通知")
                .context("<h3> ScanGo 的顧客您好 : </h3><br>"
                        + "您的驗證碼為 : " + "<br>"
                        + "<h1>" + totp + "</h1>" + "<br>"
                        + "該驗證碼將在 10 分鐘後失效，請盡快回到頁面重設密碼。")
                .send();
    }

    /**
     * 生成一個隨機字母。
     *
     * @return 生成的隨機字母
     */
    public String generateLetter() {
        Random random = new Random(); // 建立一個隨機數生成器
        String letter; // 用於儲存隨機字母
        do {
            // 生成一個隨機數，如果是偶數，則返回大寫字母，否則返回小寫字母
            letter = String.format("%c", (char) (random.nextInt(26 * 2) + (random.nextBoolean() ? 'A' : 'a')));
        } while (!Character.isLetter(letter.charAt(0))); // 確保生成的字符是字母
        return letter; // 返回生成的隨機字母
    }


    /**
     * 9. 修改使用者資料。
     *
     * @param user 要修改的使用者資料
     * @return 是否成功修改使用者資料
     */
    public Boolean updateUserProfile(User user) {
        String sql = "UPDATE user SET phone = ?, email = ?, birthday = ? WHERE userId = ?";
        int rowsAffected = jdbcTemplate.update(sql, user.getPhone(), user.getEmail(), user.getBirthday(), user.getUserId());
        return rowsAffected > 0;
    }

}
