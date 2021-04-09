/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minhnq.daos.AnswerDAO;
import minhnq.daos.QuestionDAO;
import minhnq.dtos.AnswerDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "QuestionToAnswerController", urlPatterns = {"/QuestionToAnswerController"})
public class QuestionToAnswerController extends HttpServlet {

    String SUCCESS="detail.jsp";
    String ERROR="error.jsp";
    
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
            String subjectID=request.getParameter("subjectID");
            
            AnswerDAO dao_ans=new AnswerDAO();
            List<AnswerDTO> list=dao_ans.getListAnswerByQuestionID(questionID);
            
            if(list!=null){
                request.setAttribute("LIST_ANSWER", list);
                request.setAttribute("QUESTION_ID", questionID);
                request.setAttribute("QUESTION_CONTENT", questionContent);
                request.setAttribute("SUBJECT_ID", subjectID);
                
                url=SUCCESS;
            }
            
            
            
        }catch(Exception e){
            log("ERROR At QuestionToAnswerController " + e.getMessage());
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
