package br.org.aumigos.model.dao;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Type;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AnimalDao {
    private DataSource dataSource;

    public AnimalDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(Animal animal){
        String sql = "insert into animal (name, type, breed, "
                + "gender, size, age, castrated) values (?,?,?,?,?,?, ?)";
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
                + "size = ?, age = ?, castrated = ? where id = ?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            setString(animal, ps);
            ps.setLong(8, animal.getId());
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
        String sql = "select * from Animal where id=?";
        Animal a = null;
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, id);
            try(ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    a = new Animal();
                    a.setId(rs.getLong("id"));
                    a.setName(rs.getString("name"));
                    a.setType(Type.valueOf(rs.getString("type")));
                    a.setBreed(rs.getString("breed"));
                    a.setGender(Gender.valueOf(rs.getString("gender")));
                    a.setAge(rs.getInt("age"));
                    a.setCastrated(rs.getBoolean("castrated"));
                }
                return a;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
    }

    private void setString(Animal animal, PreparedStatement ps) throws SQLException {
        ps.setString(1, animal.getName());
        ps.setString(2,animal.getType().toString());
        ps.setString(3, animal.getBreed());
        ps.setString(4, animal.getGender().toString());
        ps.setString(5, animal.getSize().toString());
        ps.setInt(6, animal.getAge());
        ps.setBoolean(7, animal.isCastrated());
    }
}
