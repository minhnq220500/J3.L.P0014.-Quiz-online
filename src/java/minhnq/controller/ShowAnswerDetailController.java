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

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "ShowAnswerDetailController", urlPatterns = {"/ShowAnswerDetailController"})
public class ShowAnswerDetailController extends HttpServlet {

    public final String SUCCESS="updateAnswer.jsp";
    public final String ERROR="error.jsp";
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
            String answerID=request.getParameter("answerID");
            String answerContent=request.getParameter("answerContent");
            String status=request.getParameter("status");
            String questionID=request.getParameter("questionID");
            String questionContent=request.getParameter("questionContent");
            String subjectID=request.getParameter("subjectID");
            
            request.setAttribute("answerID", answerID);
            request.setAttribute("answerContent", answerContent);
            request.setAttribute("status", status);
            request.setAttribute("questionID", questionID);
            request.setAttribute("questionContent", questionContent);
            request.setAttribute("subjectID", subjectID);
            
            if(status.toLowerCase().equals("true")){
                request.setAttribute("TRUE", "selected");
            }else if(status.toLowerCase().equals("false")){
                request.setAttribute("FALSE", "selected");
            }
            
            url=SUCCESS;
            
        }catch(Exception e){
            log("ERROR At ShowAnswerDetailController " + e.getMessage());
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
