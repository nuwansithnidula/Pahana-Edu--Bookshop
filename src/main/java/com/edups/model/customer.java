package com.edups.model;

public class customer {
	private String accountNumber;
    private String name;
    private String address;
    private String phone;
    private String email;

    public customer() {}

    public customer(String accountNumber, String name, String address, String phone, String email) {
        this.accountNumber = accountNumber;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public String getAccountNumber() { return accountNumber; }
    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getPhone() { return phone; }
    public String getEmail() { return email; }

    public void setAccountNumber(String accountNumber) { this.accountNumber = accountNumber; }
    public void setName(String name) { this.name = name; }
    public void setAddress(String address) { this.address = address; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setEmail(String email) { this.email = email; }

}
