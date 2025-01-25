package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.adoption.Adoption;
import br.org.aumigos.model.adoption.ResidenceType;
import br.org.aumigos.model.animal.Animal;
import br.org.aumigos.model.dao.AdoptionDao;
import br.org.aumigos.utils.DataSourceSearcher;
import br.org.aumigos.utils.PhoneVerifier;
import br.org.aumigos.utils.sms.SendSms;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;

public class AnimalAdoptHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long animalId = Long.parseLong(request.getParameter("animal-id"));
        String name = request.getParameter("name");
        Integer age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String zipcode = request.getParameter("zipcode");
        String address = request.getParameter("address");
        String phone = request.getParameter("tel");
        ResidenceType residenceType = ResidenceType.valueOf(request.getParameter("residence"));
        Boolean automaticGate = Boolean.parseBoolean(request.getParameter("automaticGate"));
        Boolean pool = Boolean.parseBoolean(request.getParameter("pool"));
        Boolean windowNet = Boolean.parseBoolean(request.getParameter("windowNet"));
        String comments = request.getParameter("comments");
        Integer animalsInHouse = Integer.parseInt(request.getParameter("animalsInHouse"));
        String experiences = request.getParameter("animalsExperience");
        String animalPlace = request.getParameter("animalPlace");
        Boolean adopterIsResponsible = Boolean.parseBoolean(request.getParameter("adopterIsResponsible"));
        Boolean awareOfCosts = Boolean.parseBoolean(request.getParameter("awareOfCosts"));
        Integer peopleInHouse = Integer.parseInt(request.getParameter("peopleInHouse"));
        Boolean peopleAdoption = Boolean.parseBoolean(request.getParameter("peopleAdoption"));
        Boolean childrenInHouse = Boolean.parseBoolean(request.getParameter("childrenInHouse"));
        String aloneTime = request.getParameter("aloneTime");

        Adoption adoption = new Adoption();

        adoption.setName(name);
        adoption.setAge(age);
        adoption.setEmail(email);
        adoption.setZipCode(zipcode);
        adoption.setAddress(address);
        adoption.setPhone(phone);
        adoption.setResidenceType(residenceType);
        adoption.setAutomaticGate(automaticGate);
        adoption.setPool(pool);
        adoption.setNetOnWindows(windowNet);
        adoption.setComments(comments);
        adoption.setQtyAnimals(animalsInHouse);
        adoption.setExperiences(experiences);
        adoption.setAnimalPlace(animalPlace);
        adoption.setResponsible(adopterIsResponsible);
        adoption.setAwareOfCosts(awareOfCosts);
        adoption.setPeopleLivingInHouse(peopleInHouse);
        adoption.setPeopleAwareOfAdoption(peopleAdoption);
        adoption.setAnimalAloneTime(aloneTime);
        adoption.setChildrenAtHouse(childrenInHouse);
        adoption.setAdoptionDate(LocalDate.now());

        Animal animal = new Animal();

        animal.setId(animalId);

        adoption.setAnimal(animal);

        AdoptionDao adoptionDao = new AdoptionDao(DataSourceSearcher.getInstance().getDataSource());

        if(adoptionDao.save(adoption)) request.setAttribute("result", "updated");

        StringBuilder builder = new StringBuilder();

        builder.append("Obrigado por se interessar a adotar um animalzinho " + name + "!\r\n");
        builder.append("Entraremos em contato em breve. ONG AUmigos");

        PhoneVerifier pv = new PhoneVerifier();

        if(pv.verifyPhone(phone) != null) {
            SendSms sendSms = new SendSms();
            sendSms.send(phone, builder.toString());
        }

        request.setAttribute("adoption", adoption);
        return "/FrontController?action=home";
    }
}
