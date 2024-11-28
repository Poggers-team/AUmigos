package br.org.aumigos.servlets;

import br.org.aumigos.servlets.helpers.Helper;
import br.org.aumigos.servlets.helpers.HelperFactory;
import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/FrontController")
public class FrontControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FrontControllerServlet(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Helper helper = new HelperFactory().getHelper(request);

        try{
            Object resp = helper.execute(request, response);
            if(resp instanceof JsonObject){
                response.setContentType("application/json");
                response.getWriter().write(resp.toString());
            }else{
                RequestDispatcher dispatcher = request.getRequestDispatcher(response.toString());
                dispatcher.forward(request, response);
            }
        }catch(Exception error){
            throw new ServletException(error);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
