package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetAnimalToAdoptHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Long id = Long.parseLong(request.getParameter("id"));

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal = animalDao.getAnimalById(id);

        request.setAttribute("animal", animal);

        return "/adoptionPet.jsp";
    }
}
