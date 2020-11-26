package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import services.AccountService;

public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String UUID = request.getParameter("uuid");
        
        if (UUID != null) {
            getServletContext().getRequestDispatcher("/WEB-INF/reset_new_password.jsp").forward(request, response);
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String UUID = request.getParameter("uuid");
        AccountService as = new AccountService();
        
        int successMessage = 1;
        int errorMessage = 0;
        

        if (UUID == null) {
            String email = request.getParameter("email");
            String path = getServletContext().getRealPath("/WEB-INF");
            // To get the URL for the link to pass to resetPassword
            String url = request.getRequestURL().toString();

            User user = as.resetPassword(email, path, url);

            if (user == null) {
                request.setAttribute("message", errorMessage);
                getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
                return;
            }  
        } else {
            String newpassword = request.getParameter("newpassword");
            
            if (as.changePassword(UUID, newpassword)) {
                request.setAttribute("message", successMessage);
            } else {
                request.setAttribute("message", errorMessage);
            }
            
            getServletContext().getRequestDispatcher("/WEB-INF/reset_new_password.jsp").forward(request, response);

        }
        
        request.setAttribute("message", successMessage);
        getServletContext().getRequestDispatcher("/WEB-INF/reset.jsp").forward(request, response);
    }

}
