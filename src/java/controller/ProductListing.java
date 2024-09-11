package controller;

import com.google.gson.Gson;
import dto.Response_DTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.HibernateUtil;
import model.Validation;
import org.hibernate.Session;

@MultipartConfig
@WebServlet(name = "ProductListing", urlPatterns = {"/ProductListing"})
public class ProductListing extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();

        Response_DTO response_DTO = new Response_DTO();

        String categoryId = request.getParameter("categoryId");
        String modelId = request.getParameter("modelId");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String storageId = request.getParameter("storageId");
        String colorId = request.getParameter("colorId");
        String conditionId = request.getParameter("conditionId");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        Part image1 = request.getPart("image1");
        Part image2 = request.getPart("image2");
        Part image3 = request.getPart("image3");

        Session session = HibernateUtil.getSessionFactory().openSession();

        if (title.isEmpty()) {
            response_DTO.setContent("please fill product title");

        } else if (description.isEmpty()) {
            response_DTO.setContent("please fill the description");

        } else if (price.isEmpty()) {
            response_DTO.setContent("please fill the price");
        } else if (!Validation.isDouble(price)) {
            response_DTO.setContent("invalid price");
        } else if (Double.parseDouble(price) <= 0) {
            response_DTO.setContent("Invalid price");

        } else if (quantity.isEmpty()) {
            response_DTO.setContent("please fill the quantity");
        } else if (!Validation.isInteger(quantity)) {
            response_DTO.setContent("Invalid quantity");
        } else if (Integer.parseInt(quantity) <= 0) {
            response_DTO.setContent("Invalid Quantity");

        } else {
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(response_DTO));
        System.out.println(gson.toJson(response_DTO));
    }

}
