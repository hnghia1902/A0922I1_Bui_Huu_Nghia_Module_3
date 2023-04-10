package calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "calculator.CalculatorServlet", value = "/Calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double first_opera = Double.parseDouble(request.getParameter("first_opera"));
        String operator = request.getParameter("operator");
        double second_opera = Double.parseDouble(request.getParameter("second_operand"));
        double result = 0;

        switch (operator){
            case "+":
                result = first_opera + second_opera;
                break;
            case "-":
                result = first_opera - second_opera;
            case "x":
                result = first_opera * second_opera;
                break;
            case "/":
                result = first_opera / second_opera;
                break;
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("/Calculator/index.jsp"). forward(request, response);
    }


}
