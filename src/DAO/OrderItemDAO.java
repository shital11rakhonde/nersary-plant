package DAO;

import entity.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAO {
    private Connection conn;

    public OrderItemDAO(Connection conn) {
        this.conn = conn;
    }

    public List<OrderItem> getItemsByOrderId(int orderId) throws SQLException {
        List<OrderItem> items = new ArrayList<>();

        String query = "SELECT oi.item_id, p.name AS plantName, oi.quantity, oi.price " +
                       "FROM order_items oi JOIN plants p ON oi.plant_id = p.plant_id " +
                       "WHERE oi.order_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setItemId(rs.getInt("item_id"));
                    item.setPlantName(rs.getString("plantName"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setPrice(rs.getDouble("price"));
                    items.add(item);
                }
            }
        }

        return items;
    }
    
    
    
}
