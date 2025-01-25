package br.org.aumigos.model.dao;

import br.org.aumigos.model.adoption.Adoption;
import br.org.aumigos.utils.DataSourceSearcher;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdoptionDao {

    private final DataSource dataSource;

    public AdoptionDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public boolean save(Adoption adoption) throws SQLException {
//        String adoptionSql = "insert into Adoption (adopterName, adopterAge, adopterEmail, adopterZipcode, adopterAddress, adopterPhone, adopterTypeOfResidence, adopterHouseHasAutomaticGate, " +
//                "adopterHouseHasPool, adopterHouseHasNetOnWindows, adopterComments, adopterQtyAnimals, adopterExperiences, animalPlace, adopterIsResponsible, " +
//                "adopterIsAwareOfTheCosts, peopleLivingInAdopterHouse, peopleIsAwareOfAdoption, hasChildrenAtHouse, animalAloneTime, adoptionDate, animalId) " +
//                "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = dataSource.getConnection();
            CallableStatement cs = conn.prepareCall("{call adoption_admin.save_adoption(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            populateCallableStatementForAdoption(adoption, cs);
            conn.setAutoCommit(false);

            cs.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            if(conn != null) conn.rollback();
            throw new RuntimeException("Error ao salvar dados", e);
        } finally {
            conn.setAutoCommit(true);
            AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
            animalDao.setAnimalAsAdopted(adoption.getAnimal().getId());
        }

        return true;
    }

    private void populateCallableStatementForAdoption(Adoption a, PreparedStatement ps) throws SQLException {
        ps.setString(1, a.getName());
        ps.setInt(2, a.getAge());
        ps.setString(3, a.getEmail());
        ps.setString(4, a.getZipCode());
        ps.setString(5, a.getAddress());
        ps.setString(6, a.getPhone());
        ps.setString(7, a.getResidenceType().toString());
        ps.setBoolean(8, a.isAutomaticGate());
        ps.setBoolean(9, a.isPool());
        ps.setBoolean(10, a.isNetOnWindows());
        ps.setString(11, a.getComments());
        ps.setInt(12, a.getQtyAnimals());
        ps.setString(13, a.getExperiences());
        ps.setString(14, a.getAnimalPlace());
        ps.setBoolean(15, a.isResponsible());
        ps.setBoolean(16, a.isAwareOfCosts());
        ps.setInt(17, a.getPeopleLivingInHouse());
        ps.setBoolean(18, a.isPeopleAwareOfAdoption());
        ps.setBoolean(19, a.isChildrenAtHouse());
        ps.setString(20, a.getAnimalAloneTime());
        ps.setDate(21, Date.valueOf(a.getAdoptionDate()));
        ps.setLong(22, a.getAnimal().getId());
    }
}
