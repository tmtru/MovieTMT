/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    public account getAccountByEmail(String email) {
        account a = null;
        String sql = "Select * from Users\n"
                + "Where Email=?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String fname = rs.getNString("FirstName");
                String lname = rs.getNString("LastName");
                String name = lname + " " + fname;
                String gender = rs.getString("Gender");
                String phone = rs.getString("PhoneNumber");
                String card = rs.getString("Card_Number");
                String role = rs.getString("Role");
                String right = rs.getString("Access_Right");
                String password = rs.getString("Password");
                String avatar = rs.getString("Avatar");
                a = new account(name, email, gender, phone, card, role, right, password, avatar);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return a;
    }

    public account getAccountByID(int id) {
        account a = new account();
        String sql = "Select * from Users\n"
                + "Where UserID=?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String fname = rs.getNString("FirstName");
                String lname = rs.getNString("LastName");
                String name = lname + " " + fname;
                String email = rs.getString("Email");
                String gender = rs.getString("Gender");
                String phone = rs.getString("PhoneNumber");
                String card = rs.getString("Card_Number");
                String role = rs.getString("Role");
                String right = rs.getString("Access_Right");
                String password = rs.getString("Password");
                String avatar = rs.getString("Avatar");
                a = new account(name, email, gender, phone, card, role, right, password, avatar);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return a;
    }

    public account addAccount(String firstname, String lastname, String email, String password) {
        String sql = "INSERT INTO Users(FirstName, LastName, Email,Gender, PhoneNumber, Card_Number, Role, Access_Right,Password,Avatar) \n"
                + "VALUES (?, ?, ?,null,null,null,'User','Normal',?,'./assets/img/avatar.png');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setString(3, email);
            st.setString(4, password);
            account a = new account(lastname+" "+firstname, email, null, null, null, "User", "Normal", password, "./assets/img/avatar.png");
            System.out.println(a);
            st.executeUpdate();
            return a;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public account addManager(String firstname, String lastname, String email, String password) {
        String sql = "INSERT INTO Users(FirstName, LastName, Email,Gender, PhoneNumber, Card_Number, Role, Access_Right,Password,Avatar) \n"
                + "VALUES (?, ?, ?,null,null,null,'Admin','Full',?,'./assets/img/avatar.png');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setString(3, email);
            st.setString(4, password);
            account a = new account(firstname + " " + lastname, email, null, null, null, "Account", "Normal", password, "./assets/img/avatar.png");
            st.executeUpdate();
            return a;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<account> getAllAccounts() {
        ArrayList<account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                account account = new account();
                account.setName(rs.getString("LastName") + " " + rs.getString("FirstName"));
                account.setEmail(rs.getString("Email"));
                account.setPhoneNumber(rs.getString("PhoneNumber"));
                account.setCardNumber(rs.getString("Card_Number"));
                account.setRole(rs.getString("Role"));
                account.setAccessRight(rs.getString("Access_Right"));
                account.setPassword(rs.getString("Password"));
                account.setAvatar(rs.getString("Avatar"));
                account.setGender(rs.getString("Gender"));
                accounts.add(account);
                System.out.println(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    public int getIDbyEmail(String email) {
        int id = -1;

        String sql = "SELECT UserID FROM Users WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id = rs.getInt("UserID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return id;
    }

    public account editAccount(int userId, String firstName, String lastName, String email, String gender, String phoneNumber, String cardNumber, String role, String accessRight, String password, String avatar) {
        String sql = "UPDATE Users SET FirstName = ?, LastName = ?, Email = ?, Gender = ?, PhoneNumber = ?, Card_Number = ?, Role = ?, Access_Right = ?, Password = ?, Avatar = ? WHERE UserID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, firstName);
            st.setString(2, lastName);
            st.setString(3, email);
            st.setString(4, gender);
            st.setString(5, phoneNumber);
            st.setString(6, cardNumber);
            st.setString(7, role);
            st.setString(8, accessRight);
            st.setString(9, password);
            st.setString(10, avatar);
            st.setInt(11, userId);
            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
                // Tạo đối tượng account mới với các thông tin đã cập nhật
                account updatedAccount = new account();
                updatedAccount.setName(lastName+" "+firstName); 
                updatedAccount.setEmail(email);
                updatedAccount.setGender(gender);
                updatedAccount.setPhoneNumber(phoneNumber);
                updatedAccount.setCardNumber(cardNumber);
                updatedAccount.setRole(role);
                updatedAccount.setAccessRight(accessRight);
                updatedAccount.setPassword(password);
                updatedAccount.setAvatar(avatar);
                return updatedAccount;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.addAccount("T", "T","test@gmail.com", "12"));
    }
}
