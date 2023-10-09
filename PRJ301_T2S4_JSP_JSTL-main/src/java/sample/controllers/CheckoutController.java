/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.OrderDTO;
import sample.shopping.OrderDetailDTO;
import sample.shopping.Tea;
import sample.shopping.TeaDAO;
import sample.user.UserDTO;

/**
 *
 * @author Cicca
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

//    private static final String ERROR = "checkout.jsp";
//    private static final String SUCCESS = "checkout.jsp";
    private static final String ERROR = "confirmCheckOut.jsp";
    private static final String SUCCESS = "confirmCheckOut.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("Name");
            String phoneNumber = request.getParameter("Phone");
            String adress = request.getParameter("Adress");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            TeaDAO teaDAO = new TeaDAO();
            if (cart == null) {
                request.setAttribute("ERROR", "Cart is empty!");
            } else if (name != null && phoneNumber != null && adress != null) {
                boolean isSoldOut = false;
                boolean isError = false;
                for (Tea item : cart.getCart().values()) {
                    isSoldOut = teaDAO.checkSoldOut(item.getId().trim(), item.getQuantity());
                    if (isSoldOut) {
                        if(item.getQuantity() == 0){
                            request.setAttribute("ERROR", item.getName() + " is sold out! Check again");
                        }
                        if(item.getQuantity() > 0){
                            request.setAttribute("ERROR", item.getName() + " don't enough");
                        }
                        isError = true;
                    }
                }
                if (!isError) {
                    UUID uuid = UUID.randomUUID();
                    String orderID = uuid.toString();
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    String userID = "";
//                    if (loginUser == null) userID = phoneNumber;
//                    else userID = loginUser.getUserID();
                    userID = loginUser.getUserID();
                    long millis = System.currentTimeMillis();
                    Date date = new Date(millis);
                    double total = Double.parseDouble(request.getParameter("total"));
                    boolean isInsertOrder = teaDAO.insertOrder(new OrderDTO(orderID, userID, date, total, adress, phoneNumber));
                    if (isInsertOrder) {
                        boolean isInsertDetail = false;
                        boolean isUpdate = false;
                        for (Tea item : cart.getCart().values()) {
                            uuid = UUID.randomUUID();
                            String orderDetailID = uuid.toString();
                            String productID = item.getId();
                            double price = item.getPrice();
                            int quantity = item.getQuantity();
                            isInsertDetail = teaDAO.insertOrderDetail(
                                    new OrderDetailDTO(orderDetailID, orderID, productID, price, quantity)
                            );
                            isUpdate = teaDAO.updateQuantity(item.getId(), item.getQuantity());
                        }
                        if (isInsertDetail && isUpdate) {
                            System.out.println("success");
                            request.setAttribute("MESSAGE_SUCCESS", "Checkout successfully!");
                            request.setAttribute("ORDER_ID", orderID);
                            cart.setCart(null);
                            session.setAttribute("CART_SIZE", 0);
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
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
