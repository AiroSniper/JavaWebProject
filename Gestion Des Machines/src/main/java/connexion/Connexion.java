package connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    private static String login = "gu4kzpfznmjc3jfn";
    private static String password = "clg1fdu6e19rxlm6";
    private static String url = "jdbc:mysql://gu4kzpfznmjc3jfn:clg1fdu6e19rxlm6@exbodcemtop76rnz.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/dw5tds7v3j0h131j";
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
