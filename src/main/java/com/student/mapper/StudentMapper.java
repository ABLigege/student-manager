package com.student.mapper;

import com.student.entity.Student;
import java.util.List;
import java.util.Map;

public interface StudentMapper {
    // 新增学生
    int insert(Student student);

    // 查询所有学生
    List<Student> findAll();

    // 根据 ID 查询
    Student findById(Integer id);

    // 更新学生
    int update(Student student);

    // 删除学生
    int deleteById(Integer id);

    // 按学院统计
    List<Map<String, Object>> countByCollege();

    // 按专业统计
    List<Map<String, Object>> countByMajor();

    // 按条件查询
    List<Student> findByCondition(Map<String, Object> params);
}