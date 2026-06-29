<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>学生信息浏览</title>
    <style>
        body { font-family: 'Microsoft YaHei', sans-serif; background: #f0f2f5; margin: 0; padding: 20px; }
        .container { width: 1200px; margin: 0 auto; }
        h2 { text-align: center; color: #333; }
        .search-box { background: #fff; padding: 20px; border-radius: 8px; margin-bottom: 20px; display: flex; gap: 10px; align-items: center; flex-wrap: wrap; }
        .search-box input, .search-box select { padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .search-box button { padding: 8px 20px; background: #1890ff; color: #fff; border: none; border-radius: 4px; cursor: pointer; }
        .search-box button:hover { background: #40a9ff; }
        .stats { display: flex; gap: 20px; margin-bottom: 20px; }
        .stat-card { flex: 1; background: #fff; padding: 15px; border-radius: 8px; text-align: center; }
        .stat-card h3 { margin: 0; color: #1890ff; font-size: 24px; }
        table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 8px; overflow: hidden; }
        th, td { padding: 12px 10px; text-align: center; border-bottom: 1px solid #f0f0f0; font-size: 13px; }
        th { background: #1890ff; color: #fff; }
        tr:hover { background: #f5f7fa; }
        .btn-edit { color: #1890ff; text-decoration: none; margin: 0 5px; }
        .btn-delete { color: #ff4d4f; text-decoration: none; margin: 0 5px; }
        .btn-back { display: inline-block; margin-top: 20px; color: #1890ff; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📋 学生信息浏览</h2>

        <!-- 搜索区域 -->
        <form class="search-box" action="${pageContext.request.contextPath}/studentList" method="get">
            <input type="text" name="keyword" placeholder="搜索姓名/学号" value="${keyword}">
            <input type="text" name="collegeCode" placeholder="学院代码" value="${collegeCode}">
            <input type="text" name="majorCode" placeholder="专业代码" value="${majorCode}">
            <button type="submit">🔍 查询</button>
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/studentList'">重置</button>
        </form>

        <!-- 统计卡片 -->
        <div class="stats">
            <div class="stat-card">
                <p>按学院统计</p>
                <c:forEach items="${collegeStats}" var="stat">
                    <h3>${stat.collegeName}: ${stat.studentCount}人</h3>
                </c:forEach>
            </div>
            <div class="stat-card">
                <p>按专业统计</p>
                <c:forEach items="${majorStats}" var="stat">
                    <h3>${stat.majorCode}: ${stat.studentCount}人</h3>
                </c:forEach>
            </div>
        </div>

        <!-- 学生表格 -->
        <table>
            <tr>
                <th>学号</th><th>姓名</th><th>性别</th><th>出生日期</th>
                <th>政治面貌</th><th>学院代码</th><th>专业代码</th>
                <th>年级</th><th>手机</th><th>操作</th>
            </tr>
            <c:forEach items="${studentList}" var="stu">
                <tr>
                    <td>${stu.studentNo}</td>
                    <td>${stu.name}</td>
                    <td>${stu.gender}</td>
                    <td>${stu.birthday}</td>
                    <td>${stu.political}</td>
                    <td>${stu.collegeCode}</td>
                    <td>${stu.majorCode}</td>
                    <td>${stu.grade}</td>
                    <td>${stu.phone}</td>
                    <td>
                        <a class="btn-edit" href="${pageContext.request.contextPath}/updateStudent?id=${stu.id}">编辑</a>
                        <a class="btn-delete" href="${pageContext.request.contextPath}/deleteStudent?id=${stu.id}"
                           onclick="return confirm('确认删除该学生？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty studentList}">
                <tr><td colspan="10" style="color:#999;">暂无学生数据</td></tr>
            </c:if>
        </table>

        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-back">← 返回首页</a>
    </div>
</body>
</html>