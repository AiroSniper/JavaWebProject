package connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    private static String login = "ze47ban7kxldeew3";
    private static String password = "xli1ffqxeu8brl4q";
    private static String url = "jdbc:mysql://ze47ban7kxldeew3:xli1ffqxeu8brl4q@i0rgccmrx3at3wv3.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/c0op1zpm74u2zga5";
    private Connection connection = null;
    private static Connexion instane;

    private Connexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, login, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver introvable");
        } catch (SQLException e) {
            System.out.println("Connexion errror");
            System.out.println(e.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static Connexion getInstane() {
        if (instane == null) {
            instane = new Connexion();
        }
        return instane;
    }

}
