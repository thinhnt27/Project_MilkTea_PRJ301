/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtils;

/**
 *
 * @author Cicca
 */
public class TeaDAO {

    private static final String GET_ALL_TEA = "SELECT * FROM tblProducts";
    private static final String GET_TEA_BY_ID = "SELECT * FROM tblProducts WHERE productID = ?";
    private static final String QUANTITY = "SELECT quantity FROM tblProducts WHERE productID = ?";
    private static final String INSERT_ORDER = "INSERT INTO tblOrders(orderID, userID, date, total, adress, phone) VALUES(?,?,?,?,?,?)";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO tblOrderDetails(orderDetailID, orderID, productID, price, quantity) VALUES(?,?,?,?,?)";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity = ? WHERE productID = ?";
    private static final String PRODUCT_LIST = "SELECT productID, name, price, quantity FROM tblProducts";
    private static final String DELETE_PRODUCT = "DELETE FROM tblProducts WHERE productID = ?";
    private static final String INSERT_PRODUCT = "INSERT INTO tblProducts(productID, name, price, quantity, image) VALUES(?,?,?,?,?)";
    private static final String UPDATE_PRODUCT = "UPDATE tblProducts SET name = ?, price = ?, quantity = ?, image = ?  WHERE productID = ?";
    private static final String SEARCH_PRODUCT = "SELECT * FROM tblProducts WHERE name like ?";
    private static final String TOTAL_PRODUCT = "SELECT count(*) FROM tblProducts";
    private static final String GET_INDEX_TO_PADDING_PRODUCT = "SELECT * FROM tblProducts ORDER BY productID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
    private static final String ALL_PRODUCT = "SELECT * FROM tblProducts";
    private static final String UPDATE = "UPDATE tblProducts SET name = ?, price = ?, quantity = ?, imageURL = ? WHERE productID = ?";
    private static final String SEARCH = "SELECT productID, name, price, quantity, imageURL FROM tblProducts WHERE name like ?";
    private static final String ADD_PRODUCT = "INSERT INTO tblProducts(productID, name, price, quantity, imageURL) VALUES(?,?,?,?,?)";
    
    
    //đếm số lượng product trong DB
    public int getTotalProduct() throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TOTAL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return 0;
    }
    public List<Tea> paddingTea(int index) throws SQLException{
        List<Tea> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_INDEX_TO_PADDING_PRODUCT);
                ptm.setInt(1, (index - 1)*5);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    listTea.add(new Tea(id, name, price, quantity, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }
//    public static void main(String[] args) throws SQLException {
//        TeaDAO dao = new TeaDAO();
////        int count = dao.getTotalProduct();
////        System.out.println(count);
//        List<Tea> list = dao.paddingTea(2);
////        List<Category> listC = dao.getAllCategory();
////
//        for (Tea o : list) {
//            System.out.println(o);
//        }
//    }
    public List<Tea> getAllTea() throws SQLException {
        List<Tea> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_TEA);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    listTea.add(new Tea(id, name, price, quantity, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public Tea getTeaById(String Id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TEA_BY_ID);
                ptm.setString(1, Id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    return new Tea(id, name, price, quantity, image);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }
       

public List<Tea> getListTea(String search) throws SQLException {
        List<Tea> listTeaSearch = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    listTeaSearch.add(new Tea(id, name, price, quantity, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTeaSearch;
    }
    public int getQuantity(String teaID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(QUANTITY);
                ptm.setString(1, teaID);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return quantity;
    }

    public boolean checkSoldOut(String teaID, int quantityCart) throws SQLException {
        boolean check = false;
        int quantityDB = getQuantity(teaID);
        if (quantityDB - quantityCart < 0) check = true;
        return check;
    }

    public boolean insertOrder(OrderDTO orderDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, orderDTO.getOrderID());
                ptm.setString(2, orderDTO.getUserID());
                ptm.setDate(3, orderDTO.getDate());
                ptm.setDouble(4, orderDTO.getTotal());
                ptm.setString(5, orderDTO.getAdress());
                ptm.setString(6, orderDTO.getPhone());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertOrderDetail(OrderDetailDTO orderDetailDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                ptm.setString(1, orderDetailDTO.getOrderDetailID());
                ptm.setString(2, orderDetailDTO.getOrderID());
                ptm.setString(3, orderDetailDTO.getProductID());
                ptm.setDouble(4, orderDetailDTO.getPrice());
                ptm.setInt(5, orderDetailDTO.getQuantity());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateQuantity(String teaID, int quantityCart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                int quantityDB = getQuantity(teaID);
                int quantityUpdate = quantityDB - quantityCart;
                ptm.setInt(1, quantityUpdate);
                ptm.setString(2, teaID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public void deleteProduct(String pid) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setString(1, pid);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean delete(String pid) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setString(1, pid);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(Tea tea) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_PRODUCT);
                ptm.setString(1, tea.getId());
                ptm.setString(2, tea.getName());
                ptm.setDouble(3, tea.getPrice());
                ptm.setInt(4, tea.getQuantity());
                ptm.setString(5, tea.getImage());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public void insert(String id, String name, String price, int quantity, String image) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_PRODUCT);
                ptm.setString(1, id);
                ptm.setString(2, name);
                ptm.setString(3, price);
                ptm.setInt(4, quantity);
                ptm.setString(5, image);
                boolean check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void editProduct(String name, String image, double price, int quantity, String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT);
                ptm.setString(1, name);
                ptm.setDouble(2, price);
                ptm.setInt(3, quantity);
                ptm.setString(4, image);
                ptm.setString(5, productID);
                ptm.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean editProduct(Tea tea) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT);
                
                ptm.setString(1, tea.getName());
                ptm.setDouble(2, tea.getPrice());
                ptm.setInt(3, tea.getQuantity());
                ptm.setString(4, tea.getImage());
                ptm.setString(5, tea.getId());

                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
