package br.org.aumigos.servlets.helpers;

import br.org.aumigos.model.dao.VoluntaryDao;
import br.org.aumigos.model.voluntary.Availability;
import br.org.aumigos.model.voluntary.Voluntary;
import br.org.aumigos.utils.DataSourceSearcher;
import br.org.aumigos.utils.PhoneVerifier;
import br.org.aumigos.utils.sms.SendSms;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VoluntaryRegisterHelper implements Helper {
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Availability availability = Availability.valueOf(request.getParameter("availability"));
        String skills = request.getParameter("skills");

        Voluntary voluntary = new Voluntary();
        voluntary.setName(name);
        voluntary.setEmail(email);
        voluntary.setAvailability(availability);
        voluntary.setSkills(skills);

        PhoneVerifier pv = new PhoneVerifier();

        phone = pv.verifyPhone(phone);
        voluntary.setPhone(phone);
        request.setAttribute("voluntary", voluntary);

        if(phone == null) {
            request.setAttribute("result", "notRegistered");
            return "/voluntary.jsp";
        }

        VoluntaryDao voluntaryDao = new VoluntaryDao(DataSourceSearcher.getInstance().getDataSource());
        SendSms sendSms = new SendSms();

        StringBuilder builder = new StringBuilder();
        builder.append("Muito obrigado por se voluntariar a ONG AUmigos " + name + " :)\r\n");
        builder.append("Entraremos em contato em breve!");

        if(voluntaryDao.save(voluntary)){
            request.setAttribute("result", "registered");
            sendSms.send(phone, builder.toString());
        }
        return "/voluntary.jsp";
    }
}
