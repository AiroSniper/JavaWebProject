package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.MachinesByMarkes;
import beans.MachinesBySalle;
import beans.MachinesParType;
import connexion.Connexion;
import dao.IDao;

public class MachineService implements IDao<Machine> {

	SalleService ss = new SalleService();
    @Override
    public boolean create(Machine o) {
        String sql = "INSERT INTO `machine`(`id`, `salle_id`, `reference`, `marque`, `dateAchat`, `prix`) VALUES (null,?,?,?,?,?)";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, o.getSalle().getId());
            ps.setString(2, o.getReference());
            ps.setString(3, o.getMarque());
            ps.setDate(4, new Date(o.getDateAchat().getTime()));
            ps.setDouble(5, o.getPrix());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("create : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public boolean delete(Machine o) {
        String sql = "delete from machine where id  = ?";
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
    public boolean update(Machine o) {

        String sql = "UPDATE `machine` SET `salle_id`=?,`reference`=?,`marque`=?,`dateAchat`=?,`prix`=? WHERE `id`=?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, o.getSalle().getId());
            ps.setString(2, o.getReference());
            ps.setString(3, o.getMarque());
            ps.setDate(4, new Date(o.getDateAchat().getTime()));
            ps.setDouble(5, o.getPrix());
            ps.setInt(6, o.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public Machine findById(int id) {
        Machine m = null;
        String sql = "SELECT * FROM `machine` WHERE `id`= ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Machine(rs.getInt("id"),ss.findById(rs.getInt("salle_id")), rs.getString("reference"),rs.getString("marque"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Machine> findAll() {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "SELECT * FROM `machine` order by id desc";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"),ss.findById(rs.getInt("salle_id")), rs.getString("reference"),rs.getString("marque"), rs.getDate("dateAchat"),
                        rs.getDouble("prix")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    
    public int count() {
     int count = 0;

        String sql = "SELECT count(*) as count FROM `machine`";
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
    
    public List<Machine> findAll(String query) {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "SELECT * FROM `machine` where id = ? or reference = ? or marque = ? or prix = ? or dateAchat = ? order by id desc";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, query);
            ps.setString(2, query);
            ps.setString(3, query);
            ps.setString(4, query);
            ps.setString(5, query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"),ss.findById(rs.getInt("salle_id")), rs.getString("reference"),rs.getString("marque"), rs.getDate("dateAchat"),
                        rs.getDouble("prix")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<Machine> findAll(java.util.Date debut, java.util.Date fin) {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "SELECT * FROM `machine` where dateAchat between ? and ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setDate(1, new Date(debut.getTime()));
            ps.setDate(2, new Date(fin.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"),ss.findById(rs.getInt("salle_id")), rs.getString("reference"),rs.getString("marque"), rs.getDate("dateAchat"),
                        rs.getDouble("prix")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<Machine> findAll(int salle_id) {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "SELECT * FROM `machine` where salle_id = ? order by id desc";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, salle_id);
          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"),ss.findById(rs.getInt("salle_id")), rs.getString("reference"),rs.getString("marque"), rs.getDate("dateAchat"),
                        rs.getDouble("prix")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<MachinesBySalle> machinesBySalle() {
        List<MachinesBySalle> machines = new ArrayList<MachinesBySalle>();

        String sql = "SELECT count(m.id) as N , s.id FROM `machine`m inner join `salle` s on s.id = m.salle_id group by s.id";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
           
          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new MachinesBySalle(rs.getInt("N"), ss.findById(rs.getInt("id"))) );
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<MachinesByMarkes> machinesByMarke() {
        List<MachinesByMarkes> machines = new ArrayList<MachinesByMarkes>();

        String sql = "SELECT marque, count(*) as N FROM `machine` GROUP BY marque";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
           
          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new MachinesByMarkes(rs.getInt("N"), rs.getString("marque")) );
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    
    public List<MachinesParType> machinesByType() {
        List<MachinesParType> machines = new ArrayList<MachinesParType>();

        String sql = "SELECT s.type, count(m.id) as N FROM `machine`m inner join `salle` s on s.id = m.salle_id group by s.type";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
           
          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new MachinesParType(rs.getInt("N"), rs.getString("type")) );
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<Machine> findMachineByReference(String ref) {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "SELECT * FROM `machine` WHERE `reference` = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ps.setString(1, ref);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"),ss.findById(rs.getInt("salle_id")), rs.getString("reference"),rs.getString("marque"), rs.getDate("dateAchat"),
                        rs.getDouble("prix")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<String> findReference() {
        List<String> references = new ArrayList<String>();
        String sql = "select distinct(reference) as ref from machine";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                references.add(rs.getString("ref"));
            }
        } catch (SQLException e) {
            System.out.println("findReference " + e.getMessage());
        }
        return references;
    }

}
