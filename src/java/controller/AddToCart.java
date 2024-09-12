package controller;

import dto.User_DTO;
import entity.Cart;
import entity.Product;
import entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.Validation;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try {
            String id = request.getParameter("id");
            String qty = request.getParameter("qty");
            
            System.out.println(id);
            System.out.println(qty);

            if (!Validation.isInteger(id)) {
                //prod not found
            } else if (!Validation.isInteger(qty)) {
                //invalid qty
            } else {

                int productId = Integer.parseInt(id);
                int productQty = Integer.parseInt(qty);

                if (productQty <= 0) {
                    //qty must be greater than 0

                } else {
                    Product product = (Product) session.load(Product.class, productId);

                    if (product != null) {
                        //product found

                        if (request.getSession().getAttribute("user") != null) {
                            //DB Cart

                            User_DTO user_DTO = (User_DTO) request.getSession().getAttribute("user");

                            //geting db user
                            Criteria criteria1 = session.createCriteria(User.class);
                            criteria1.add(Restrictions.eq("email", user_DTO.getEmail()));
                            User user = (User) criteria1.uniqueResult();

                            //check in db cart
                            Criteria criteria2 = session.createCriteria(Cart.class);
                            criteria2.add(Restrictions.eq("user", user));
                            criteria2.add(Restrictions.eq("product", product));

                            if (criteria2.list().isEmpty()) {
                                //items not found in cart

                                if (productQty <= product.getQty()) {
                                    //add product into cart

                                    Cart cart = new Cart();
                                    cart.setProduct(product);
                                    cart.setQty(productQty);
                                    cart.setUser(user);
                                    
                                    session.save(cart);
                                    transaction.commit();

                                } else {
                                    //qty not available
                                }

                            } else {
                                //item already found in cart
                                
                                Cart cartItem = (Cart) criteria2.uniqueResult();
                                
                                if ((cartItem.getQty()+productQty) <= product.getQty()) {
                                    
                                    cartItem.setQty(cartItem.getQty()+productQty);
                                    session.update(cartItem);
                                    transaction.commit();
                                    
                                } else {
                                    //can't update your cart.quantity not available.
                                    
                                    
                                }
                                
                            }

                        } else {
                            //Session Cart
                        }
                    } else {
                        //product not found
                    }
                }
            }

        } catch (Exception e) {
            // handle the exception
            // log the exception
            System.err.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
