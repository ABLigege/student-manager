package com.student.service;

import com.student.entity.Student;
import com.student.mapper.StudentMapper;
import com.student.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService {
    private StudentMapper getMapper() {
        SqlSession session = MyBatisUtil.getSqlSession();
        return session.getMapper(StudentMapper.class);
    }

    public int addStudent(Student student) {
        return getMapper().insert(student);
    }

    public List<Student> getAllStudents() {
        return getMapper().findAll();
    }

    public Student getStudentById(Integer id) {
        return getMapper().findById(id);
    }

    public int updateStudent(Student student) {
        return getMapper().update(student);
    }

    public int deleteStudent(Integer id) {
        return getMapper().deleteById(id);
    }

    public List<Map<String, Object>> countByCollege() {
        return getMapper().countByCollege();
    }

    public List<Map<String, Object>> countByMajor() {
        return getMapper().countByMajor();
    }

    // ✅ 核心修改：Java 8 兼容写法
    public List<Student> searchStudents(String collegeCode, String majorCode, String keyword) {
        Map<String, Object> params = new HashMap<>();

        if (collegeCode != null && !collegeCode.trim().isEmpty()) {
            params.put("collegeCode", collegeCode);
        }
        if (majorCode != null && !majorCode.trim().isEmpty()) {
            params.put("majorCode", majorCode);
        }
        if (keyword != null && !keyword.trim().isEmpty()) {
            params.put("keyword", keyword);
        }

        // 如果什么条件都没填，返回空列表（避免全表扫描）
        if (params.isEmpty()) {
            return new ArrayList<>();
        }

        return getMapper().findByCondition(params);
    }
}