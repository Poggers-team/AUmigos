package br.org.aumigos.model.dao;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.voluntary.Voluntary;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VoluntaryDao {

    private DataSource dataSource;

    public VoluntaryDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(Voluntary voluntary){
        String sql = "insert into voluntary (name, email, phone, availability, skills) values (?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            setString(voluntary, ps);
            ps.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    private void setString(Voluntary voluntary, PreparedStatement ps) throws SQLException {
        ps.setString(1, voluntary.getName());
        ps.setString(2,voluntary.getEmail());
        ps.setString(3, voluntary.getPhone());
        ps.setString(4, voluntary.getAvailability().toString());
        ps.setString(5, voluntary.getSkills());
    }
}
