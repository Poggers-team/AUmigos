package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.user.Gender;
import br.org.aumigos.model.user.User;
import br.org.aumigos.model.dao.UserDao;
import br.org.aumigos.utils.DataSourceSearcher;
import br.org.aumigos.utils.PasswordEncoder;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;

public class UserRegisterHelper implements Helper {
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // obter dados
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");

        // instanciar um objeto User
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(PasswordEncoder.encode(password));
        user.setDateOfBirth(LocalDate.parse(dateOfBirth));
        user.setGender(Gender.valueOf(gender));

        UserDao userDao = new UserDao(DataSourceSearcher.getInstance().getDataSource());

        // salvar o novo usuário
        if(userDao.save(user)) {
            request.setAttribute("result", "registered");
            return "/login.jsp";
        }else {
            request.setAttribute("result", "notRegistered");
            return "user-register.jsp";
        }
    }
}
