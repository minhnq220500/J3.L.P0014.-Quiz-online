<%-- 
    Document   : updateAnswer
    Created on : Feb 18, 2021, 4:14:48 PM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Answer Page</title>
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
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER==null or sessionScope.LOGIN_USER.roleID!='AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <h1 style="align-content: center">Update Answer</h1>

        Answer ID: ${requestScope.answerID}</br>

        <form action="updateAnswer">
            <input type="hidden" name="answerID" value="${requestScope.answerID}" />
            
            Answer Content: <input type="text" name="answerContent" value="${requestScope.answerContent}" required="" style="width: 500px"/></br>

            Status:
            <select name="cmbStatus" style="width: 200px">
                <option ${requestScope.TRUE} value="True">True</option>
                <option ${requestScope.FALSE} value="False">False</option>
            </select></br>
            
            <input type="hidden" name="questionID" value="${requestScope.questionID}" />
            <input type="hidden" name="questionContent" value="${requestScope.questionContent}" />
            <input type="hidden" name="subjectID" value="${requestScope.subjectID}" />

            <input type="submit" value="Confirm Update" name="btnAction" style="width: 300px" onclick="return confirm('Are you sure want to update this answer?')"/>
        </form>

        <form action="questionToAnswer">
            <input type="hidden" name="answerID" value="${requestScope.answerID}" />
            <input type="hidden" name="answerContent" value="${requestScope.answerContent}" />
            <input type="hidden" name="status" value="${requestScope.status}" />
            <input type="hidden" name="questionID" value="${requestScope.questionID}" />
            <input type="hidden" name="questionContent" value="${requestScope.questionContent}" />
            <input type="hidden" name="subjectID" value="${requestScope.subjectID}" />
            
            <input type="submit" value="Return Detail Page" name="btnAction" style="width: 300px" />
        </form>   

    </body>
</html>
