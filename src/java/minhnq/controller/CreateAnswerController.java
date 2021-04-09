/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minhnq.daos.AnswerDAO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "CreateAnswerController", urlPatterns = {"/CreateAnswerController"})
public class CreateAnswerController extends HttpServlet {

    private final String SUCCESS="HomeController";
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
            AnswerDAO dao=new AnswerDAO();
            
            String questionID=request.getParameter("questionID");
            
            String answerID_A=questionID+"-A1";
            String answerContentA=request.getParameter("answerContentA");
            String cmbStatusA=request.getParameter("cmbStatusA");
            int answerA=dao.insertQuestion(answerID_A, answerContentA, cmbStatusA, questionID);
            if(answerA==1){
                url=SUCCESS;
            }
            
            String answerID_B=questionID+"-A2";
            String answerContentB=request.getParameter("answerContentB");
            String cmbStatusB=request.getParameter("cmbStatusB");
            int answerB=dao.insertQuestion(answerID_B, answerContentB, cmbStatusB, questionID);
            if(answerB==1){
                url=SUCCESS;
            }
            
            String answerID_C=questionID+"-A3";
            String answerContentC=request.getParameter("answerContentC");
            String cmbStatusC=request.getParameter("cmbStatusC");
            int answerC=dao.insertQuestion(answerID_C, answerContentC, cmbStatusC, questionID);
            if(answerC==1){
                url=SUCCESS;
            }
            
            String answerID_D=questionID+"-A4";
            String answerContentD=request.getParameter("answerContentD");
            String cmbStatusD=request.getParameter("cmbStatusD");
            int answerD=dao.insertQuestion(answerID_D, answerContentD, cmbStatusD, questionID);
            if(answerD==1){
                url=SUCCESS;
            }
            
            
        }catch(Exception e){
            log("ERROR At CreateAnswerController " + e.getMessage());
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
