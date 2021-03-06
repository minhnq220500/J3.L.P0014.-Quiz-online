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
import minhnq.daos.QuestionDAO;
import minhnq.daos.SubjectDAO;
import minhnq.dtos.QuestionDTO;
import minhnq.dtos.SubjectDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

    private final String SUCCESS="home.jsp";
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
            SubjectDAO dao_sub =new SubjectDAO();
            
            String search="";
            
            List<SubjectDTO> list=dao_sub.getListSubject(search);
            //
            
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
            
            //
            if(list!=null){
                request.setAttribute("LIST_SUBJECT", list);
                request.setAttribute("LIST_QUESTION", list_question);
                request.setAttribute("endPage", endPage);
                request.setAttribute("INDEX", index);
                url=SUCCESS;
            }
        }catch(Exception ex){
            log("ERROR At HomeController_SQL " + ex.getMessage());
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
