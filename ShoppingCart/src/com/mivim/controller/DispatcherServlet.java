package com.mivim.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dto.AdminDTO;
import com.mivim.controller.ShoppingCart;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userPath = request.getServletPath();
		String getURL = "/" + userPath + ".jsp";

		// If user requested cart page
		if (userPath.equals("/cart")) {
			// Retrieve all the items available in the cart
			hs = request.getSession();
			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					getURL);
			rd.forward(request, response);
			return;
		}
	
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userPath = request.getServletPath();
		String postURL = "/" + userPath + ".jsp";

		// If user request to add products
		// to shopping cart
		if (userPath.equals("/addProducts")) {

			// Request the Session
			HttpSession hs = request.getSession();
			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");

			// Checks whether cart is available
			// If not, then will create a cart object
			if (cart == null) {
				cart = new ShoppingCart();
				hs.setAttribute("cart", cart);
			}

			int prodID = Integer.parseInt((hs.getAttribute("productID")
					.toString()));
			Integer productID = new Integer(prodID);
			// Check whether the product id is not null
			// If not null then add the product to the cart

			if (productID != null) {
				ProductService service = new ProductService();
				Product p = service.getProductDetails(productID);

				cart.add(productID, p);
				response.sendRedirect("product.jsp");

			}
		}

		// If user request to update the products
		else if (userPath.equals("/update")) {
			String prod_id = request.getParameter("productid");
			int productid = Integer.parseInt(prod_id);
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			ProductService productService = new ProductService();
			Product product = (Product) productService
					.getProductDetails(productid);

			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");

			if (cart != null) {
				cart.updateQuantity(productid, quantity, product);
			}
			response.sendRedirect("cart.jsp");
		}
		// If user request to purchase the products
		else if (userPath.equals("/purchase")) {
			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");
			cart.clear();	
			response.sendRedirect("orderconfirm.jsp");
		}
		// If user registers
		else if (userPath.equals("/register")) {
			String email = request.getParameter("inputEmail");
			String password = request.getParameter("password");

			CustomerService cs = new CustomerService();
			boolean flag = cs.registerCustomer(email, password);
			
			if (flag) {
				request.setAttribute("regstatus", "success");
				response.sendRedirect("login.jsp?regStatus=Success");
			} else {
				response.sendRedirect("checkout_unreg.jsp?regStatus=Fail");
			}
		}
		// If user logs in
		else if (userPath.equals("/login")) {
			String email = request.getParameter("inputEmail");
			String password = request.getParameter("password");

			CustomerService cs = new CustomerService();
			boolean flag = cs.verifyUser(email, password);
			if (flag) {
				HttpSession hs = request.getSession();
				hs.setAttribute("email", email);
				response.sendRedirect("final_checkout.jsp");
			} else {
				response.sendRedirect("login.jsp?regStatus=Fail");
			}

		}
		// If user wants to remove an item from cart
		else if (userPath.equals("/remove")) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");

			if (cart != null) {
				cart.remove(pid);
				response.sendRedirect("cart.jsp");
			}
		}

	}
}
