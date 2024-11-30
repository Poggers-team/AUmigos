package br.org.aumigos.servlets;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adoptionPet")
public class AdoptionPetServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAnimalStr = request.getParameter("idPet");

        if (idAnimalStr != null) {
            try {
                Long idAnimal = Long.parseLong(idAnimalStr);  
                AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource()); 
                Animal animal = animalDao.getAnimalById(idAnimal);
                
                if (animal != null) {
                    request.setAttribute("animal", animal);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/adoptionPet.jsp");
                    dispatcher.forward(request, response);
                } 
            } catch (NumberFormatException e) {
                response.sendRedirect("");
            }
        } else {
            response.sendRedirect("");
        }
    }
}
