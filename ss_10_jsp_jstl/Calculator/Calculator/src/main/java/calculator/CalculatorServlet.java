package calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data = request.getParameter("action");
        switch (data){
            case "calculator":
                calculator(request, response);
                break;
        }
    }

    private void calculator(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int first = Integer.parseInt(request.getParameter("first"));
        int second = Integer.parseInt(request.getParameter("second"));
        String calculator = request.getParameter("operator");
        int result = 0;
        switch (calculator) {
            case "addition":
                result = first + second;
                break;
            case "subtractio":
                result = first - second;
                break;
            case "multiplication":
                result = first * second;
                break;
            case "division":
                if (second <= 0) {
                    new NumberFormatException();
                } else if (second > 0) {
                    result = first / second;
                }
                break;
        }

        String display = "Result :  " + result;
        request.setAttribute("result", display);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
