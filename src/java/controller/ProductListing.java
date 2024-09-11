package controller;

import com.google.gson.Gson;
import dto.Response_DTO;
import entity.Category;
import entity.Color;
import entity.Model;
import entity.ProductCondition;
import entity.Storage;
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

        if (!Validation.isInteger(categoryId)) {
            response_DTO.setContent("Invalid Category");
        } else if (!Validation.isInteger(modelId)) {
            response_DTO.setContent("Invalid Model");
        } else if (!Validation.isInteger(storageId)) {
            response_DTO.setContent("Invalid Storage");
        } else if (!Validation.isInteger(colorId)) {
            response_DTO.setContent("Invalid Color");
        } else if (!Validation.isInteger(conditionId)) {
            response_DTO.setContent("Invalid Condition");

        } else if (title.isEmpty()) {
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

        } else if (image1.getSubmittedFileName() == null) {
            response_DTO.setContent("Please upload Image 1");
        } else if (image2.getSubmittedFileName() == null) {
            response_DTO.setContent("Please upload Image 2");
        } else if (image3.getSubmittedFileName() == null) {
            response_DTO.setContent("Please upload Image 3");

        } else {
            Category category = (Category) session.get(Category.class, Integer.parseInt(categoryId));

            if (category == null) {
                response_DTO.setContent("Please select a valid Category");
            } else {
                Model model = (Model) session.get(Model.class, Integer.parseInt(modelId));

                if (model == null) {
                    response_DTO.setContent("Please select a valid Model");
                } else {
                    if (model.getCategory().getId() != category.getId()) {
                        response_DTO.setContent("Please select a valid Model");
                    } else {
                        Storage storage = (Storage) session.get(Storage.class, Integer.parseInt(storageId));

                        if (storage == null) {
                            response_DTO.setContent("Please select a valid Storage");
                        } else {
                            Color color = (Color) session.get(Color.class, Integer.parseInt(colorId));

                            if (color == null) {
                                response_DTO.setContent("Please select a valid Color");
                            } else {
                                ProductCondition condition = (ProductCondition) session.get(ProductCondition.class, Integer.parseInt(conditionId));

                                if (condition == null) {
                                    response_DTO.setContent("Please select a valid Condition");
                                } else {
                                    // All validations passed, continue with other processing
                                }
                            }
                        }
                    }
                } 
            }
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(response_DTO));
        System.out.println(gson.toJson(response_DTO));
    }

}
