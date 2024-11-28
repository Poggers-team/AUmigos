package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.User;
import br.org.aumigos.model.dao.UserDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.Optional;

public class LoginHelper implements Helper {
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String url;

        UserDao userDao = new UserDao(DataSourceSearcher.getInstance().getDataSource());

        Optional<User> optional = userDao.getUserByEmailAndPassword(email, password);
        if (optional.isPresent()) {
            User user = optional.get();
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(600);
            session.setAttribute("user", user);
            return "/home.jsp";
        } else {
            request.setAttribute("result", "loginError");
            return "/login.jsp";
        }
    }
}
