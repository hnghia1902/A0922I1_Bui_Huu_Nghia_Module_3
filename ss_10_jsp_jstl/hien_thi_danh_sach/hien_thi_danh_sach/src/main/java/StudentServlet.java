import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/Student")
public class StudentServlet extends HttpServlet {

    private static List<Student> studentList;

    static {
        studentList = new ArrayList<>();
        studentList.add(new Student("thu","09/01/2090","23ksjd-asdfd", "./img/cc1.jpg"));
        studentList.add(new Student("thua","09/01/2200","23ksjd-assded","./img/cc1.jpg"));
        studentList.add(new Student("thuw","09/01/2400","23ksjd-asgsdfd","./img/cc1.jpg"));
        studentList.add(new Student("thud","09/01/2100","23ksjd-assdfed","./img/cc1.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
