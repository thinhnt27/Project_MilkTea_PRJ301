/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Cicca
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {
    private static final String ERROR = "signUp.jsp";
    private static final String SUCCESS = "login.html";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            UserDAO userDAO = new UserDAO();
            if (userID.trim().length() < 2 || userID.trim().length() > 10) {
                userError.setUserIDError("User ID must be in {2,10}");
                checkValidation = false;
            }
//            boolean checkDuplicate = userDAO.checkDuplicate(userID);
//            if (checkDuplicate) {
//                userError.setUserIDError("Duplicate User ID !");
//                checkValidation = false;
//            }
            if (fullName.trim().length() < 5 || fullName.trim().length() > 20) {
                userError.setFullNameError("Full Name must be in {5,20}");
                checkValidation = false;
            }
            if (!password.trim().equals(confirm.trim())) {
                userError.setConfirmError("Hai password khong giong nhau!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
//                boolean checkInsert = userDAO.insert(user);
                boolean checkInsert = userDAO.insertV2(user);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Unknow error!");
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            System.out.println("Error at CreateController: " + e.toString());
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Trung khoa chinh roi kia");
                request.setAttribute("USER_ERROR", userError);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
