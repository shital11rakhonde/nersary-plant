package entity;

public class CartItem {
    private Plant plant;
    private int quantity;
    private double totalPrice;

    public CartItem(Plant plant, int quantity) {
        this.plant = plant;
        this.quantity = quantity;
        this.totalPrice = plant.getPrice() * quantity;
    }

    public Plant getPlant() {
        return plant;
    }

    public void setPlant(Plant plant) {
        this.plant = plant;
        updateTotalPrice();  // Update price if plant changes
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        updateTotalPrice();
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void updateTotalPrice() {
        this.totalPrice = this.quantity * plant.getPrice();
    }
}
