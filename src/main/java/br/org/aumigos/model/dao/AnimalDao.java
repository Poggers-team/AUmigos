package br.org.aumigos.model.dao;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Type;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnimalDao {
    private DataSource dataSource;

    public AnimalDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(Animal animal){
        String sql = "insert into animal (name, type, breed, "
                + "gender, size, age, weight, castrated, adopted, image, fileName) values (?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            setString(animal, ps);
            ps.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public Boolean update(Animal animal){
        String sql = "update animal set name = ?, type = ?, breed = ?, gender = ?, "
                    + "size = ?, age = ?, weight = ?, castrated = ?, adopted = ?, image = ?, fileName = ? where id = ?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            setString(animal, ps);
            ps.setLong(12, animal.getId());
        } catch(SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public boolean delete(Animal animal){
        String sql = "delete from animal where id = ?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, animal.getId());
        } catch(SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public Animal getAnimalById(Long id){
        String sql = "select * from Animal where id = ?";
        Animal a = null;
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, id);
            try(ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    a = new Animal();
                    setAnimal(rs, a);
                }
                return a;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
    }

    public List<Animal> getAnimalsByAdoptedStatus(int adopted) {
        List<Animal> animals = new ArrayList<>();
        boolean adoptedBool;

        if(adopted == 1) adoptedBool = true;
        else adoptedBool = false;

        String sql = "select * from Animal where adopted = ?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBoolean(1, adoptedBool);
            try(ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    Animal a = new Animal();
                    setAnimal(rs, a);
                    animals.add(a);
                }
            }
        } catch(SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
        return animals;

    }

    private void setAnimal(ResultSet rs, Animal a) throws SQLException {
        a.setId(rs.getLong("id"));
        a.setName(rs.getString("name"));
        a.setType(Type.valueOf(rs.getString("type")));
        a.setBreed(rs.getString("breed"));
        a.setGender(Gender.valueOf(rs.getString("gender")));
        a.setAge(rs.getInt("age"));
        a.setWeight(rs.getDouble("weight"));
        a.setCastrated(rs.getBoolean("castrated"));
        a.setAdopted(rs.getBoolean("adopted"));
        a.setImage(rs.getString("image"));
        a.setFileName(rs.getString("fileName"));
    }

    private void setString(Animal animal, PreparedStatement ps) throws SQLException {
        ps.setString(1, animal.getName());
        ps.setString(2,animal.getType().toString());
        ps.setString(3, animal.getBreed());
        ps.setString(4, animal.getGender().toString());
        ps.setString(5, animal.getSize().toString());
        ps.setInt(6, animal.getAge());
        ps.setDouble(7, animal.getWeight());
        ps.setBoolean(8, animal.isCastrated());
        ps.setBoolean(9, animal.isAdopted());
        ps.setString(10, animal.getImage());
        ps.setString(11, animal.getFileName());
    }
}
