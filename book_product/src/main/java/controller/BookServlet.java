package controller;

import model.book.Book;
import model.service.IBookService;
import model.service.impl.BookService;
import validate.Date_fomat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

@WebServlet(name = "BookServlet", value = {"/Book",""})
public class BookServlet extends HttpServlet {
    IBookService bookService = new BookService();
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
            case "Edit":
                editForm(request, response);
                break;
            case "Delete":
                delete_by_id(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void delete_by_id(HttpServletRequest request, HttpServletResponse response) {
        int id_edit = Integer.parseInt(request.getParameter("id"));
        bookService.delete_by_id(id_edit);
        try {
            response.sendRedirect("/Book?action=");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    private void editForm(HttpServletRequest request, HttpServletResponse response) {
        int id_edit = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("edit", bookService.edit(id_edit));
        try {
            request.getRequestDispatcher("editBook.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("createBook.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listBooks", bookService.showList());
        try {
            request.getRequestDispatcher("showBooks.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "Create":
                    createBook(request, response);
                break;
            case "Update":
                    updateBook(request, response);
                    break;

        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        Date publication_date = Date.valueOf(request.getParameter("publication_date"));
        int catalog_id = Integer.parseInt(request.getParameter("catalog_id"));

        Book book = new Book(id,name,price,description,publication_date,catalog_id);
        bookService.update(book);
        try {
            response.sendRedirect("/Book?action=");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void createBook(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
        Date publication_date = Date.valueOf(request.getParameter("publication_date"));
        int catalog_id = Integer.parseInt(request.getParameter("catalog_id"));
        Book book = new Book(name,price,description,publication_date,catalog_id);
        bookService.createBook(book);
        try {
            response.sendRedirect("/Book?action=");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
