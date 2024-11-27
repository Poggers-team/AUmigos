package br.org.aumigos.servlets;
import java.time.LocalDate;
import br.org.aumigos.model.Animal;
import br.org.aumigos.model.dao.AnimalDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/createPet")
@MultipartConfig
public class AnimalRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String especie = request.getParameter("especie");
            String genero = request.getParameter("genero");
            String raca = request.getParameter("raca");
            String cor = request.getParameter("cor");
            String idade = request.getParameter("idade");
            String porte = request.getParameter("porte");
            String nomePet = request.getParameter("nomePet");
            String historiaPet = request.getParameter("historiaPet");
            String cidade = request.getParameter("cidade");
            String endereco = request.getParameter("endereco");
            String nomeContato = request.getParameter("nomeContato");
            String emailContato = request.getParameter("emailContato");
            String telefoneContato = request.getParameter("telefoneContato");

            String[] cuidadosVeterinarios = request.getParameterValues("cuidadosVeterinarios");
            String[] temperamento = request.getParameterValues("temperamento");
            String[] socializacao = request.getParameterValues("socializacao");

            String cuidados = String.join(", ", cuidadosVeterinarios != null ? cuidadosVeterinarios : new String[0]);
            String temperamentoStr = String.join(", ", temperamento != null ? temperamento : new String[0]);
            String socializacaoStr = String.join(", ", socializacao != null ? socializacao : new String[0]);

            Part fotoPart = request.getPart("foto");

            byte[] foto = null;
            if (fotoPart != null) {
                foto = new byte[(int) fotoPart.getSize()];
                fotoPart.getInputStream().read(foto);
            }

            LocalDate dataCriacao = LocalDate.now();

            Animal animal = new Animal(
                    especie, genero, raca, cor, idade, porte,
                    nomePet, historiaPet, cidade, endereco,
                    nomeContato, emailContato, telefoneContato,
                    cuidados, temperamentoStr, socializacaoStr,
                    foto, dataCriacao
            );

            AnimalDao animalDao = new AnimalDao();
            animalDao.save(animal);

            response.sendRedirect("sucesso.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }
}