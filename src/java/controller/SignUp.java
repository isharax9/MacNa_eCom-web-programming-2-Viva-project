/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dto.Response_DTO;
import dto.User_DTO;
import entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.Mail;
import model.Validation;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author isharaLakshitha
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Done");
        Response_DTO response_DTO = new Response_DTO();
        Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

        User_DTO user_DTO = gson.fromJson(request.getReader(), User_DTO.class);

//        System.out.println(user_DTO.getFirst_name());
//        System.out.println(user_DTO.getLast_name());
//        System.out.println(user_DTO.getEmail());
//        System.out.println(user_DTO.getPassword());
//
//        System.out.println(gson.toJson(user_DTO));
        if (user_DTO.getFirst_name().isEmpty()) {
            response_DTO.setContent("Please enter your first name");

        } else if (user_DTO.getLast_name().isEmpty()) {
            response_DTO.setContent("Please enter your last name");

        } else if (user_DTO.getEmail().isEmpty()) {
            response_DTO.setContent("Please enter your email");

        } else if (!Validation.isEmailValid(user_DTO.getEmail())) {
            response_DTO.setContent("Please enter correct email address");

        } else if (user_DTO.getPassword().isEmpty()) {
            response_DTO.setContent("Please enter your password");

        } else if (user_DTO.getPassword().length() < 8) {
            response_DTO.setContent("Password must include atleast one uppercase letter , number , special character with less than eight(8) total characters");
        } else {

            Session session = HibernateUtil.getSessionFactory().openSession();

            Criteria criteria1 = session.createCriteria(User.class);
            criteria1.add(Restrictions.eq("email", user_DTO.getEmail()));

            if (!criteria1.list().isEmpty()) {
                response_DTO.setContent("User with this email already exists. Try different email");
            } else {

                // gen verification code
                // UUID.randomUUID(); we can alos use this
                int code = (int) (Math.random() * 1000000);

                //save user
                final User user = new User();

                user.setFirst_name(user_DTO.getFirst_name());
                user.setLast_name(user_DTO.getLast_name());
                user.setEmail(user_DTO.getEmail());
                user.setPassword(user_DTO.getPassword());
                user.setVerification(String.valueOf(code));

                session.save(user);

                //send verif email
                Thread sendMailThread = new Thread() {

                    @Override
                    public void run() {
                        Mail.sendMail(user.getEmail(), "MacNa eCom Verification",
                                "<h2 style=\"color:#0d6efd;\">Your Verification Code: " + user.getVerification() + "</h2>");
                    }

                };

//                sendMailThread.start();
                session.save(user);
                session.beginTransaction().commit();

                request.getSession().setAttribute("email", user_DTO.getEmail());
                response_DTO.setSuccess(true);
                response_DTO.setContent("Registration Complete. Please Check your email inbox for verification code");

            }

            session.close();

        }

        response.getWriter().write(gson.toJson(response_DTO));

    }
}
