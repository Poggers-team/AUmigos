package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Size;
import br.org.aumigos.model.animal.Type;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.Base64Encoder;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.InputStream;

public class AnimalUpdateHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        Type type = Type.valueOf(request.getParameter("type"));
        String breed = request.getParameter("breed");
        Gender gender = Gender.valueOf(request.getParameter("gender"));
        Size size = Size.valueOf(request.getParameter("size"));
        Integer age = Integer.parseInt(request.getParameter("age"));
        Double weight = Double.parseDouble(request.getParameter("weight"));
        String castrated = request.getParameter("castrated");
        String adopted = request.getParameter("adopted");
        Part filePart = request.getPart("image");

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
        if(castrated == null) a.setCastrated(false);
        else a.setCastrated(true);
        if(adopted == null) a.setAdopted(false);
        else a.setAdopted(true);

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());

        if(filePart.getSize() == 0) {
            Animal getAnimalImage = animalDao.getAnimalById(id);
            a.setImage(getAnimalImage.getImage());
            a.setFileName(getAnimalImage.getFileName());
        }

        if(animalDao.update(a)) request.setAttribute("result", "updated");

        request.setAttribute("animal", a);
        return "/animal-update.jsp";
    }
}
