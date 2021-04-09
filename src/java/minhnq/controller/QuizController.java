/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhnq.daos.QuestionDAO;
import minhnq.dtos.AnswerDTO;
import minhnq.dtos.QuestionDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "QuizController", urlPatterns = {"/QuizController"})
public class QuizController extends HttpServlet {

    private final String SUCCESS = "quiz.jsp";
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

            String subjectID = request.getParameter("subjectID");
            
            //
            String QUIZ_TIME = (String) session.getAttribute("QUIZ_TIME");

            String indexString = request.getParameter("index");

            int index = Integer.parseInt(indexString);

            //nếu index =max +1 thì nó sẽ quay về index-1
            if (index == 41 && subjectID.equals("PRJ311")) {
                index = 1;
            } else if (index == 51 && subjectID.equals("PRJ321")) {
                index = 1;
            }

//            if (index == 50 && subjectID.equals("PRJ321")) {
//                request.setAttribute("OK", "OK");
//            } else if (index == 40 && subjectID.equals("PRJ311")) {
//                request.setAttribute("OK", "OK");
//            }

            index--;

            QuestionDAO dao = new QuestionDAO();

            int count = 0;
            if (subjectID.equals("PRJ311")) {
                count = 40;

                if (QUIZ_TIME == null) {
                    Calendar now = Calendar.getInstance();///Thời gian hiện tại
                    now.add(Calendar.MINUTE, 60);//Thời gian hiện tại + n phút
                    Date QuizTime = now.getTime();//Chuyển từ dạng calendar sang Date
                    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss");//Đổi sang định dạng Date cho JavaScript
                    String QuizTimeString = dateFormat.format(QuizTime);
                    session.setAttribute("QUIZ_TIME", QuizTimeString);
                }
            } else if (subjectID.equals("PRJ321")) {
                count = 50;

                if (QUIZ_TIME == null) {
                    Calendar now = Calendar.getInstance();///Thời gian hiện tại
                    now.add(Calendar.MINUTE, 80);//Thời gian hiện tại + n phút
                    Date QuizTime = now.getTime();//Chuyển từ dạng calendar sang Date
                    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss");//Đổi sang định dạng Date cho JavaScript
                    String QuizTimeString = dateFormat.format(QuizTime);
                    session.setAttribute("QUIZ_TIME", QuizTimeString);
                }
            }

            int pageSize = 1;// mỗi trang 1 câu
            int endPage = 0;

            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }

            //random question
            List<QuestionDTO> list_question = (List<QuestionDTO>) session.getAttribute("LIST_QUESTION");

            if (list_question == null) {
                list_question = dao.getRandomQuestionToTakeQuiz(subjectID);
                //nếu list đang rỗng thì tạo ra list mới

                for(int i=0;i<list_question.size();i++){
                    session.setAttribute("questionIndex - "+i, list_question.get(i).getQuestionID());
                }
                
                QuestionDTO question = list_question.get(index);

                request.setAttribute("QUESTION", question);

                index = index + 2;
                request.setAttribute("endPage", endPage);
                request.setAttribute("index", index);
                request.setAttribute("SUBJECT_ID", subjectID);
                session.setAttribute("LIST_QUESTION", list_question);

                //để gán ở chỗ header đển làm biến mất phần Home
                //lỡ người dùng có nhấn nhầm nút Home khi đang làm quiz thì sẽ không bị lỗi
                //chỉ có thể thoát quiz ngay khi bấm finish hoặc logout
                session.setAttribute("DANG_LAM_QUIZ_DO_NHA", "OKE");

                url = SUCCESS;

            } else {

                //có list mới thì sử dụng thôi
                QuestionDTO question = list_question.get(index);

                request.setAttribute("QUESTION", question);

                index = index + 2;
                request.setAttribute("endPage", endPage);
                request.setAttribute("index", index);
                request.setAttribute("SUBJECT_ID", subjectID);

                url = SUCCESS;

            }

        } catch (Exception e) {
            log("ERROR At QuizController " + e.getMessage());
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
