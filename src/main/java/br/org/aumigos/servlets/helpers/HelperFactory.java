package br.org.aumigos.servlets.helpers;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

public class HelperFactory {
    public Helper getHelper(HttpServletRequest request){
        String action = request.getParameter("action");
        ServletContext context = request.getServletContext();
        String className = context.getInitParameter(action);

        try{
            Class<?> clazz = Class.forName(className);
            Helper helper = (Helper)clazz.getDeclaredConstructor().newInstance();
            return helper;
        }catch(Exception error){
            throw new RuntimeException(error);
        }
    }
}
