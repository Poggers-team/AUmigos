package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

public class AnimalListHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String adoptedParam = request.getParameter("adopted");
        int adopted = (adoptedParam != null) ? Integer.parseInt(adoptedParam) : 0;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        List<Animal> animals = animalDao.getAnimalsByAdoptedStatus(adopted);

        request.setAttribute("animals", animals.isEmpty() ? null : animals);

        return (adopted == 1) ? "/adopted-animal-list.jsp" : "/adoption-animal-list.jsp";
    }
}
