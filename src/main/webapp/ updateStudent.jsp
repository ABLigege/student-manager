<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>修改学生信息</title>
    <style>
        body { font-family: 'Microsoft YaHei', sans-serif; background: #f0f2f5; }
        .container { width: 800px; margin: 30px auto; background: #fff; padding: 30px; border-radius: 8px; }
        h2 { text-align: center; }
        .form-row { display: flex; margin-bottom: 15px; align-items: center; }
        .form-row label { width: 120px; text-align: right; margin-right: 10px; }
        .form-row input, .form-row select { flex: 1; padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .btn-submit { display: block; width: 200px; margin: 20px auto; padding: 10px; background: #1890ff; color: #fff; border: none; border-radius: 4px; cursor: pointer; }
        .btn-submit:hover { background: #40a9ff; }
        .btn-back { display: block; width: 200px; margin: 10px auto; text-align: center; color: #1890ff; text-decoration: none; }
        .error { color: red; text-align: center; }
        .success { color: green; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <h2>✏️ 修改学生信息</h2>

        <c:if test="${not empty errorMsg}"><div class="error">${errorMsg}</div></c:if>
        <c:if test="${not empty successMsg}"><div class="success">${successMsg}</div></c:if>

        <form action="${pageContext.request.contextPath}/updateStudent" method="post">
            <input type="hidden" name="id" value="${student.id}">

            <div class="form-row">
                <label>学号</label>
                <input type="text" name="studentNo" value="${student.studentNo}">
            </div>
            <div class="form-row">
                <label>姓名</label>
                <input type="text" name="name" value="${student.name}">
            </div>
            <div class="form-row">
                <label>性别</label>
                <select name="gender">
                    <option value="男" ${student.gender == '男' ? 'selected' : ''}>男</option>
                    <option value="女" ${student.gender == '女' ? 'selected' : ''}>女</option>
                </select>
            </div>
            <div class="form-row">
                <label>出生日期</label>
                <input type="date" name="birthday" value="${student.birthday}">
            </div>
            <div class="form-row">
                <label>政治面貌</label>
                <select name="political">
                    <option value="群众" ${student.political == '群众' ? 'selected' : ''}>群众</option>
                    <option value="共青团员" ${student.political == '共青团员' ? 'selected' : ''}>共青团员</option>
                    <option value="中共党员" ${student.political == '中共党员' ? 'selected' : ''}>中共党员</option>
                    <option value="预备党员" ${student.political == '预备党员' ? 'selected' : ''}>预备党员</option>
                </select>
            </div>
            <div class="form-row">
                <label>身份证号</label>
                <input type="text" name="idCard" value="${student.idCard}">
            </div>
            <div class="form-row">
                <label>学院代码</label>
                <input type="text" name="collegeCode" value="${student.collegeCode}">
            </div>
            <div class="form-row">
                <label>专业代码</label>
                <input type="text" name="majorCode" value="${student.majorCode}">
            </div>
            <div class="form-row">
                <label>年级</label>
                <input type="text" name="grade" value="${student.grade}">
            </div>
            <div class="form-row">
                <label>家庭住址</label>
                <input type="text" name="address" value="${student.address}">
            </div>
            <div class="form-row">
                <label>联系手机</label>
                <input type="text" name="phone" value="${student.phone}">
            </div>
            <div class="form-row">
                <label>邮编</label>
                <input type="text" name="zipCode" value="${student.zipCode}">
            </div>

            <button type="submit" class="btn-submit">保存修改</button>
        </form>

        <a href="${pageContext.request.contextPath}/studentList" class="btn-back">← 返回列表</a>
    </div>
</body>
</html>