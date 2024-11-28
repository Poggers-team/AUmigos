package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.animal.Gender;
import br.org.aumigos.model.animal.Size;
import br.org.aumigos.model.animal.Type;
import br.org.aumigos.model.dao.AnimalDao;
import br.org.aumigos.utils.Base64Encoder;
import br.org.aumigos.utils.DataSourceSearcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.InputStream;
import java.time.LocalDate;

public class AnimalRegisterHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        Type type = Type.valueOf(request.getParameter("type"));
        String breed = request.getParameter("breed");
        Gender gender = Gender.valueOf(request.getParameter("gender"));
        Size size = Size.valueOf(request.getParameter("size"));
        Integer age = Integer.parseInt(request.getParameter("age"));
        String color = request.getParameter("color");
        String story = request.getParameter("story");
        String vaccinated = request.getParameter("vaccinated");
        String castrated = request.getParameter("castrated");
        String dewormed = request.getParameter("dewormed");
        String[] temperament = request.getParameterValues("temperament");
        String[] socialization = request.getParameterValues("socialization");
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String contactName = request.getParameter("contactName");
        String contactEmail = request.getParameter("contactEmail");
        String contactPhone = request.getParameter("contactPhone");
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        byte[] imageBytes = null;
        String base64Image = null;
        try (InputStream inputStream = filePart.getInputStream()) {
            imageBytes = inputStream.readAllBytes();
            base64Image = Base64Encoder.encodeToBase64(imageBytes);
        }

        Animal a = new Animal();

        if(temperament != null) {
            StringBuilder temperamentString = new StringBuilder();
            for (String t : temperament) temperamentString.append(t).append(", ");
            temperamentString = new StringBuilder(temperamentString.substring(0, temperamentString.length() - 2));
            a.setTemperament(temperamentString.toString());
        } else a.setTemperament("Sem temperamento específicado");

        if(socialization != null) {
            StringBuilder socializationString = new StringBuilder();
            for (String s : socialization) socializationString.append(s).append(", ");
            socializationString = new StringBuilder(socializationString.substring(0, socializationString.length() - 2));
            a.setSocialization(socializationString.toString());
        } else a.setSocialization("Sem socialização específicada");

        if(!name.isEmpty()) a.setName(name);
        else a.setName("Sem nome");
        a.setName(name);
        a.setType(type);
        a.setBreed(breed);
        a.setGender(gender);
        a.setSize(size);
        a.setAge(age);
        a.setColor(color);
        if(!story.isEmpty()) a.setStory(story);
        else a.setStory("Sem história específicada");
        a.setCity(city);
        a.setAddress(address);
        a.setContactName(contactName);
        a.setContactEmail(contactEmail);
        a.setContactPhone(contactPhone);
        a.setAdopted(false);
        a.setVaccinated(vaccinated != null);
        a.setCastrated(castrated != null);
        a.setDewormed(dewormed != null);
        a.setAnnouncementDate(LocalDate.now());
        a.setImage(base64Image);
        a.setFileName(fileName);

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());

        if(animalDao.save(a)) request.setAttribute("result", "registered");

        return "/createPet.jsp";
    }
}
