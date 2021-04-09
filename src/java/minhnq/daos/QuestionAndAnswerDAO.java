/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import minhnq.dtos.QuestionAndAnswerDTO;
import minhnq.dtos.QuestionDTO;
import minhnq.utils.DBUtils;

/**
 *
 * @author Ticket 1
 */
public class QuestionAndAnswerDAO {
    
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
    
    public int countQuestionBySubject(String subjectID) throws SQLException{
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT count(*) FROM tblQuestion WHERE subjectID = ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, subjectID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }
    
    public List<QuestionAndAnswerDTO> getListQuestionAnswerBySubject(String subject, int index, int size) throws SQLException {
        List<QuestionAndAnswerDTO> list = new ArrayList<>();

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = " with x as (select ROW_NUMBER() over (order by questionContent asc) as r, "
                        + " questionContent, answerContent from tblQuestion Q inner join tblAnswer A ON Q.questionID=A.questionID where Q.questionID =?) "
                        + "select TOP 40 questionContent, answerContent from x where r between ? * ? - ( ? - 1 ) and ? * ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, subject);
                ps.setInt(2, index);
                ps.setInt(3, size);
                ps.setInt(4, size);
                ps.setInt(5, index);
                ps.setInt(6, size);
                
                rs = ps.executeQuery();

                while (rs.next()) {
                    String questionContent = rs.getString("questionContent");
                    String answerContent = rs.getString("answerContent");

                    QuestionAndAnswerDTO QA=new QuestionAndAnswerDTO(questionContent, answerContent);

                    list.add(QA);

                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return list;
    }
    
}
