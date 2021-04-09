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
import javax.servlet.http.HttpSession;
import minhnq.daos.AnswerDAO;
import minhnq.daos.HistoryDAO;
import minhnq.dtos.AnswerDTO;
import minhnq.dtos.HistoryDTO;
import minhnq.dtos.QuestionDTO;
import minhnq.dtos.UserDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "TotalController", urlPatterns = {"/TotalController"})
public class TotalController extends HttpServlet {

    private final String SUCCESS = "total.jsp";
    private final String ERROR = "error.jsp";

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
        String url = ERROR;
        try {
            String subjectID = request.getParameter("subjectID");

            HttpSession session = request.getSession();

            List<QuestionDTO> list_Question_Answered = (List<QuestionDTO>) session.getAttribute("LIST_QUESTION_ANSWERED");

            float grade = 0;
            int correctAnswer = 0;
            
            if(list_Question_Answered==null){
                request.setAttribute("CORRECT", correctAnswer);
                request.setAttribute("GRADE", grade);
                url = SUCCESS;
            }
            
            String studentAnswerID = null;
            String answerID=null;
            AnswerDAO dao = new AnswerDAO();

            if (subjectID.equals("PRJ311")) {

//                for (int i = 0; i < list_answer.size(); i++) {
////                        boolean status=list_answer.get(i).isStatus();
//
//                    if (list_answer.get(i).isStatus() == true) {
//                        grade++;
//                        correctAnswer++;
//
//                    }
//                    answerID = answerID + ", " + list_answer.get(i).getAnswerID();
//                }

                for (QuestionDTO questionDTO : list_Question_Answered) {
                    studentAnswerID = questionDTO.getStudentAnswer();
                    boolean status=dao.getStatusByAnswerID(studentAnswerID);

                    if (status==true) {
                        grade++;
                        correctAnswer++;
                    }
                    answerID=studentAnswerID+", "+answerID;
                }
                grade = grade / 4;
            }
            if (subjectID.equals("PRJ321")) {
//                for (int i = 0; i < list_answer.size(); i++) {
////                        boolean status=list_answer.get(i).isStatus();
//
//                    if (list_answer.get(i).isStatus() == true) {
//                        grade++;
//                        correctAnswer++;
//
//                    }
//                    answerID = answerID + ", " + list_answer.get(i).getAnswerID();
//                }
                
                for (QuestionDTO questionDTO : list_Question_Answered) {
                    studentAnswerID = questionDTO.getStudentAnswer();
                    boolean status=dao.getStatusByAnswerID(studentAnswerID);

                    if (status==true) {
                        grade++;
                        correctAnswer++;
                    }
                    answerID=studentAnswerID+", "+answerID;
                }

                grade = grade / 5;
            }

            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String email = user.getEmail();

            String QUIZTIME = (String) session.getAttribute("QUIZ_TIME");

            HistoryDAO history_dao = new HistoryDAO();

            int history = history_dao.insertHistory(email, subjectID, answerID, QUIZTIME, grade);
            if (history == 1) {
                request.setAttribute("CORRECT", correctAnswer);
                request.setAttribute("GRADE", grade);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("ERROR At TotalController: " + e.getMessage());
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
