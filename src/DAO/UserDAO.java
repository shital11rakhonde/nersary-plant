package DAO;

import entity.User;
import JDBC.Util.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private Connection conn;

    // ✅ Add this constructor if you're using connection injection
    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    // ✅ Add default constructor if needed without injected connection
    public UserDAO() throws SQLException {
        this.conn = jdbcUtilClass.openconnection(); // Automatically open connection
    }

    public boolean registerUser(User user) {
        boolean result = false;
        try {
            String query = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // ✅ Add login method if not already present
    public User login(String email, String password) {
        User user = null;
        try {
            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
            	// System.out.println("Email from DB: " + rs.getString("email"));
            	  //  System.out.println("Role from DB: " + rs.getString("role")); 
            	
                user = new User();
                user.setId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    

    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id")); 
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        }
        return users;
    }

 // DAO/UserDAO.java
    public boolean deleteUserById(int id) throws SQLException {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

}
