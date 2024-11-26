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

@WebServlet("/animalRegister")
@MultipartConfig(maxFileSize = 16177215)
public class AnimalRegisterServlet extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;

    public AnimalRegisterServlet() {
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
        Integer age  = Integer.parseInt(req.getParameter("age"));
        Double weight = Double.parseDouble(req.getParameter("weight"));
        String castrated = req.getParameter("castrated");
        Part filePart = req.getPart("image");

        byte[] imageBytes = null;
        String base64Image = null;
        try (InputStream inputStream = filePart.getInputStream()) {
            imageBytes = inputStream.readAllBytes();
            base64Image = Base64Encoder.encodeToBase64(imageBytes);
        }

        Animal a = new Animal();
        a.setName(name);
        a.setType(type);
        a.setBreed(breed);
        a.setGender(gender);
        a.setSize(size);
        a.setAge(age);
        a.setWeight(weight);
        if(castrated == null) a.setCastrated(false);
        else a.setCastrated(true);
        a.setImage(base64Image);

        RequestDispatcher dispatcher;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());

        if(id == 0) {
            if(animalDao.save(a)) req.setAttribute("result", "registered");
        } else {
            a.setId(id);
            if(animalDao.update(a)) req.setAttribute("result", "updated");
        }

        String url = "/animal-register.jsp";

        dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Long id = Long.parseLong(req.getParameter("method-id"));
        String url = null;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal = animalDao.getAnimalById(id);
        RequestDispatcher dispatcher;

        if(animal != null) {
            switch(action) {
                case "update":
                    req.setAttribute("animal", animal);
                    url = "/animal-register.jsp";
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
        } else {
            url = "/animalRegister";
            dispatcher = req.getRequestDispatcher(url);
            dispatcher.forward(req, resp);
        }
    }
}
