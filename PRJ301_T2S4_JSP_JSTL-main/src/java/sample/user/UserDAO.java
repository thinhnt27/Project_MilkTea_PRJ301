/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.shopping.Tea;
import sample.utils.DBUtils;

/**
 *
 * @author Cicca
 */
public class UserDAO {

    private static final String LOGIN = "SELECT fullName, roleID FROM tblUsers WHERE userID=? "
            + "AND password=?";
    private static final String SEARCH = "SELECT userID, fullName, roleID FROM tblUsers WHERE fullName like ?";
    private static final String DELETE = "DELETE tblUsers WHERE userID =?";
    private static final String UPDATE = "UPDATE tblUsers SET fullName = ?, roleID = ? WHERE userID = ?";
    private static final String CHECK_DUPLICATE = "SELECT fullName FROM tblUsers WHERE userID = ?";
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, roleID, password) VALUES(?,?,?,?)";
    private static final String GET_USER = "SELECT * FROM tblUsers WHERE userID = ?";
    private static final String ADD_USER = "INSERT INTO tblUsers(userID, fullName, roleID, password) VALUES(?,?,?,?)";
    private static final String SELECT_TOP_2 = "Select top 2 userId, fullName, roleID from tblUsers";
    
    public List<UserDTO> getTop2() throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_TOP_2);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    listUser.add(new UserDTO(userID, fullName, roleID, password));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return listUser;
    }
    public boolean insert(String userID, String fullName, String roleID, String password) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_USER);
                ptm.setString(1, userID);
                ptm.setString(2, fullName);
                ptm.setString(3, roleID);
                ptm.setString(4, password);
                
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    public boolean checkExistUser(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, fullName, roleID, "");
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
        return user;
    }


    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    listUser.add(new UserDTO(userID, fullName, roleID, password));
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
        return listUser;
    }

    public boolean delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
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

    public boolean update(UserDTO userDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, userDTO.getFullName());
                ptm.setString(2, userDTO.getRoleID());
                ptm.setString(3, userDTO.getUserID());
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

    public boolean insert(UserDTO userDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, userDTO.getUserID());
                ptm.setString(2, userDTO.getFullName());
                ptm.setString(3, userDTO.getRoleID());
                ptm.setString(4, userDTO.getPassword());

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

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public boolean insertV2(UserDTO userDTO) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, userDTO.getUserID());
                ptm.setString(2, userDTO.getFullName());
                ptm.setString(3, userDTO.getRoleID());
                ptm.setString(4, userDTO.getPassword());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
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
