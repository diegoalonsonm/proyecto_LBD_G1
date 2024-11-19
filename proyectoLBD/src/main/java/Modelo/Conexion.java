package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection con;
    String url = "jdbc:oracle:thin:@localhost:1521:system";
    String user = "system";
    String pass = "system";

    public Connection conectar() {
        try {
            Class.forName("oracle.jbdc.driver.OracleDriver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return con;
    }
    
}
