package entity;

import java.util.List;

public class OrderItem {
    private int id;         // item id
    private int orderId;
    private int plantId;
    private String plantName;
    private int quantity;
    private double price;
    private Plant plant; 
    public int getItemId() {
		return ItemId;
	}
	public void setItemId(int itemId) {
		ItemId = itemId;
	}
	private int ItemId;
    private List<OrderItem> items; 

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getPlantId() { return plantId; }
    public void setPlantId(int plantId) { this.plantId = plantId; }

    public String getPlantName() { return plantName; }
    public void setPlantName(String plantName) { this.plantName = plantName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public Plant getPlant() { return plant; }
    public void setPlant(Plant plant) { this.plant = plant; }
    
    public List<OrderItem> getItems() { return items; }
    public void setItems(List<OrderItem> items) { this.items = items; }
}
