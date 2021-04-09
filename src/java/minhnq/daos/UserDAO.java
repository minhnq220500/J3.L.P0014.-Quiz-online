/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.daos;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import minhnq.dtos.UserDTO;
import minhnq.utils.DBUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 *
 * @author Ticket 1
 */
public class UserDAO {

    Connection connect;
    PreparedStatement ps;
    ResultSet rs;

    public UserDAO() {
        rs = null;
        ps = null;
        rs = null;
    }

    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (connect != null) {
            connect.close();
        }

    }

    public String checkAccountEmail(String userEmailVuaNhap) throws SQLException {
        String userID = null;

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT email FROM tblAccount WHERE email=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, userEmailVuaNhap);
                rs = ps.executeQuery();
                if (rs.next()) {
                    userID = rs.getString("email");
                }
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return userID;
    }

    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT email, password, name, roleID, status FROM tblAccount WHERE email=?";

                ps = connect.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String pass = rs.getString("password");
                    String name = rs.getString("name");
                    String roleID = rs.getString("roleID");
                    boolean status = rs.getBoolean("status");

                    if (password.equals(pass)) {
                        user = new UserDTO(email, password, name, roleID, status);
                    }
                }
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return user;
    }

    public int signUp(UserDTO user) throws NamingException, SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "INSERT INTO tblAccount(email,password,name,roleID,status) VALUES(?,?,?,?,?)";

                ps = connect.prepareStatement(sql);

                ps.setString(1, user.getEmail());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getName());
                ps.setString(4, user.getRoleID());
                ps.setBoolean(5, user.isStatus());

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }

        return 0;
    }

    //check trùng
    public UserDTO getUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT email, password, name, roleID, status FROM tblAccount WHERE email=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
//                    String emaill=rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String roleID = rs.getString("roleID");
                    boolean status = rs.getBoolean("status");

                    user = new UserDTO(email, password, name, roleID, status);
                }
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return user;
    }

    public String sha256(String base) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
    
//    public static void main(String[] args) {
//        String code="bffeveryone2205";
//        UserDAO dao=new UserDAO();
//        System.out.println("RS: "+dao.sha256(code));
//    }

//    public synchronized String encode(String password)
//            throws NoSuchAlgorithmException, IOException {
//
//        String encodedPassword = null;
//        byte[] salt = base64ToByte(saltChars);
//
//        MessageDigest digest = MessageDigest.getInstance("SHA-256");
//        digest.reset();
//        digest.update(salt);
//
//        byte[] btPass = digest.digest(password.getBytes("UTF-8"));
//        for (int i = 0; i < ITERATION_COUNT; i++) {
//            digest.reset();
//            btPass = digest.digest(btPass);
//        }
//
//        encodedPassword = byteToBase64(btPass);
//        return encodedPassword;
//    }

//    private byte[] base64ToByte(String str) throws IOException {
//
//        BASE64Decoder decoder = new BASE64Decoder();
//        byte[] returnbyteArray = decoder.decodeBuffer(str);
//
//        return returnbyteArray;
//    }
//
//    private String byteToBase64(byte[] bt) {
//
//        BASE64Encoder endecoder = new BASE64Encoder();
//        String returnString = endecoder.encode(bt);
//
//        return returnString;
//    }
}
