/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnq.daos.QuestionDAO;
import minhnq.daos.SubjectDAO;
import minhnq.daos.UserDAO;
import minhnq.dtos.QuestionDTO;
import minhnq.dtos.SubjectDTO;
import minhnq.dtos.UserDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private final String SUCCESS="HomeController";
    private final String FAILURE = "login.jsp";
    private final String ERROR="invalid.jsp";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url=ERROR;
        try {
            String email=request.getParameter("txtEmail");
            String password=request.getParameter("txtPassword");
            
            UserDAO dao = new UserDAO();
            SubjectDAO dao_sub=new SubjectDAO();
            
            List<SubjectDTO> list=dao_sub.getListSubject("");

            int index=1;
            
            QuestionDAO dao_ques= new QuestionDAO();
            
            String txtSearch="";
            int count = dao_ques.count(txtSearch);
            
            int pageSize = 20;// mỗi trang 20 câu
            int endPage = 0;

            endPage = count / pageSize;
            if(count%pageSize!=0){
                endPage++;
            }
            
            List<QuestionDTO> list_question=dao_ques.getListQuestionByName(txtSearch, index, pageSize);
            
            String decodePass=dao.sha256(password);
            
            UserDTO userVuaDangNhap = dao.checkLogin(email, decodePass);
            
            if(userVuaDangNhap!=null){
                HttpSession session=request.getSession();
                session.setAttribute("LOGIN_USER", userVuaDangNhap);
                session.setAttribute("LIST_SUBJECT", list);
                request.setAttribute("LIST_QUESTION", list_question);
                request.setAttribute("endPage", endPage);
                request.setAttribute("INDEX", index);
                url=SUCCESS;
            }else{
                request.setAttribute("MESSAGE", "Wrong Email or Password");
                url=FAILURE;
            }
            
        }catch (SQLException ex) {
            log("ERROR At LoginController_SQL " + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
