package DAO;

import entity.Plant;
import JDBC.Util.jdbcUtilClass;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlantDAO {
	private Connection conn;

    public PlantDAO() {
        // empty constructor
    }

    public void setConnection(Connection conn) {
        this.conn = conn;
    }

	 

    // ✅ Get all plants
    public List<Plant> getAllPlants() throws SQLException {
        List<Plant> list = new ArrayList<>();
        String sql = "SELECT * FROM plants";

        try (
            Connection con = jdbcUtilClass.openconnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                Plant p = new Plant();
                p.setId(rs.getInt("plant_id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        }

        return list;
    }

    // ✅ Get plant by ID
    public Plant getPlantById(int plantId) throws SQLException {
        Plant plant = null;
        String sql = "SELECT * FROM plants WHERE plant_id = ?";

        try (
            Connection con = jdbcUtilClass.openconnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, plantId);  // ✅ use 1 instead of 2

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    plant = new Plant();
                    plant.setId(rs.getInt("plant_id"));
                    plant.setName(rs.getString("name"));
                    plant.setCategory(rs.getString("category"));
                    plant.setPrice(rs.getDouble("price"));
                    plant.setDescription(rs.getString("description"));
                    plant.setImage(rs.getString("image"));
                }
            }
        }

        return plant;
    }
    
    
    
    public List<Plant> getPlantsByCategory(String category) throws Exception {
        List<Plant> list = new ArrayList<>();
        String sql = "SELECT * FROM plants WHERE category = ?";

        try (Connection conn = jdbcUtilClass.openconnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Plant plant = new Plant();
                plant.setId(rs.getInt("plant_id"));
                plant.setName(rs.getString("name"));
                plant.setCategory(rs.getString("category"));
                plant.setPrice(rs.getDouble("price"));
                plant.setDescription(rs.getString("description"));
                plant.setImage(rs.getString("image"));
                list.add(plant);
            }
        }

        return list;
    }


    
    public boolean addPlant(Plant plant) {
        boolean f = false;
        try {
            Connection con = jdbcUtilClass.openconnection();
            String sql = "INSERT INTO plants(name, category, description, price, image) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, plant.getName());
            ps.setString(2, plant.getCategory());
            ps.setString(3, plant.getDescription());
            ps.setDouble(4, plant.getPrice());
            ps.setString(5, plant.getImage());

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }


    public static void deletePlant(int id) throws SQLException {
        try (Connection conn = jdbcUtilClass.openconnection()) {
            String sql = "DELETE FROM plants WHERE plant_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    
    
    
    public static void updatePlant(Plant plant) throws SQLException {
        try (Connection conn = jdbcUtilClass.openconnection()) {
            String sql = "UPDATE plants SET name=?, category=?, price=?, description=?, image=? WHERE plant_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, plant.getName());
            ps.setString(2, plant.getCategory());
            ps.setDouble(3, plant.getPrice());
            ps.setString(4, plant.getDescription());
            ps.setString(5, plant.getImage());
            ps.setInt(6, plant.getId());
            ps.executeUpdate();
        }
    }

    
}
