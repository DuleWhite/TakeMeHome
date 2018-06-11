package servlet;

import controller.AccountController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("textml;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(AccountController.exist(username,password)){
            request.getSession().setAttribute("username",username);
            response.getWriter().write("success");
        }
        else{
            response.getWriter().write("failed");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
