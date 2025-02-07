package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteAnimalHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long animalId = Long.parseLong(request.getParameter("id"));

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal = new Animal();
        animal.setId(animalId);

        boolean deleted = animalDao.delete(animal);

        return "/FrontController?action=animalList";
    }
}
