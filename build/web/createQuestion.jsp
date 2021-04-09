<%-- 
    Document   : createQuestion
    Created on : Feb 19, 2021, 9:17:33 AM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Question And Answer Page</title>

        <style>
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=number], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type=submit] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            div {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
        </style>

        <jsp:useBean id="dao" class="minhnq.daos.SubjectDAO" scope="request"></jsp:useBean>
        
        </head>
        <body>
        <c:if test="${sessionScope.LOGIN_USER==null or sessionScope.LOGIN_USER.roleID!='AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <h1 style="align-content: center">Create Question</h1>

        <form action="createQuestion">
            Question ID: <input type="text" name="questionID" value="" required="" style="width: 500px" /></br>
            <p style="color: red">${requestScope.MESSAGE}</p>
            
            Question Content: 
            <textarea name="questionContent" rows="4" cols="20">
            </textarea>

            Subject ID: 
            <select name="cmbSubject" style="width: 200px">
                <c:forEach var="subject" items="${dao.listSubject}">
                    <option value="${subject.subjectID}">${subject.subjectName}</option>
                </c:forEach>
            </select></br>

            <input type="submit" value="Confirm Create" name="btnAction" style="width: 300px" />
        </form>
        
        <form action="home">
            <input type="submit" value="Return Home Page" name="btnAction" style="width: 300px" />
        </form>    


    </body>
</html>
