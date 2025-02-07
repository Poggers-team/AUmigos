package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

public class HomeHelper implements Helper {
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        List<Animal> animals = animalDao.getAnimalsByAdoptedStatus(false);
        request.setAttribute("animals", animals);

        return "/home.jsp";
    }
}
