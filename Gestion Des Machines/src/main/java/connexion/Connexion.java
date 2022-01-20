package connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    private static String login = "eewhkg7io4zpiw49";
    private static String password = "vgaala3c1eexmamx";
    private static String url = "jdbc:mysql://eewhkg7io4zpiw49:vgaala3c1eexmamx@kutnpvrhom7lki7u.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/e07gsp9va0942nie";
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
