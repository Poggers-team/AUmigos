package br.org.aumigos.model.dao;

import br.org.aumigos.model.voluntary.Voluntary;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VoluntaryDao {

    private DataSource dataSource;

    public VoluntaryDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(Voluntary voluntary){
//        String sql = "insert into Voluntary (name, email, phone, availability, skills) values (?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
            CallableStatement cs = conn.prepareCall("{call voluntary_admin.save_voluntary(?,?,?,?,?)}")){
            populatePreparedStatementForVoluntary(voluntary, cs);
            cs.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    private void populatePreparedStatementForVoluntary(Voluntary voluntary, PreparedStatement cs) throws SQLException {
        cs.setString(1, voluntary.getName());
        cs.setString(2,voluntary.getEmail());
        cs.setString(3, voluntary.getPhone());
        cs.setString(4, voluntary.getAvailability().toString());
        cs.setString(5, voluntary.getSkills());
    }
}
