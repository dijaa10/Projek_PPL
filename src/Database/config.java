/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chodi
 */
public class config {
    public static Connection mysqlconfig;
    public  static Connection getConnection()throws SQLException{
        try {
            String url = "jdbc:mysql://localhost:3306/filosofi";
            String user = "root";
            String pass = "";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            mysqlconfig = DriverManager.getConnection(url, user, pass);
        }catch(Exception e){
            System.err.println("Koneksi Gagal "+e.getMessage());
        }
        return mysqlconfig;
    }
}
