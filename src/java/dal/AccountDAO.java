/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {
    public account getAccountByEmail(String email) {
        account a = new account();
        String sql = "Select * from Users\n"
                + "Where Email=?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String fname = rs.getNString("FirstName");
                String lname = rs.getNString("LastName");
                String name=fname+" "+lname;
                String gender=rs.getString("Gender");
                String phone = rs.getString("PhoneNumber");
                String card = rs.getString("Card_Number");
                String role = rs.getString("Role");
                String right=rs.getString("Access_Right");
                String password=rs.getString("Password");
                String avatar=rs.getString("Avatar");
                a=new account(name, email,gender, phone, card, role, right,password,avatar);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return a;
    }

    public account addAccount(String firstname, String lastname, String email, String password) {
        String sql = "INSERT INTO Users (FirstName, LastName, Email,Gender, PhoneNumber, Card_Number, Role, Access_Right,Password,Avatar) \n"
                + "VALUES (?, ?, ?,null,null,null,'User','Normal',?,'./assets/img/avatar.png');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setString(3, email);
            st.setString(4, password);
            account a=new account(firstname+" "+lastname, email,null,null,null, "User","Normal",password,"./assets/img/avatar.png");
            st.executeUpdate();
            return a;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAccountByEmail("havu@gmal.com"));
    }
}
