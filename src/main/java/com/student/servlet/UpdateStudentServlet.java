package com.student.servlet;

import com.student.entity.Student;
import com.student.service.StudentService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    private StudentService service = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idStr = req.getParameter("id");
        Student student = service.getStudentById(Integer.parseInt(idStr));
        req.setAttribute("student", student);
        req.getRequestDispatcher("/updateStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Student student = new Student();
        student.setId(Integer.parseInt(req.getParameter("id")));
        student.setStudentNo(req.getParameter("studentNo"));
        student.setName(req.getParameter("name"));
        student.setGender(req.getParameter("gender"));
        student.setPolitical(req.getParameter("political"));
        student.setIdCard(req.getParameter("idCard"));
        student.setCollegeCode(req.getParameter("collegeCode"));
        student.setMajorCode(req.getParameter("majorCode"));
        student.setGrade(req.getParameter("grade"));
        student.setAddress(req.getParameter("address"));
        student.setPhone(req.getParameter("phone"));
        student.setZipCode(req.getParameter("zipCode"));

        String birthdayStr = req.getParameter("birthday");
        if (birthdayStr != null && !birthdayStr.trim().isEmpty()) {
            try {
                student.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthdayStr));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        int result = service.updateStudent(student);
        if (result > 0) {
            req.setAttribute("successMsg", "修改成功！");
        } else {
            req.setAttribute("errorMsg", "修改失败！");
        }

        req.getRequestDispatcher("/updateStudent.jsp").forward(req, resp);
    }
}