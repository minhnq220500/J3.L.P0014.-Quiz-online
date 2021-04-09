/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnq.daos.QuestionDAO;
import minhnq.dtos.QuestionDTO;
import minhnq.dtos.UserDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "CreateQuestionController", urlPatterns = {"/CreateQuestionController"})
public class CreateQuestionController extends HttpServlet {

    private final String SUCCESS="createAnswer.jsp";
    private final String FAIL="createQuestion.jsp";
    private final String ERROR="error.jsp";
    
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
            String questionID=request.getParameter("questionID");
            String questionContent=request.getParameter("questionContent");
            String cmbSubject=request.getParameter("cmbSubject");
            
            QuestionDAO dao=new QuestionDAO();
            
            boolean checkDupID=dao.checkDuplicate(questionID);
            if(checkDupID==true){
                request.setAttribute("MESSAGE", "Question ID has been used!");
                url=FAIL;
            }
            
            Date createDate=new Date();
            boolean status=true;
            
            HttpSession session=request.getSession();
            UserDTO user=(UserDTO) session.getAttribute("LOGIN_USER");
            String email=user.getEmail();
            
            QuestionDTO question=new QuestionDTO(questionID, questionContent, createDate, status, cmbSubject, email);
            
            int createQuestion=dao.insertQuestion(question);
            
            if(createQuestion==1){
                request.setAttribute("SUCCESS", "Add question to database successfully!");
                request.setAttribute("questionID", questionID);
                request.setAttribute("questionContent", questionContent);
                request.setAttribute("subject", cmbSubject);
                url=SUCCESS;
            }
            
            
        }catch(Exception e){
            log("ERROR At CreateQuestionController " + e.getMessage());
        }finally{
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
