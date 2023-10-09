/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Tea;
import sample.shopping.TeaDAO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Cicca
 */
@WebServlet(name = "ManagerProductController", urlPatterns = {"/ManagerProductController"})
public class ManagerProductController extends HttpServlet {

    private static final String ERROR = "ManagerProduct.jsp";
    private static final String SUCCESS = "ManagerProduct.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
         String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String roleID = user.getRoleID();
            TeaDAO tea = new TeaDAO();
        List<Tea> list = tea.getAllTea();
        //set data to jsp
        session.setAttribute("LIST_TEA", list);
        session.setAttribute("SIZE_LIST", list.size());
            String indexPage = request.getParameter("index");
            if(indexPage == null){
                indexPage = "1";
            }
            int index =Integer.parseInt(indexPage);
            int count = tea.getTotalProduct();
            int lastPage = count/5;
            if(count % 5 != 0){
                lastPage++;
            }
            List<Tea> listPadding = tea.paddingTea(index);
            request.setAttribute("LIST_PADDING", listPadding);
            request.setAttribute("LAST_PAGE", lastPage);
            request.setAttribute("tag", index);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at ManagerProductController: " + e.toString());
        }finally{
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
