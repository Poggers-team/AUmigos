package br.org.aumigos.model.dao;

import br.org.aumigos.model.user.User;
import br.org.aumigos.utils.PasswordEncoder;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class UserDao {

    private final DataSource dataSource;

    public UserDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(User user) throws SQLException {
//        Optional<User> optional = getUserByEmail(user.getEmail());
//        if(optional.isPresent()) {
//            return false;
//        }
//        String sql = "insert into app_user (name, email, password, "
//                + "dateOfBirth, gender) values (?,?,?,?,?)";

        Connection conn = null;
        try {
            conn = dataSource.getConnection();
            CallableStatement cs = conn.prepareCall("{call user_admin.save_user(?,?,?,?,?)}");
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getPassword());
            cs.setDate(4, Date.valueOf(user.getDateOfBirth()));
            cs.setString(5, user.getGender().toString());
            conn.setAutoCommit(false);

            cs.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            if(conn != null) conn.rollback();
            throw new RuntimeException(e);
        } finally {
            conn.setAutoCommit(true);
        }
        return true;
    }

    public Optional<User> getUserByEmailAndPassword(String email, String password) {
        String passwordEncripted = PasswordEncoder.encode(password);

//        String sql = "select id,name,email from User where email=? and password=?";
        Optional<User> optional = Optional.empty();
        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call user_admin.get_user_by_email_and_password(?,?,?)}")) {
            cs.setString(1, email);
            cs.setString(2, passwordEncripted);
            cs.registerOutParameter(3, java.sql.Types.REF_CURSOR);
            cs.execute();

            try (ResultSet rs = (ResultSet) cs.getObject(3)) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getLong(1));
                    user.setName(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    optional = Optional.of(user);
                }
            }

        } catch (SQLException sqlException) {
            throw new RuntimeException("Erro durante a consulta no BD", sqlException);
        }
        return optional;
    }
}