package DAO;

import entity.CartItem;
import entity.Order;
import entity.OrderItem;
import JDBC.Util.jdbcUtilClass;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection conn;

    public OrderDAO() throws SQLException {
        this.conn = jdbcUtilClass.openconnection(); // get connection from utility
    }

    
    // ---------------- PLACE ORDER (used by PlaceOrderServlet) ----------------
    public boolean placeOrder(int userId, String address, List<CartItem> cart) {
        String orderSql = "INSERT INTO orders (user_id, order_date, total_amount, status, address) VALUES (?, NOW(), ?, ?, ?)";
        String itemSql = "INSERT INTO order_items (order_id, plant_id, quantity, price) VALUES (?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false);

            double totalAmount = 0;
            for (CartItem item : cart) {
                totalAmount += item.getTotalPrice() * item.getQuantity();
            }

            // Insert into orders table
            int orderId = -1;
            try (PreparedStatement ps = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, userId);
                ps.setDouble(2, totalAmount);
                ps.setString(3, "Pending"); // default status
                ps.setString(4, address);
                ps.executeUpdate();

                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }
            }

            if (orderId == -1) {
                conn.rollback();
                return false;
            }

            // Insert order items
            try (PreparedStatement ps = conn.prepareStatement(itemSql)) {
                for (CartItem item : cart) {
                    ps.setInt(1, orderId);
                    ps.setInt(2, item.getPlant().getId()); // assuming CartItem has Plant object
                    ps.setInt(3, item.getQuantity());
                    ps.setDouble(4, item.getTotalPrice());
                    ps.addBatch();
                }
                ps.executeBatch();
            }

            conn.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    // ---------------- GET ALL ORDERS (Admin Panel) ----------------
    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.user_id, u.name, u.email, o.order_date, o.total_amount, o.status, o.address " +
                     "FROM orders o JOIN users u ON o.user_id = u.user_id ORDER BY o.order_date DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setUserName(rs.getString("name"));
                order.setUserEmail(rs.getString("email"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setAddress(rs.getString("address"));
                orders.add(order);
            }
        }
        return orders;
    }

    // ---------------- UPDATE ORDER STATUS ----------------
    public boolean updateOrderStatus(int orderId, String status) throws SQLException {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        }
    }

    // ---------------- GET SINGLE ORDER ----------------
    public Order getOrderById(int orderId) throws SQLException {
        Order order = null;
        String sql = "SELECT o.order_id, o.user_id, u.name, u.email, o.order_date, o.total_amount, o.status, o.address " +
                     "FROM orders o JOIN users u ON o.user_id = u.user_id WHERE o.order_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    order = new Order();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setUserName(rs.getString("name"));
                    order.setUserEmail(rs.getString("email"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setAddress(rs.getString("address"));

                    // fetch items
                    order.setItems(getOrderItems(orderId));
                }
            }
        }
        return order;
    }

    // ---------------- GET ORDER ITEMS ----------------
    public List<OrderItem> getOrderItems(int orderId) throws SQLException {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.order_item_id, oi.order_id, oi.plant_id, p.name, oi.quantity, oi.price " +
                     "FROM order_items oi JOIN plants p ON oi.plant_id = p.plant_id WHERE oi.order_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setId(rs.getInt("order_item_id"));
                    item.setOrderId(rs.getInt("order_id"));
                    item.setPlantId(rs.getInt("plant_id"));
                    item.setPlantName(rs.getString("name"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setPrice(rs.getDouble("price"));
                    items.add(item);
                }
            }
        }
        return items;
    }
}
