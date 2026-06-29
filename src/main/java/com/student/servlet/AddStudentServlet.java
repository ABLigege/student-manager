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
import java.util.Date;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    private StudentService service = new StudentService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // 获取表单数据
        String studentNo = req.getParameter("studentNo");
        String name = req.getParameter("name");
        String gender = req.getParameter("gender");
        String birthdayStr = req.getParameter("birthday");
        String political = req.getParameter("political");
        String idCard = req.getParameter("idCard");
        String collegeCode = req.getParameter("collegeCode");
        String majorCode = req.getParameter("majorCode");
        String grade = req.getParameter("grade");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String zipCode = req.getParameter("zipCode");

        // 非空校验
        if (studentNo == null || studentNo.trim().isEmpty()
                || name == null || name.trim().isEmpty()
                || gender == null || gender.trim().isEmpty()) {
            req.setAttribute("errorMsg", "学号、姓名、性别为必填项，不能为空！");
            req.getRequestDispatcher("/addStudent.jsp").forward(req, resp);
            return;
        }

        // 封装对象
        Student student = new Student();
        student.setStudentNo(studentNo);
        student.setName(name);
        student.setGender(gender);
        student.setPolitical(political);
        student.setIdCard(idCard);
        student.setCollegeCode(collegeCode);
        student.setMajorCode(majorCode);
        student.setGrade(grade);
        student.setAddress(address);
        student.setPhone(phone);
        student.setZipCode(zipCode);

        // 日期转换
        if (birthdayStr != null && !birthdayStr.trim().isEmpty()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                student.setBirthday(sdf.parse(birthdayStr));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 插入数据库
        int result = service.addStudent(student);
        if (result > 0) {
            req.setAttribute("successMsg", "学生信息添加成功！");
        } else {
            req.setAttribute("errorMsg", "添加失败，请检查数据！");
        }

        req.getRequestDispatcher("/addStudent.jsp").forward(req, resp);
    }
}