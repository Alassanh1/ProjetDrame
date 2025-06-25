package dao;

import model.UE;

import java.sql.*;
import java.util.*;

public class UEDAO {

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/inscription_db", "root", "");
    }

    // Récupérer une UE par code
    public UE getUEByCode(String code) {
        UE ue = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM ue WHERE code = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ue = new UE();
                ue.setId(rs.getInt("id"));
                ue.setCode(rs.getString("code"));
                ue.setNom(rs.getString("nom"));
                ue.setObligatoire(rs.getBoolean("obligatoire"));
                ue.setEnseignantResponsable(rs.getString("enseignantResponsable"));
                ue.setIdFormation(rs.getInt("id_formation"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ue;
    }

    // Récupérer toutes les UEs optionnelles
    public List<UE> getUEsOptionnelles() {
        List<UE> liste = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM ue WHERE obligatoire = false";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UE ue = new UE();
                ue.setId(rs.getInt("id"));
                ue.setCode(rs.getString("code"));
                ue.setNom(rs.getString("nom"));
                ue.setObligatoire(false);
                ue.setEnseignantResponsable(rs.getString("enseignantResponsable"));
                ue.setIdFormation(rs.getInt("id_formation"));
                liste.add(ue);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return liste;
    }
}
