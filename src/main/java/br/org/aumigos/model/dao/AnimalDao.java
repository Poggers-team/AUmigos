package br.org.aumigos.model.dao;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Size;
import br.org.aumigos.model.animal.Type;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class AnimalDao {
    private final DataSource dataSource;

    public AnimalDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public boolean save(Animal animal) {
//        String sql = "insert into Animal (name, breed, type, gender, size, age, castrated, adopted, " +
//                "vaccinated, dewormed, temperament, socialization, address, city, contactName, " +
//                "contactEmail, contactPhone, image, fileName, color, story, announcementDate) " +
//                "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call animal_admin.save_animal(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}")) {
            populatePreparedStatementForAnimal(animal, cs);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public boolean setAnimalAsAdopted(Long animalId) {
//        String sql = "update Animal set adopted = ? where id = ?";
        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call animal_admin.set_animal_as_adopted(?)}")) {
            cs.setLong(1, animalId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public boolean delete(Animal animal) {
//        String sql = "delete from Animal where id = ?";
        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call animal_admin.delete_animal(?)}")) {
            cs.setLong(1, animal.getId());
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public Animal getAnimalById(Long id) {
//        String sql = "select * from Animal where id = ?";
        Animal animal = null;
        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call animal_admin.get_animal_by_id(?,?)}")) {
            cs.setLong(1, id);
            cs.registerOutParameter(2, Types.REF_CURSOR);
            cs.execute();
            try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                if (rs.next()) {
                    animal = new Animal();
                    mapAnimalFromResultSet(rs, animal);
                }
                return animal;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
    }

    public List<Animal> getAnimalsByAdoptedStatus(boolean adopted) {
        List<Animal> animals = new ArrayList<>();

//        String sql = "select * from Animal where adopted = ?";
        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call animal_admin.get_animals_by_adopted_status(?, ?)}")) {
            cs.setInt(1, adopted ? 1 : 0);
            cs.registerOutParameter(2, Types.REF_CURSOR);
            cs.execute();
            try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                while (rs.next()) {
                    Animal a = new Animal();
                    mapAnimalFromResultSet(rs, a);
                    animals.add(a);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }

        if(adopted) {
            for (Animal animal : animals) {
                try (Connection conn = dataSource.getConnection();
                CallableStatement cs = conn.prepareCall("{ ? = call adoption_admin.get_days_between_adoption_date_and_sysdate(?)}")) {
                    cs.registerOutParameter(1, Types.INTEGER);
                    cs.setLong(2, animal.getId());
                    cs.execute();

                    animal.setAdoptionDaysAgo(cs.getInt(1));
                } catch (SQLException e) {
                    throw new RuntimeException("Erro durante a consulta", e);
                }
            }
        } else {
            for(Animal animal : animals) {
                animal.setDaysAgo(Period.between(animal.getAnnouncementDate(), LocalDate.now()).getDays());
            }
        }
        return animals;
    }

    public List<Animal> getAllAnimals() {
        List<Animal> animals = new ArrayList<>();

        String sql = "select * from Animal";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Animal a = new Animal();
                    mapAnimalFromResultSet(rs, a);
                    animals.add(a);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta", e);
        }
        return animals;
    }

    private void mapAnimalFromResultSet(ResultSet rs, Animal a) throws SQLException {
        a.setId(rs.getLong("animal_id"));
        a.setName(rs.getString("animal_name"));
        a.setType(Type.valueOf(rs.getString("animal_type")));
        a.setBreed(rs.getString("breed"));
        a.setGender(Gender.valueOf(rs.getString("gender")));
        a.setSize(Size.valueOf(rs.getString("animal_size")));
        a.setAge(rs.getInt("age"));
        a.setCastrated(rs.getBoolean("castrated"));
        a.setAdopted(rs.getBoolean("adopted"));
        a.setVaccinated(rs.getBoolean("vaccinated"));
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

    private void populatePreparedStatementForAnimal(Animal animal, PreparedStatement cs) throws SQLException {
        cs.setString(1, animal.getName());
        cs.setString(2, animal.getType().toString());
        cs.setString(3, animal.getBreed());
        cs.setString(4, animal.getGender().toString());
        cs.setString(5, animal.getSize().toString());
        cs.setInt(6, animal.getAge());
        cs.setBoolean(7, animal.isCastrated());
        cs.setBoolean(8, animal.isAdopted());
        cs.setBoolean(9, animal.isVaccinated());
        cs.setBoolean(10, animal.isDewormed());
        cs.setString(11, animal.getTemperament());
        cs.setString(12, animal.getSocialization());
        cs.setString(13, animal.getAddress());
        cs.setString(14, animal.getCity());
        cs.setString(15, animal.getContactName());
        cs.setString(16, animal.getContactEmail());
        cs.setString(17, animal.getContactPhone());
        cs.setString(18, animal.getImage());
        cs.setString(19, animal.getFileName());
        cs.setString(20, animal.getColor());
        cs.setString(21, animal.getStory());
        cs.setDate(22, Date.valueOf(animal.getAnnouncementDate()));
    }
}
