package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.Response_DTO;
import entity.Category;
import entity.Color;
import entity.Availability;
import entity.Brand;
import entity.Size;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

@WebServlet(name = "LoadFeactures", urlPatterns = {"/LoadFeactures"})
public class LoadFeactures extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("OK");

        Response_DTO response_DTO = new Response_DTO();

        Gson gson = new Gson();

        Session session = HibernateUtil.getSessionFactory().openSession();

        Criteria criteria1 = session.createCriteria(Category.class);
        criteria1.addOrder(Order.asc("name"));
        List<Category> categoryList = criteria1.list();

        Criteria criteria2 = session.createCriteria(Brand.class);
        criteria2.addOrder(Order.asc("name"));
        List<Brand> BrandList = criteria2.list();

        Criteria criteria3 = session.createCriteria(Color.class);
        criteria3.addOrder(Order.asc("name"));
        List<Color> colorList = criteria3.list();

        Criteria criteria4 = session.createCriteria(Size.class);
        criteria4.addOrder(Order.asc("value"));
        List<Size> sizeList = criteria4.list();

        Criteria criteria5 = session.createCriteria(Availability.class);
        criteria4.addOrder(Order.asc("name"));
        List<Availability> availabilityList = criteria5.list();

        JsonObject jsonObject = new JsonObject();
        jsonObject.add("categoryList", gson.toJsonTree(categoryList));
        jsonObject.add("BrandList", gson.toJsonTree(BrandList));
        jsonObject.add("colorList", gson.toJsonTree(colorList));
        jsonObject.add("sizeList", gson.toJsonTree(sizeList));
        jsonObject.add("availabilityList", gson.toJsonTree(availabilityList));

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(jsonObject));

        session.close();

    }

}
