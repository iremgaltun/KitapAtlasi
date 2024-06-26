package com.kitap.kitapatlasi.entity;

public class Order {
    private int OrderID;
    private int UserID;
    private String OrderDate;
    private String ShippingDate;
    private String DeliveryDate;
    private String Payment;

    public Order(){

    }

    public Order(int orderID ,int UserID ,String OrderDate, String ShippingDate, String DeliveryDate , String Payment){
       this.OrderID = orderID;
        this.UserID= UserID;
        this.OrderDate = OrderDate;
        this.ShippingDate = ShippingDate;
        this.DeliveryDate = DeliveryDate;
        this.Payment = Payment;
    }
    public int getOrderID() {
        return OrderID;
    }
    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }
    public int getUserID() {
        return UserID;

    }
    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
    public String getOrderDate() {
        return OrderDate;
    }
    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }
    public String getShippingDate() {
        return ShippingDate;
    }
    public void setShippingDate(String ShippingDate) {
        this.ShippingDate = ShippingDate;
    }
    public String getDeliveryDate() {
        return DeliveryDate;
    }
    public void setDeliveryDate(String DeliveryDate) {
        this.DeliveryDate = DeliveryDate;
    }
    public String getPayment() {
        return Payment;
    }
    public void setPayment(String Payment) {
        this.Payment = Payment;
    }

}
