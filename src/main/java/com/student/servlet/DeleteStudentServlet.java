package com.student.servlet;

import com.student.service.StudentService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    private StudentService service = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");
        int result = service.deleteStudent(Integer.parseInt(idStr));

        if (result > 0) {
            req.getSession().setAttribute("successMsg", "删除成功！");
        } else {
            req.getSession().setAttribute("errorMsg", "删除失败！");
        }

        resp.sendRedirect(req.getContextPath() + "/studentList");
    }
}