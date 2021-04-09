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
import minhnq.dtos.SubjectDTO;
import minhnq.utils.DBUtils;

/**
 *
 * @author Ticket 1
 */
public class SubjectDAO {
    Connection connect;
    PreparedStatement ps;
    ResultSet rs;

    public SubjectDAO() {
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
    
    public List<SubjectDTO> getListSubject(String subjectName) throws SQLException{
        List<SubjectDTO> list=new ArrayList<>();
        
        try{
            connect=DBUtils.getConnection();
            if(connect!=null){
                String sql="SELECT subjectID, subjectName FROM tblSubject WHERE subjectName LIKE ? ";
                ps = connect.prepareStatement(sql);
                ps.setString(1, "%"+subjectName+"%");
                rs = ps.executeQuery();
                while(rs.next()){
                    String id=rs.getString("subjectID");
                    String name=rs.getString("subjectName");
                    SubjectDTO subject=new SubjectDTO(id, name);
                    
                    list.add(subject);
                }
                
            }
        }catch(Exception e){
            
        }finally{
            closeConnection();
        }
        return list;
    }
    
    public List<SubjectDTO> getListSubject() throws SQLException{
        List<SubjectDTO> list=new ArrayList<>();
        try{
            connect=DBUtils.getConnection();
            if(connect!=null){
                String sql="SELECT subjectID, subjectName FROM tblSubject";
                ps=connect.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                    String subjectID=rs.getString("subjectID");
                    String subjectName=rs.getString("subjectName");
                    
                    SubjectDTO sub=new SubjectDTO(subjectID, subjectName);
                    
                    list.add(sub);
                }
            }
        }catch(Exception ex){
            
        }finally{
            closeConnection();
        }
        
        return list;
    }
    
}
