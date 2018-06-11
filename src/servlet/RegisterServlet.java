package servlet;

import controller.AccountController;

import java.io.IOException;

public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("textml;charset=UTF-8");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        if(AccountController.register(username,gender,password)){
            //Success
            request.getSession().setAttribute("username",username);
            response.getWriter().write("success");
        }
        else{
            //Failed
            response.getWriter().write("failed");
        }
    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
