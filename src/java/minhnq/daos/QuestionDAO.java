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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import minhnq.dtos.QuestionDTO;
import minhnq.utils.DBUtils;

/**
 *
 * @author Ticket 1
 */
public class QuestionDAO {

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

    public List<QuestionDTO> getListQuestionByName(String name, int index, int size) throws SQLException {
        List<QuestionDTO> list = new ArrayList<>();

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = " with x as (select ROW_NUMBER() over (order by questionContent asc) as r, "
                        + "questionID, questionContent, createDate, status, subjectID, email from tblQuestion where questionContent like ? ) "
                        + "select questionID, questionContent, createDate, status, subjectID, email from x where r between ? * ? - ( ? - 1 ) and ? * ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");
                ps.setInt(2, index);
                ps.setInt(3, size);
                ps.setInt(4, size);
                ps.setInt(5, index);
                ps.setInt(6, size);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("questionContent");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("status");
                    String subjectID = rs.getString("subjectID");
                    String email = rs.getString("email");

                    QuestionDTO question = new QuestionDTO(questionID, questionContent, createDate, status, subjectID, email);

                    list.add(question);

                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return list;
    }
    
    public List<QuestionDTO> getListQuestionByStatus(String status, int index, int size) throws SQLException {
        List<QuestionDTO> list = new ArrayList<>();

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = " with x as (select ROW_NUMBER() over (order by questionContent asc) as r, "
                        + "questionID, questionContent, createDate, status, subjectID, email from tblQuestion where status = ? ) "
                        + "select questionID, questionContent, createDate, status, subjectID, email from x where r between ? * ? - ( ? - 1 ) and ? * ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, status );
                ps.setInt(2, index);
                ps.setInt(3, size);
                ps.setInt(4, size);
                ps.setInt(5, index);
                ps.setInt(6, size);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("questionContent");
                    Date createDate = rs.getDate("createDate");
                    boolean statuss = rs.getBoolean("status");
                    String subjectID = rs.getString("subjectID");
                    String email = rs.getString("email");

                    QuestionDTO question = new QuestionDTO(questionID, questionContent, createDate, statuss, subjectID, email);

                    list.add(question);

                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return list;
    }

    public List<QuestionDTO> getListQuestionBySubject(String subject, int index, int size) throws SQLException {
        List<QuestionDTO> list = new ArrayList<>();

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = " with x as (select ROW_NUMBER() over (order by questionContent asc) as r, "
                        + "questionID, questionContent, createDate, status, subjectID, email from tblQuestion where subjectID =?) "
                        + "select questionID, questionContent, createDate, status, subjectID, email from x where r between ? * ? - ( ? - 1 ) and ? * ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, subject);
                ps.setInt(2, index);
                ps.setInt(3, size);
                ps.setInt(4, size);
                ps.setInt(5, index);
                ps.setInt(6, size);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("questionContent");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("status");
                    String subjectID = rs.getString("subjectID");
                    String email = rs.getString("email");

                    QuestionDTO question = new QuestionDTO(questionID, questionContent, createDate, status, subjectID, email);

                    list.add(question);

                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return list;
    }

    /////////
    public List<QuestionDTO> getRandomQuestionToTakeQuiz(String subject) throws SQLException {
        List<QuestionDTO> list = new ArrayList<>();

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
//                String sql = " with x as (select ROW_NUMBER() over (order by NEWID() ) as r, "
//                        + " questionID, questionContent, createDate, status, subjectID, email from tblQuestion where subjectID =? and status='true') "
//                        + " select top 40 questionID, questionContent, createDate, status, subjectID, email from x where r between ? * ? - ( ? - 1 ) and ? * ? "
//                        + " order by NEWID() ";
                
                String sql=null;
                if(subject.equals("PRJ311")){
                    sql="SELECT TOP 40 questionID, questionContent, createDate, status, subjectID, email FROM tblQuestion "
                        + " WHERE subjectID=? AND status='true' "
                        + " ORDER BY NEWID() ";
                }
                
                else if(subject.equals("PRJ321")){
                    sql="SELECT TOP 50 questionID, questionContent, createDate, status, subjectID, email FROM tblQuestion "
                        + " WHERE subjectID=? AND status='true' "
                        + " ORDER BY NEWID() ";
                }
                
                ps = connect.prepareStatement(sql);
                ps.setString(1, subject);
//                ps.setInt(2, index);
//                ps.setInt(3, size);
//                ps.setInt(4, size);
//                ps.setInt(5, index);
//                ps.setInt(6, size);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("questionContent");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("status");
                    String subjectID = rs.getString("subjectID");
                    String email = rs.getString("email");

                    QuestionDTO question = new QuestionDTO(questionID, questionContent, createDate, status, subjectID, email);

                    list.add(question);

                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return list;
    }

    public int count(String name) throws SQLException {

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT count(*) FROM tblQuestion WHERE questionContent like ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");
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
    
    public int count2(String status) throws SQLException {

        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT count(*) FROM tblQuestion WHERE status = ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, status );
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

    public int countQuestionSubject(String subjectID) throws SQLException {
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

    //update question, update status là của delete làm
    public int updateQuestion(String questionContent, String subjectID, String status, String questionID) throws SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblQuestion SET questionContent=?, subjectID=?, status=? WHERE questionID=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, questionContent);
                ps.setString(2, subjectID);
                ps.setString(3, status);
                ps.setString(4, questionID);

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }

    //check duplicate question
    public boolean checkDuplicate(String questionID) throws SQLException {
        boolean result = false;//true là có trùng

//        String productID = null;
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "SELECT questionID FROM tblQuestion WHERE questionID=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, questionID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {

        } finally {
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
        return result;

    }

    //insert product
    //khi insert nhớ để ý vị trí
    public int insertQuestion(QuestionDTO question) throws SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "INSERT INTO tblQuestion(questionID,questionContent,createDate,status,subjectID,email) VALUES(?,?,?,?,?,?)";
                ps = connect.prepareStatement(sql);
                ps.setString(1, question.getQuestionID());
                ps.setString(2, question.getQuestionContent());
                ps.setTimestamp(3, new Timestamp(question.getCreateDate().getTime()));
                ps.setBoolean(4, question.isStatus());
                ps.setString(5, question.getSubject());
                ps.setString(6, question.getEmail());

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }

    //delete product
    public int deleteQuestionByID(String questionID) throws SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblQuestion SET status='False' WHERE questionID=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, questionID);

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }
    
    public QuestionDTO getQuestionByQuestionID(String questionID) throws SQLException{
        QuestionDTO question=null;
        try{
            connect=DBUtils.getConnection();
            if(connect!=null){
                String sql="SELECT questionID, questionContent, createDate, status, subjectID, email FROM tblQuestion WHERE questionID=?";
                ps=connect.prepareStatement(sql);
                ps.setString(1, questionID);
                rs=ps.executeQuery();
                
                if(rs.next()){
                    String questionIDD = rs.getString("questionID");
                    String questionContent = rs.getString("questionContent");
                    Date createDate = rs.getDate("createDate");
                    boolean status = rs.getBoolean("status");
                    String subjectID = rs.getString("subjectID");
                    String email = rs.getString("email");
                    
                    question=new QuestionDTO(questionID, questionContent, createDate, status, subjectID, email);
                }
            }
        }catch(Exception e){
            
        }finally{
            closeConnection();
        }
        return question;
    }

}
