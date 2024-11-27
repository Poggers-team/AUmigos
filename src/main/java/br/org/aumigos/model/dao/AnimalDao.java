package br.org.aumigos.model.dao;

import br.org.aumigos.model.Animal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AnimalDao {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/aumigos";
    private static final String DB_USER = "joana";
    private static final String DB_PASSWORD = "root";

    public void save(Animal animal) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        String sql = "INSERT INTO pets (especie, genero, raca, cor, idade, porte, nome_pet, historia_pet, cidade, endereco, nome_contato, email_contato, telefone_contato, cuidados, temperamento, socializacao, foto, dias_atras) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, animal.getEspecie());
        stmt.setString(2, animal.getGenero());
        stmt.setString(3, animal.getRaca());
        stmt.setString(4, animal.getCor());
        stmt.setString(5, animal.getIdade());
        stmt.setString(6, animal.getPorte());
        stmt.setString(7, animal.getNomePet());
        stmt.setString(8, animal.getHistoriaPet());
        stmt.setString(9, animal.getCidade());
        stmt.setString(10, animal.getEndereco());
        stmt.setString(11, animal.getNomeContato());
        stmt.setString(12, animal.getEmailContato());
        stmt.setString(13, animal.getTelefoneContato());
        stmt.setString(14, animal.getCuidados());
        stmt.setString(15, animal.getTemperamento());
        stmt.setString(16, animal.getSocializacao());

        if (animal.getFoto() != null) {
            stmt.setBytes(17, animal.getFoto());
        } else {
            stmt.setNull(17, java.sql.Types.BLOB);
        }

        LocalDate currentDate = LocalDate.now();
        stmt.setDate(18, Date.valueOf(currentDate));

        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }


    public List<Animal> getAllAnimals() throws SQLException {
        List<Animal> animals = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM pets");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String nome = rs.getString("nome_pet");
                String cidade = rs.getString("cidade");
                byte[] fotoBytes = rs.getBytes("foto");
                LocalDate dataCriacao = rs.getDate("dias_atras") != null ? rs.getDate("dias_atras").toLocalDate() : null;

                animals.add(new Animal(nome, cidade, fotoBytes, dataCriacao));
            }
        }
        return animals;
    }

}
