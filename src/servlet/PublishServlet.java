package servlet;

import controller.PublishController;
import module.Pet;

import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "PublishServlet")
public class PublishServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String petId = request.getParameter("petId");
        String petName = (String) request.getParameter("petName");
        String petSpecies = (String) request.getParameter("petSpecies");
        String petPrice = (String) request.getParameter("petPrice");
        String petImage = (String) request.getParameter("petImage");
        String ownerName = (String) request.getParameter("ownerName");
        String ownerPhone = (String) request.getParameter("ownerPhone");
        String petDetails = (String) request.getParameter("petDetails");
        String username = (String) request.getSession().getAttribute("username");
        Pet pet = new Pet();
        pet.setPetName(petName);
        pet.setSpecies(petSpecies);
        pet.setPetImagePath(new String[]{petImage});
        pet.setPetPrice(Double.parseDouble(petPrice));
        pet.setOwnerName(ownerName);
        pet.setPhoneNumber(ownerPhone);
        pet.setPetDetails(petDetails);
        if(petId==null)
            PublishController.publish(pet,username);
        else{
            PublishController.publish(petId,pet);
        }
        response.sendRedirect("/publish.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
