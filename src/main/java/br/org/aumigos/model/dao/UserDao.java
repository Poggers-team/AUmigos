package br.org.aumigos.model.dao;

import br.org.aumigos.model.user.User;
import br.org.aumigos.utils.PasswordEncoder;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Optional;

public class UserDao {

    private DataSource dataSource;

    public UserDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Boolean save(User user){
//        Optional<User> optional = getUserByEmail(user.getEmail());
//        if(optional.isPresent()) {
//            return false;
//        }
//        String sql = "insert into app_user (name, email, password, "
//                + "dateOfBirth, gender) values (?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
            CallableStatement cs = conn.prepareCall("{call user_admin.save_user(?,?,?,?,?)}")){
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getPassword());
            cs.setDate(4, Date.valueOf(user.getDateOfBirth()));
            cs.setString(5, user.getGender().toString());
            cs.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException("Erro durante a escrita no BD", e);
        }
        return true;
    }

    public Optional<User> getUserByEmail(String email){
        String sql = "select id,name,email from User where email=?";
        Optional<User> optional = Optional.empty();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, email);
            try(ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    User user = new User();
                    user.setId(rs.getLong(1));
                    user.setName(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    optional = Optional.of(user);
                }
            }
        }catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta no BD", e);
        }
        return optional;
    }

    public Optional<User> getUserByEmailAndPassword(String email, String password) {
        String passwordEncripted = PasswordEncoder.encode(password);

        String sql = "select id,name,email from User where email=? and password=?";
        Optional<User> optional = Optional.empty();
        try (Connection conn = dataSource.getConnection();
             CallableStatement cs = conn.prepareCall("{call user_admin.get_user_by_email_and_password(?,?)}")) {
            cs.setString(1, email);
            cs.setString(2, passwordEncripted);
            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getLong(1));
                    user.setName(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    optional = Optional.of(user);
                }
            }
            return optional;
        } catch (SQLException sqlException) {
            throw new RuntimeException("Erro durante a consulta no BD", sqlException);
        }
    }

}