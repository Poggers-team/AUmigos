package br.org.aumigos.servlets;

import br.org.aumigos.model.dao.VoluntaryDao;
import br.org.aumigos.model.voluntary.Availability;
import br.org.aumigos.model.voluntary.Voluntary;
import br.org.aumigos.utils.DataSourceSearcher;
import br.org.aumigos.utils.PhoneVerifier;
import br.org.aumigos.utils.sms.SendSms;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/voluntaryRegister")
public class VoluntaryRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        Availability availability = Availability.valueOf(req.getParameter("availability"));
        String skills = req.getParameter("skills");

        Voluntary voluntary = new Voluntary();
        voluntary.setName(name);
        voluntary.setEmail(email);
        voluntary.setAvailability(availability);
        voluntary.setSkills(skills);

        RequestDispatcher dispatcher;

        PhoneVerifier pv = new PhoneVerifier();

        phone = pv.verifyPhone(phone);

        voluntary.setPhone(phone);

        req.setAttribute("voluntary", voluntary);

        if(phone == null) {
            req.setAttribute("result", "notRegistered");
            dispatcher = req.getRequestDispatcher("/voluntary.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        VoluntaryDao voluntaryDao = new VoluntaryDao(DataSourceSearcher.getInstance().getDataSource());

        SendSms sendSms = new SendSms();

        try {
            if(voluntaryDao.save(voluntary)){
                req.setAttribute("result", "registered");
                dispatcher = req.getRequestDispatcher("/voluntary.jsp");
                sendSms.send(phone, name);
                dispatcher.forward(req, resp);
            }
        } catch(InterruptedException ignored) {}
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
