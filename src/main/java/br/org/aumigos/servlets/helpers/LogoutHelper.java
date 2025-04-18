package br.org.aumigos.servlets.helpers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutHelper implements Helper {
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);
        session.invalidate();
        return "FrontController?action=home";
    }
}
