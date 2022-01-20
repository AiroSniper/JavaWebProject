package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.Salle;
import connexion.Connexion;
import dao.IDao;

public class SalleService implements IDao<Salle>{

	@Override
	public boolean create(Salle o) {
		 String sql = "INSERT INTO `salle`(`id`, `code`, `label`, `type`) VALUES (null,?,?,?)";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getCode());
	            ps.setString(2, o.getLabel());
	            ps.setString(3, o.getType());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("create : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public boolean delete(Salle o) {
		 String sql = "DELETE FROM `salle` WHERE id = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public boolean update(Salle o) {
		 String sql = "UPDATE `salle` SET `code`=?,`label`=?,`type`=? WHERE `id`=?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getCode());
	            ps.setString(2, o.getLabel());
	            ps.setString(3, o.getType());
	            ps.setInt(4, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("update : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public Salle findById(int id) {
	        String sql = "SELECT * FROM `salle` WHERE `id`= ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("label"),
	                        rs.getString("type"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	}

	@Override
	public List<Salle> findAll() {
		List<Salle> salles = new ArrayList<Salle>();

        String sql = "SELECT * FROM `salle` order by id desc";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	salles.add(new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("label"),
                        rs.getString("type")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return salles;
	}
	  public int count() {
		     int count = 0;

		        String sql = "SELECT count(*) as count FROM `salle`";
		        try {
		            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
		            ResultSet rs = ps.executeQuery();
		            while (rs.next()) {
		            	 count = rs.getInt("count");
		            }

		        } catch (SQLException e) {
		            System.out.println("findAll " + e.getMessage());
		        }
		        return count;
		    }
	public List<Salle> findAll(String query) {
		List<Salle> salles = new ArrayList<Salle>();

        String sql = "SELECT * FROM `salle` where id=? or code=? or label=? or type=? order by id desc";
       
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, query);
            ps.setString(2, query);
            ps.setString(3, query);
            ps.setString(4, query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	salles.add(new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("label"),
                        rs.getString("type")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return salles;
	}

}
