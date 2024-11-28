package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class HomeHelper implements Helper {
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        List<Animal> animals = animalDao.getAllAnimals();

        for(Animal animal : animals) {
            animal.setDaysAgo(Period.between(animal.getAnnouncementDate(), LocalDate.now()).getDays());
        }

        request.setAttribute("animals", animals);

        return "/home.jsp";
    }
}
