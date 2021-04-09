<%-- 
    Document   : createAnswer
    Created on : Feb 19, 2021, 5:11:13 PM
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
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER==null or sessionScope.LOGIN_USER.roleID!='AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <h1 style="align-content: center">Create Answer</h1>

        <p style="color: red">${requestScope.SUCCESS}</p>

        Question ID: <p>${requestScope.questionID}</p></br>
        Question Content: <p>${requestScope.questionContent}</p></br>
        Subject: <p>${requestScope.subject}</p></br>

        <p>----------------------------------------------------------------------------------</p>

        <h1 style="align-content: center"> Answer</h1>

        <form action="createAnswer">
            A: <input type="text" name="answerContentA" value="" required="" style="width: 500px"/>
            <select name="cmbStatusA" style="width: 200px">
                <option value="True">True</option>
                <option value="False">False</option>
            </select></br>

            B: <input type="text" name="answerContentB" value="" required="" style="width: 500px"/>
            <select name="cmbStatusB" style="width: 200px">
                <option value="True">True</option>
                <option value="False">False</option>
            </select></br>

            C: <input type="text" name="answerContentC" value="" required="" style="width: 500px"/>
            <select name="cmbStatusC" style="width: 200px">
                <option value="True">True</option>
                <option value="False">False</option>
            </select></br>

            D: <input type="text" name="answerContentD" value="" required="" style="width: 500px"/>
            <select name="cmbStatusD" style="width: 200px">
                <option value="True">True</option>
                <option value="False">False</option>
            </select></br>
            
            <input type="hidden" name="questionID" value="${requestScope.questionID}" />
            
            <input type="submit" value="Confirm Create" name="btnAction" style="width: 300px" />
        </form>

    </body>
</html>
