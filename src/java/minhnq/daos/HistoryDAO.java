/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import minhnq.utils.DBUtils;

/**
 *
 * @author Ticket 1
 */
public class HistoryDAO {
    Connection connect;
    PreparedStatement ps;
    ResultSet rs;

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
    
    public int insertHistory(String email, String subjectID, String correctAnswerID, String quiztime,float grade) throws SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "INSERT INTO tblHistoryQuiz(email,subjectID,correctAnswerID,quiztime,grade) VALUES(?,?,?,?,?)";
                ps = connect.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, subjectID);
                ps.setString(3, correctAnswerID);
                ps.setString(4, quiztime);
                ps.setFloat(5, grade);

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }
}
