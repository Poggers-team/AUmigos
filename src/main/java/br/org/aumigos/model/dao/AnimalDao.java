package br.org.aumigos.model.dao;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Size;
import br.org.aumigos.model.animal.Type;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnimalDao {
    private final DataSource dataSource;

    public AnimalDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(Animal animal) {
        String sql = "INSERT INTO Animal (name, breed, type, gender, size, age, weight, castrated, adopted, " +
                "vacinated, dewormed, temperament, socialization, address, city, contactName, " +
                "contactEmail, contactPhone, image, fileName, color, story, announcementDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            setString(animal, ps);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public Boolean update(Animal animal) {
        String sql = "UPDATE Animal SET name = ?, breed = ?, type = ?, gender = ?, size = ?, age = ?, weight = ?, " +
                "castrated = ?, adopted = ?, vacinated = ?, dewormed = ?, temperament = ?, socialization = ?, " +
                "address = ?, city = ?, contactName = ?, contactEmail = ?, contactPhone = ?, image = ?, " +
                "fileName = ?, color = ?, story = ?, announcementDate = ? WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            setString(animal, ps);
            ps.setLong(24, animal.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public boolean delete(Animal animal) {
        String sql = "delete from animal where id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, animal.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public Animal getAnimalById(Long id) {
        String sql = "select * from animal where id = ?";
        Animal a = null;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
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
        if (adopted == 1) adoptedBool = true;
        else adoptedBool = false;

        String sql = "select * from animal where adopted = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBoolean(1, adoptedBool);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Animal a = new Animal();
                    setAnimal(rs, a);
                    animals.add(a);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
        return animals;
    }

    public List<Animal> getAllAnimals() {
        List<Animal> animals = new ArrayList<>();

        String sql = "select * from animal";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Animal a = new Animal();
                    setAnimal(rs, a);
                    animals.add(a);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
        return animals;
    }

    private void setAnimal(ResultSet rs, Animal a) throws SQLException {
        a.setId(rs.getLong("id"));
        a.setName(rs.getString("name"));
        a.setBreed(rs.getString("breed"));
        a.setType(Type.valueOf(rs.getString("type")));
        a.setGender(Gender.valueOf(rs.getString("gender")));
        a.setSize(Size.valueOf(rs.getString("size")));
        a.setAge(rs.getInt("age"));
        a.setWeight(rs.getDouble("weight"));
        a.setCastrated(rs.getBoolean("castrated"));
        a.setAdopted(rs.getBoolean("adopted"));
        a.setVacinated(rs.getBoolean("vacinated"));
        a.setDewormed(rs.getBoolean("dewormed"));
        a.setTemperament(rs.getString("temperament"));
        a.setSocialization(rs.getString("socialization"));
        a.setAddress(rs.getString("address"));
        a.setCity(rs.getString("city"));
        a.setContactName(rs.getString("contactName"));
        a.setContactEmail(rs.getString("contactEmail"));
        a.setContactPhone(rs.getString("contactPhone"));
        a.setImage(rs.getString("image"));
        a.setFileName(rs.getString("fileName"));
        a.setColor(rs.getString("color"));
        a.setStory(rs.getString("story"));
        a.setAnnouncementDate(rs.getDate("announcementDate").toLocalDate());
    }

    private void setString(Animal animal, PreparedStatement ps) throws SQLException {
        ps.setString(1, animal.getName());
        ps.setString(2, animal.getBreed());
        ps.setString(3, animal.getType().toString());
        ps.setString(4, animal.getGender().toString());
        ps.setString(5, animal.getSize().toString());
        ps.setInt(6, animal.getAge());
        ps.setDouble(7, animal.getWeight());
        ps.setBoolean(8, animal.isCastrated());
        ps.setBoolean(9, animal.isAdopted());
        ps.setBoolean(10, animal.isVacinated());
        ps.setBoolean(11, animal.isDewormed());
        ps.setString(12, animal.getTemperament());
        ps.setString(13, animal.getSocialization());
        ps.setString(14, animal.getAddress());
        ps.setString(15, animal.getCity());
        ps.setString(16, animal.getContactName());
        ps.setString(17, animal.getContactEmail());
        ps.setString(18, animal.getContactPhone());
        ps.setString(19, animal.getImage());
        ps.setString(20, animal.getFileName());
        ps.setString(21, animal.getColor());
        ps.setString(22, animal.getStory());
        ps.setDate(23, Date.valueOf(animal.getAnnouncementDate()));
    }
}
