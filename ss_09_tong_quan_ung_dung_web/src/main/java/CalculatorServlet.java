import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Calculator", value = "/pdc")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("P_name");
        double price = Double.parseDouble((request.getParameter("P_price")));
        double percent = Double.parseDouble(request.getParameter("P_percent"));
        double a = 0.01;
        double amount = price * percent * a;
        String display = "Mô tả sản phẩm: "+ name +" /// "+ "Giá sau khi chiết khấu: "+ amount;
        request.setAttribute("display", display);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
