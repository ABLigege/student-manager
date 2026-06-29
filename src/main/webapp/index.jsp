<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
    <style>
        body { font-family: 'Microsoft YaHei', sans-serif; background: #f0f2f5; margin: 0; padding: 0; }
        .container { width: 600px; margin: 100px auto; text-align: center; }
        .btn { display: inline-block; margin: 15px; padding: 15px 40px;
               background: #1890ff; color: #fff; text-decoration: none;
               border-radius: 6px; font-size: 16px; transition: all 0.3s; }
        .btn:hover { background: #40a9ff; transform: translateY(-2px); }
        h1 { color: #333; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎓 学生信息管理系统</h1>
        <a href="${pageContext.request.contextPath}/addStudent.jsp" class="btn">📝 学生信息填报</a>
        <a href="${pageContext.request.contextPath}/studentList" class="btn">📋 学生信息浏览</a>
    </div>
</body>
</html>