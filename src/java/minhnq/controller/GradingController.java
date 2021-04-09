/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnq.daos.AnswerDAO;
import minhnq.daos.QuestionDAO;
import minhnq.dtos.AnswerDTO;
import minhnq.dtos.QuestionDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "GradingController", urlPatterns = {"/GradingController"})
public class GradingController extends HttpServlet {

    private final String SUCCESS = "QuizController";
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
            HttpSession session = request.getSession();
            String radAnswerID = request.getParameter("radAnswerID");

//            String indexString = request.getParameter("index");
//            int index = Integer.parseInt(indexString);
            String questionID = request.getParameter("questionID");
            QuestionDAO questionDAO = new QuestionDAO();
            QuestionDTO questionAnswered = questionDAO.getQuestionByQuestionID(questionID);

            AnswerDAO dao = new AnswerDAO();
            AnswerDTO answer = dao.getAnswerByID(radAnswerID);
            List<AnswerDTO> listAnswer=(List<AnswerDTO>) session.getAttribute("LIST_ANSWER");
            if (listAnswer == null) {
                listAnswer = new ArrayList<>();
            }

            //lưu câu trả lời vào 1 cái seesion để khi nhấn finish thì chấm điểm
            
            List<QuestionDTO> list_Question_Answered = (List<QuestionDTO>) session.getAttribute("LIST_QUESTION_ANSWERED");
            
            if (list_Question_Answered == null) {
                list_Question_Answered = new ArrayList<>();
                list_Question_Answered.add(questionAnswered);

                questionAnswered.setStudentAnswer(radAnswerID);

                listAnswer.add(answer);
                session.setAttribute("LIST_ANSWER", listAnswer);

//                session.setAttribute("studentAnswer", radAnswerID);
                session.setAttribute("LIST_QUESTION_ANSWERED", list_Question_Answered);

                url = SUCCESS;
            } else {
                listAnswer.add(answer);
                session.setAttribute("LIST_ANSWER", listAnswer);

                list_Question_Answered.add(questionAnswered);

//                    boolean status=answer.isStatus();
//                    for (int i = 0; i < list_Answer.size(); i++) {
//                        if (list_Answer.get(i).getAnswerID().equals(chkAnswerID)) {
//                            list_Answer.set(i, answer);
//                        }
//                    }
                // nếu cái question đó đã dc trả lời, thì mình sẽ sửa lại câu trả lời của nó
                for (QuestionDTO questionDTO : list_Question_Answered) {
                    if (questionDTO.getQuestionID().equals(questionID)) {
                        questionDTO.setStudentAnswer(radAnswerID);
                    }
                }

//                session.setAttribute("studentAnswer", radAnswerID);
                session.setAttribute("LIST_QUESTION_ANSWERED", list_Question_Answered);

                //nếu answer id truyền qua mà nó có rồi thì sẽ thực hiện update cái list
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("ERROR At GradingController " + e.getMessage());
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
