<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>学生信息填报</title>
    <style>
        body { font-family: 'Microsoft YaHei', sans-serif; background: #f0f2f5; }
        .container { width: 800px; margin: 30px auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        .form-row { display: flex; margin-bottom: 15px; align-items: center; }
        .form-row label { width: 120px; text-align: right; margin-right: 10px; color: #555; }
        .form-row input, .form-row select { flex: 1; padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; font-size: 14px; }
        .form-row input:focus, .form-row select:focus { border-color: #1890ff; outline: none; }
        .required::after { content: " *"; color: red; }
        .btn-submit { display: block; width: 200px; margin: 20px auto; padding: 10px; background: #1890ff; color: #fff; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        .btn-submit:hover { background: #40a9ff; }
        .btn-back { display: block; width: 200px; margin: 10px auto; text-align: center; color: #1890ff; text-decoration: none; }
        .error { color: red; text-align: center; margin: 10px 0; }
        .success { color: green; text-align: center; margin: 10px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📝 学生信息填报</h2>

        <c:if test="${not empty errorMsg}">
            <div class="error">${errorMsg}</div>
        </c:if>
        <c:if test="${not empty successMsg}">
            <div class="success">${successMsg}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/addStudent" method="post">
            <div class="form-row">
                <label class="required">学号</label>
                <input type="text" name="studentNo" placeholder="请输入学号">
            </div>
            <div class="form-row">
                <label class="required">姓名</label>
                <input type="text" name="name" placeholder="请输入姓名">
            </div>
            <div class="form-row">
                <label class="required">性别</label>
                <select name="gender">
                    <option value="">请选择</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="form-row">
                <label>出生日期</label>
                <input type="date" name="birthday">
            </div>
            <div class="form-row">
                <label>政治面貌</label>
                <select name="political">
                    <option value="">请选择</option>
                    <option value="群众">群众</option>
                    <option value="共青团员">共青团员</option>
                    <option value="中共党员">中共党员</option>
                    <option value="预备党员">预备党员</option>
                </select>
            </div>
            <div class="form-row">
                <label>身份证号</label>
                <input type="text" name="idCard" placeholder="请输入身份证号">
            </div>
            <div class="form-row">
                <label>学院代码</label>
                <input type="text" name="collegeCode" placeholder="如：01">
            </div>
            <div class="form-row">
                <label>专业代码</label>
                <input type="text" name="majorCode" placeholder="如：0101">
            </div>
            <div class="form-row">
                <label>年级</label>
                <input type="text" name="grade" placeholder="如：2024">
            </div>
            <div class="form-row">
                <label>家庭住址</label>
                <input type="text" name="address" placeholder="请输入家庭住址">
            </div>
            <div class="form-row">
                <label>联系手机</label>
                <input type="text" name="phone" placeholder="请输入手机号">
            </div>
            <div class="form-row">
                <label>邮编</label>
                <input type="text" name="zipCode" placeholder="请输入邮编">
            </div>

            <button type="submit" class="btn-submit">提交保存</button>
        </form>

        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-back">← 返回首页</a>
    </div>
</body>
</html>