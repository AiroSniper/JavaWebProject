package service;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

import beans.Encryptor;
import beans.Machine;
import beans.RandomString;
import beans.Salle;
import beans.User;
import connexion.Connexion;

public class UserService {

	final String secretKey = "DJFKRJEFGKEJGGREWKGJWHGHEGJH2GREG5RER1REW3G45EWR5RGR4EW6G6G";

	public boolean generate() {

		String login = RandomString.getString(10);
		String _password = RandomString.getString(10);
		String password = null;
		password = Encryptor.encrypt(_password,secretKey);

		String sql = "INSERT INTO `user`(`ID`, `LOGIN`, `EMAIL`, `NOM`, `PRENOM`, `PASSWORD`, `STATUS`, `IMAGE`) VALUES (null,?,null,null,null,?,0,'../app-assets/images/portrait/small/avatar-s-8.jpg')";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);

			ps.setString(1, login);
			ps.setString(2, password);

			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("create : erreur sql : " + e.getMessage());

		}
		return false;
	}

	public boolean delete(User user) {
		String sql = "DELETE FROM `user` WHERE id = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("delete : erreur sql : " + e.getMessage());

		}
		return false;
	}
	
	public boolean up(User user) {
		String sql = "UPDATE `user` SET `STATUS`= 1 WHERE `ID`= ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("delete : erreur sql : " + e.getMessage());

		}
		return false;
	}
	
	public int updateInfos(User user) {
		if(findByLogin(user.getLogin()) == null) {
			String sql = "UPDATE `user` SET `LOGIN`=?,`EMAIL`=?,`NOM`=?,`PRENOM`=? WHERE `ID`=?";
			try {
				PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
				ps.setString(1, user.getLogin());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getNom());
				ps.setString(4, user.getPrenom());
				ps.setInt(5, user.getId());
				if (ps.executeUpdate() == 1) {
					return 1;
				}
			} catch (SQLException e) {
				System.out.println("update : erreur sql : " + e.getMessage());

			}
			return 0;
		}
		
		return -1;
		
	}
	public boolean updatePass(User user) {
		String sql = "UPDATE `user` SET `PASSWORD`=? WHERE `ID`=?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, Encryptor.encrypt(user.getPassword(), secretKey));
			ps.setInt(2, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	public boolean updatePassWithStatus(User user) {
		String sql = "UPDATE `user` SET `PASSWORD`= ? , `STATUS` = ? WHERE `ID`=?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, Encryptor.encrypt(user.getPassword(), secretKey));
			ps.setInt(2, user.getStatus());
			ps.setInt(3, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	public boolean updateImage(User user) {
		String sql = "UPDATE `user` SET `IMAGE`=? WHERE `ID`=?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, user.getImage());
			ps.setInt(2, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	public boolean down(User user) {
		String sql = "UPDATE `user` SET `STATUS`= -1 WHERE `ID`= ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	
	public boolean panding(User user) {
		String sql = "UPDATE `user` SET `STATUS`= 0 WHERE `ID`= ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, user.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	
	

	public User findByLogin(String login) {
		String sql = "SELECT * FROM `user` WHERE `LOGIN`= ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("ID"), rs.getString("LOGIN"), rs.getString("EMAIL"), rs.getString("NOM"),
						rs.getString("PRENOM"), Encryptor.decrypt(rs.getString("PASSWORD"),secretKey), rs.getInt("STATUS"),rs.getString("IMAGE"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}
	
	public List<User> findAll() {
		List<User> users = new ArrayList<User>();

        String sql = "SELECT * FROM `user` order by id desc";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	users.add(new User(rs.getInt("ID"), rs.getString("LOGIN"), rs.getString("EMAIL"), rs.getString("NOM"),
						rs.getString("PRENOM"), Encryptor.decrypt(rs.getString("PASSWORD"),secretKey), rs.getInt("STATUS"),rs.getString("IMAGE")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        } 
		
        return users;
	}
	
	
	public boolean login(String login, String pass) {
		
		if(findByLogin(login) != null)
		return (findByLogin(login).getPassword().equals(pass));
		
		return false;
	}

}
