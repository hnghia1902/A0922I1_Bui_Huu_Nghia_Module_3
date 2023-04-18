package controller;

import model.User;
import model.service.IUsersService;
import model.service.impl.UsersService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsersServlet", value = {"/Users",""})
public class UsersServlet extends HttpServlet {
    IUsersService iUsersService = new UsersService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "Create":
                createForm(request, response);
                break;
            case "delete":
                deleteById(request, response);
                break;
            case "Edit":
                edit(request, response);
                break;
            default:
                showListUser(request, response);
                break;
        }
    }


    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user",iUsersService.edit(id));
        try {
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iUsersService.delete(id);
        try {
            response.sendRedirect("/Users?action=");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("create.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listUsers", iUsersService.showList());
        try {
            request.getRequestDispatcher("showList.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "Create":
                createUsers(request, response);
                break;
            case "Update":
                Update(request, response);
                break;
            case "Search":
                search(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String country1 =  request.getParameter("country");

        request.setAttribute("User",iUsersService.search(country1));
        try {
            request.getRequestDispatcher("showList.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    private void Update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        iUsersService.update(user);
        try {
            response.sendRedirect("/Users?action=showList");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createUsers(HttpServletRequest request, HttpServletResponse response) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                User user = new User(name, email, country);
                iUsersService.createUsers(user);
                try {
                    response.sendRedirect("/Users?action=showList&isCreate=2");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }

    }
