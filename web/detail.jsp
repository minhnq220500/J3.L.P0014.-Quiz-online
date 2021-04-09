<%-- 
    Document   : detail
    Created on : Feb 17, 2021, 6:39:06 PM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>

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

    </head>
    <body id="page-login-index" class="format-site  path-login safari dir-ltr lang-en yui-skin-sam yui3-skin-sam lms-undergrad-fpt-edu-vn pagelayout-login course-1 context-1 notloggedin content-only layout-option-langmenu">

        <!--B.O.Header-->
        <jsp:include page="header_page_style.jsp"></jsp:include>
            <!--E.O.Header-->

        Question ID: <p>${requestScope.QUESTION_ID}</p></br>
        Question Content: <p>${requestScope.QUESTION_CONTENT}</p></br>
        Subject ID: <p>${requestScope.SUBJECT_ID}</p></br>

        <c:if test="${not empty requestScope.LIST_ANSWER}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Answer ID</th>
                        <th>Answer Content</th>
                        <th>Status</th>
                        <th>Question ID</th>
                        <th>Update Answer</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="answer" varStatus="counter" items="${requestScope.LIST_ANSWER}">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${answer.answerID}</td>
                            <td>${answer.answerContent}</td>
                            <td>${answer.status}</td>
                            <td>${answer.questionID}</td>
                            <td><a href="answerDetail?answerID=${answer.answerID}&answerContent=${answer.answerContent}&status=${answer.status}&questionID=${requestScope.QUESTION_ID}&questionContent=${requestScope.QUESTION_CONTENT}&subjectID=${requestScope.SUBJECT_ID}">Update</a></td>
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

        <div class="paging">
            <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                <a id="${i}" class="page-link" href="paging?index=${i}&txtSearch=${requestScope.SEARCH}&subjectID=${requestScope.SUBJECT_ID}">${i}</a>
            </c:forEach>
        </div>

        <script>
            document.getElementById('${requestScope.INDEX}').style.color = "red";
        </script>
        <!-- số 1 có ID là 1 -->

        <!--B.O.Footer-->
        <jsp:include page="footer_page_style.jsp"></jsp:include>
        <!--E.O.Footer-->

    </body>
</html>
