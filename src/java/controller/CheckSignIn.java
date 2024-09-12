package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dto.Response_DTO;
import dto.User_DTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CheckSignIn", urlPatterns = {"/CheckSignIn"})
public class CheckSignIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            Response_DTO response_DTO = new Response_DTO();
            Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

            if (request.getSession().getAttribute("user") != null) {
                //already signed in

                User_DTO user_DTO = (User_DTO) request.getSession().getAttribute("user");
                response_DTO.setSuccess(true);
                response_DTO.setContent(user_DTO);

            } else {
                //not signed in

                response_DTO.setContent("Not Signed in");
            }

            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(response_DTO));

            
            
            
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
