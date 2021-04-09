<%-- 
    Document   : home
    Created on : Jan 30, 2021, 7:03:13 PM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz online</title>

        <link rel="shortcut icon" href="http://lms-undergrad.fpt.edu.vn/theme/image.php/eguru/theme/1596867874/favicon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="http://lms-undergrad.fpt.edu.vn/theme/yui_combo.php?rollup/3.17.2/yui-moodlesimple-min.css" />
        <script id="firstthemesheet" type="text/css">/** Required in order to fix style inclusion problems in IE with YUI **/</script>
        <link rel="stylesheet" type="text/css" href="http://lms-undergrad.fpt.edu.vn/theme/styles.php/eguru/1596867874/all" />
        <link rel="stylesheet" type="text/css" href="http://lms-undergrad.fpt.edu.vn/auth/googleoauth2/style.css" />
        <script type="text/javascript"></script>

        <style type="text/css">
            #site-footer { padding: 0px !important; }
        </style>

        <c:if test="${sessionScope.LOGIN_USER==null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <jsp:useBean id="dao" class="minhnq.daos.SubjectDAO" scope="request"></jsp:useBean>

        </head>
        <body id="page-login-index" class="format-site  path-login safari dir-ltr lang-en yui-skin-sam yui3-skin-sam lms-undergrad-fpt-edu-vn pagelayout-login course-1 context-1 notloggedin content-only layout-option-langmenu">

            <!--B.O.Header-->
        <jsp:include page="header_page_style.jsp"></jsp:include>
            <!--E.O.Header-->

        <c:if test="${sessionScope.LOGIN_USER!=null and sessionScope.LOGIN_USER.roleID =='AD'}">

            <c:if test="${not empty requestScope.LIST_QUESTION}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Question ID</th>
                            <th>Question Content</th>
                            <th>Subject ID</th>
                            <th>Status</th>
                            <th>Update Question</th>
                            <th>Delete Question</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="question" varStatus="counter" items="${requestScope.LIST_QUESTION}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${question.questionID}</td>
                                <td> <a href="questionToAnswer?questionID=${question.questionID}&subjectID=${question.subject}&questionContent=${question.questionContent}">${question.questionContent}</a></td>
                                <td>${question.subject}</td>
                                <td>
                                    <select name="cbkStatus">
                                        <option >True</option>
                                        <option ${question.status=='False'? "selected":""} >False</option>
                                    </select>
                                </td>
                                <td> <a href="questionDetail?questionContent=${question.questionContent}&subjectID=${question.subject}&questionID=${question.questionID}&status=${question.status}">Update</a></td>
                                <td> <a href="deleteQuestion?questionID=${question.questionID}" onclick="return confirm('Are you sure want to remove this question?')" >Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>
        </c:if>    

        <c:if test="${sessionScope.LOGIN_USER!=null and sessionScope.LOGIN_USER.roleID =='SD'}">
            
            <h1>Choose subject to take quiz</h1></br>
            
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                        <th>Take Quiz</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="subject" varStatus="counter" items="${dao.listSubject}">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${subject.subjectID}</td>
                            <td>${subject.subjectName}</td>
                            <td><a href="takeQuiz?subjectID=${subject.subjectID}&index=1">Start</a></td>
<!--                            <td><a href="quiz.jsp">Start</a></td>-->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>

        <script>
            $(function () {
                var e1 = $("#loginerrormessage").text();
                if (e1.length > 0)
                {
                    $("#lemsg").html(e1);
                    $("#lemsg").show();
                }
                $("#loginbtn").click(function () {
                    var uname = $("#login1 input[name=username]").val();
                    $("#login input[name=username]").val(uname);

                    var pwd = $("#login1 input[name=password]").val();
                    $("#login input[name=password]").val(pwd);
                    $("#login").submit();
                });
            });
        </script>

        <!-- paging -->    

        <c:if test="${sessionScope.LOGIN_USER!=null and sessionScope.LOGIN_USER.roleID =='AD'}">
            <div class="paging">
                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                    <a id="${i}" class="page-link" href="paging?index=${i}&txtSearch=${requestScope.SEARCH}&subjectID=${requestScope.SUBJECT_ID}">${i}</a>
                </c:forEach>
            </div>
        </c:if>

        <script>
            document.getElementById('${requestScope.INDEX}').style.color = "red";
        </script>
        <!-- số 1 có ID là 1 -->

        <!--B.O.Footer-->
        <jsp:include page="footer_page_style.jsp"></jsp:include>
        <!--E.O.Footer-->

    </body>
</html>
