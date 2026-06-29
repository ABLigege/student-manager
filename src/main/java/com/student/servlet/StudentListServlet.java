package com.student.servlet;

import com.student.entity.College;
import com.student.entity.Student;
import com.student.service.StudentService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/studentList")
public class StudentListServlet extends HttpServlet {
    private StudentService service = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String collegeCode = req.getParameter("collegeCode");
        String majorCode = req.getParameter("majorCode");
        String keyword = req.getParameter("keyword");

        // 查询学生列表
        List<Student> studentList = service.searchStudents(collegeCode, majorCode, keyword);

        // 统计
        List<Map<String, Object>> collegeStats = service.countByCollege();
        List<Map<String, Object>> majorStats = service.countByMajor();

        req.setAttribute("studentList", studentList);
        req.setAttribute("collegeStats", collegeStats);
        req.setAttribute("majorStats", majorStats);
        req.setAttribute("collegeCode", collegeCode);
        req.setAttribute("majorCode", majorCode);
        req.setAttribute("keyword", keyword);

        req.getRequestDispatcher("/studentList.jsp").forward(req, resp);
    }
}