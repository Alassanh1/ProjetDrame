package dao;

import model.Etudiant;

import java.sql.*;
import java.util.*;

public class EtudiantDAO {

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/inscription_db", "root", ""); // modifie le mot de passe si nécessaire
    }

    // Ajouter un étudiant et retourner son ID
    public int ajouterEtudiantEtRetourId(Etudiant e) {
        int idEtudiant = -1;
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO etudiant (nom, prenom, naissance, sexe, adresse, email, filiere, niveau) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, e.getNom());
            ps.setString(2, e.getPrenom());
            ps.setDate(3, Date.valueOf(e.getDateNaissance()));
            ps.setString(4, e.getSexe());
            ps.setString(5, e.getAdresse());
            ps.setString(6, e.getEmail());
            ps.setString(7, e.getFiliere());
            ps.setString(8, e.getNiveau());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idEtudiant = rs.getInt(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return idEtudiant;
    }

    // Associer une UE à un étudiant
    public void ajouterUEEtudiant(int idEtudiant, int idUE) {
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO etudiant_ue (id_etudiant, id_ue) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idEtudiant);
            ps.setInt(2, idUE);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // Liste tous les étudiants
    public List<Etudiant> listerTous() {
        List<Etudiant> liste = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM etudiant";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Etudiant e = new Etudiant();
                e.setId(rs.getInt("id"));
                e.setNom(rs.getString("nom"));
                e.setPrenom(rs.getString("prenom"));
                e.setDateNaissance(rs.getDate("naissance").toString());
                e.setSexe(rs.getString("sexe"));
                e.setAdresse(rs.getString("adresse"));
                e.setEmail(rs.getString("email"));
                e.setFiliere(rs.getString("filiere"));
                e.setNiveau(rs.getString("niveau"));
                liste.add(e);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return liste;
    }
}
