/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class account {
    String name, email,gender, phoneNumber, cardNumber, role, accessRight,password,avatar;

    public account() {
    }

    public account(String name, String email,String gender, String phoneNumber, String cardNumber, String role, String accessRight, String password, String avatar) {
        this.name=name;
        this.email = email;
        this.gender=gender;
        this.phoneNumber = phoneNumber;
        this.cardNumber = cardNumber;
        this.role = role;
        this.accessRight = accessRight;
        this.password=password;
        this.avatar=avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAccessRight() {
        return accessRight;
    }

    public void setAccessRight(String accessRight) {
        this.accessRight = accessRight;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "account{" + "name=" + name + ", email=" + email + ", gender=" + gender + ", phoneNumber=" + phoneNumber + ", cardNumber=" + cardNumber + ", role=" + role + ", accessRight=" + accessRight + ", password=" + password + ", avatar=" + avatar + '}';
    }

   
    
    
}
