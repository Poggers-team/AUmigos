package br.org.aumigos.servlets;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Size;
import br.org.aumigos.model.animal.Type;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.Base64Encoder;
import br.org.aumigos.utils.DataSourceSearcher;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serial;

@WebServlet("/animalUpdate")
@MultipartConfig(maxFileSize = 16177215)
public class AnimalUpdateServlet extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;

    public AnimalUpdateServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        Type type = Type.valueOf(req.getParameter("type"));
        String breed = req.getParameter("breed");
        Gender gender = Gender.valueOf(req.getParameter("gender"));
        Size size = Size.valueOf(req.getParameter("size"));
        Integer age = Integer.parseInt(req.getParameter("age"));
        Double weight = Double.parseDouble(req.getParameter("weight"));
        String castrated = req.getParameter("castrated");
        String adopted = req.getParameter("adopted");
        Part filePart = req.getPart("image");

        Animal a = new Animal();

        if(filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            byte[] imageBytes = null;
            String base64Image = null;
            try (InputStream inputStream = filePart.getInputStream()) {
                imageBytes = inputStream.readAllBytes();
                base64Image = Base64Encoder.encodeToBase64(imageBytes);
            }
            a.setImage(base64Image);
            a.setFileName(fileName);
        }

        a.setId(id);
        a.setName(name);
        a.setType(type);
        a.setBreed(breed);
        a.setGender(gender);
        a.setSize(size);
        a.setAge(age);
        a.setWeight(weight);
        if(castrated == null) a.setCastrated(false);
        else a.setCastrated(true);
        if(adopted == null) a.setAdopted(false);
        else a.setAdopted(true);

        RequestDispatcher dispatcher;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());

        if(filePart.getSize() == 0) {
            Animal getAnimalImage = animalDao.getAnimalById(id);
            a.setImage(getAnimalImage.getImage());
            a.setFileName(getAnimalImage.getFileName());
        }

        if(animalDao.update(a)) req.setAttribute("result", "updated");

        req.setAttribute("animal", a);
        String url = "/animal-update.jsp";

        dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Long id = Long.parseLong(req.getParameter("animal-id"));
        String url = null;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal = animalDao.getAnimalById(id);
        RequestDispatcher dispatcher;

        switch(action) {
            case "update":
                req.setAttribute("animal", animal);
                url = "/animal-update.jsp";
                dispatcher = req.getRequestDispatcher(url);
                dispatcher.forward(req, resp);
                break;
            case "remove":
                Boolean response = animalDao.delete(animal);
                Gson gson = new Gson();
                String json = gson.toJson(response);
                resp.setContentType("application/json");
                resp.getWriter().write(json);
                break;
        }
    }
}
