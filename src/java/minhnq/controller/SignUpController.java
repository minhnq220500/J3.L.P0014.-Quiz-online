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
import javax.servlet.http.HttpSession;
import minhnq.daos.UserDAO;
import minhnq.dtos.UserDTO;

/**
 *
 * @author Ticket 1
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    private final String SUCCESS = "HomeController";
    private final String ERROR = "error.jsp";
    private final String FAILURE = "login.jsp";

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
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPasword");
            String rePass = request.getParameter("txtRepass");
            String name = request.getParameter("txtName");
            String roleID = "SD";
            boolean status = true;

            if (password.equals(rePass)) {
                UserDAO dao = new UserDAO();

                String passwordSHA = dao.sha256(password);

                UserDTO user = new UserDTO(email, passwordSHA, name, roleID, status);

                UserDTO checkDup = dao.getUserByEmail(email);
                if (checkDup != null) {
                    request.setAttribute("DUPLICATE", "This email has been used!");
                    url = FAILURE;
                } else {
                    
                    int dangKi = dao.signUp(user);
                    if (dangKi == 1) {
                        HttpSession session = request.getSession();
                        session.setAttribute("LOGIN_USER", user);
                        url = SUCCESS;
                    }
                    
                }

            }

        } catch (Exception ex) {
            log("SignUpController_SQL " + ex.getMessage());
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
