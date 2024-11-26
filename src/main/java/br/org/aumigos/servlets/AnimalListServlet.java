package br.org.aumigos.servlets;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;
import java.util.List;

@WebServlet("/animalList")
public class AnimalListServlet extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;

    public AnimalListServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer adopted = Integer.parseInt(req.getParameter("adopted"));

        String url;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());

        List<Animal> animals = animalDao.getAnimalsByAdoptedStatus(adopted);

        if(animals.isEmpty()) req.setAttribute("animals", null);
        else req.setAttribute("animals", animals);

        if(adopted == 1) url = "/adopted-animal-list.jsp";
        else url = "/adoption-animal-list.jsp";

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
