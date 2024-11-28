package br.org.aumigos.servlets;
import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Size;
import br.org.aumigos.model.animal.Type;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.Base64Encoder;
import br.org.aumigos.utils.DataSourceSearcher;
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
import java.time.LocalDate;

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
        String name = req.getParameter("name");
        Type type = Type.valueOf(req.getParameter("type"));
        String breed = req.getParameter("breed");
        Gender gender = Gender.valueOf(req.getParameter("gender"));
        Size size = Size.valueOf(req.getParameter("size"));
        Integer age = Integer.parseInt(req.getParameter("age"));
        String color = req.getParameter("color");
        String story = req.getParameter("story");
        String vaccinated = req.getParameter("vaccinated");
        String castrated = req.getParameter("castrated");
        String dewormed = req.getParameter("dewormed");
        String[] temperament = req.getParameterValues("temperament");
        String[] socialization = req.getParameterValues("socialization");
        String city = req.getParameter("city");
        String address = req.getParameter("address");
        String contactName = req.getParameter("contactName");
        String contactEmail = req.getParameter("contactEmail");
        String contactPhone = req.getParameter("contactPhone");
        Part filePart = req.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        byte[] imageBytes = null;
        String base64Image = null;
        try (InputStream inputStream = filePart.getInputStream()) {
            imageBytes = inputStream.readAllBytes();
            base64Image = Base64Encoder.encodeToBase64(imageBytes);
        }

        StringBuilder temperamentString = new StringBuilder();
        StringBuilder socializationString = new StringBuilder();

        for (String t : temperament) temperamentString.append(t).append(", ");


        for (String s : socialization) socializationString.append(s).append(", ");


        temperamentString = new StringBuilder(temperamentString.substring(0, temperamentString.length() - 2));
        socializationString = new StringBuilder(socializationString.substring(0, socializationString.length() - 2));


        Animal a = new Animal();
        if(!name.isEmpty()) a.setName(name);
        else a.setName(null);
        a.setName(name);
        a.setType(type);
        a.setBreed(breed);
        a.setGender(gender);
        a.setSize(size);
        a.setAge(age);
        a.setColor(color);
        if(!story.isEmpty()) a.setStory(story);
        else a.setStory(null);
        a.setCity(city);
        a.setAddress(address);
        a.setContactName(contactName);
        a.setContactEmail(contactEmail);
        a.setContactPhone(contactPhone);
        a.setAdopted(false);
        a.setVaccinated(vaccinated != null);
        a.setCastrated(castrated != null);
        a.setDewormed(dewormed != null);
        a.setTemperament(temperamentString.toString());
        a.setSocialization(socializationString.toString());
        a.setAnnouncementDate(LocalDate.now());
        a.setImage(base64Image);
        a.setFileName(fileName);

        RequestDispatcher dispatcher;

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());

        if(animalDao.save(a)) req.setAttribute("result", "registered");

        String url = "/createPet.jsp";

        dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}