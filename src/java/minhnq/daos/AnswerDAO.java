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
import java.util.ArrayList;
import java.util.List;
import minhnq.dtos.AnswerDTO;
import minhnq.utils.DBUtils;

/**
 *
 * @author Ticket 1
 */
public class AnswerDAO {
    Connection connect = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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
    
    public int updateAnswer(String answerID, String answerContent, String status) throws SQLException{
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblAnswer SET answerContent=?, status=? WHERE answerID=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, answerContent);
                ps.setString(2, status);
                ps.setString(3, answerID);

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }
    
    public int insertQuestion(String answerID, String answerContent, String status, String questionID) throws SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "INSERT INTO tblAnswer(answerID,answerContent,status,questionID) VALUES(?,?,?,?)";
                ps = connect.prepareStatement(sql);
                ps.setString(1, answerID);
                ps.setString(2, answerContent);
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
    

    // KHÔNG CÓ DELETE ANSWER NHAAAAAAAAAAAAAAAA CHỈ CÓ UPDATE CÂU ĐÚNG CÂU SAI THÔI
    public int deleteAnswerByID(String answerID) throws SQLException {
        try {
            connect = DBUtils.getConnection();
            if (connect != null) {
                String sql = "DELETE FROM tblAnswer WHERE answerID=?";
                ps = connect.prepareStatement(sql);
                ps.setString(1, answerID);

                return ps.executeUpdate();
            }
        } catch (Exception e) {

        } finally {
            closeConnection();
        }
        return 0;
    }
    
    public List<AnswerDTO> getListAnswerByQuestionID(String questionID) throws SQLException{
        List<AnswerDTO> list=new ArrayList<>();
        
        try{
            connect=DBUtils.getConnection();
            if(connect!=null){
                String sql="SELECT answerID, answerContent, status, questionID FROM tblAnswer WHERE questionID=?";
                ps=connect.prepareStatement(sql);
                ps.setString(1, questionID);
                rs=ps.executeQuery();
                
                while(rs.next()){
                    String answerID=rs.getString("answerID");
                    String answerContent=rs.getString("answerContent");
                    boolean status=rs.getBoolean("status");
//                    String questionDD=rs.getString("questionID");
                    
                    AnswerDTO answer=new AnswerDTO(answerID, answerContent, status, questionID);
                    
                    list.add(answer);
                }
            }
        }catch(Exception e){
            
        }finally{
            closeConnection();
        }
        return list;
    }
    
    public AnswerDTO getAnswerByID(String answerID) throws SQLException{
        AnswerDTO answer=null;
        try{
            connect=DBUtils.getConnection();
            if(connect!=null){
                String sql="SELECT answerID, answerContent, status, questionID FROM tblAnswer WHERE answerID=?";
                ps=connect.prepareStatement(sql);
                ps.setString(1, answerID);
                
                rs=ps.executeQuery();
                if(rs.next()){
//                    String answerID=rs.getString("answerID");
                    String answerContent=rs.getString("answerContent");
                    boolean status=rs.getBoolean("status");
                    String questionID=rs.getString("questionID");
                    
                    answer=new AnswerDTO(answerID, answerContent, status, questionID);
                }
            }
        }catch(Exception e){
            
        }finally{
            closeConnection();
        }
        return answer;
    }
    
    public boolean getStatusByAnswerID(String answerID) throws SQLException{
        boolean status=false;
        try{
            connect=DBUtils.getConnection();
            if(connect!=null){
                String sql="SELECT status FROM tblAnswer WHERE answerID=?";
                ps=connect.prepareStatement(sql);
                ps.setString(1, answerID);
                rs= ps.executeQuery();
                
                if(rs.next()){
                    status=rs.getBoolean("status");
                }
            }
        }catch(Exception e){
            
        }finally{
            closeConnection();
        }
        return status;
    }
}
