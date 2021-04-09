<%-- 
    Document   : total
    Created on : Feb 23, 2021, 2:35:27 PM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Grade Review Page</title>

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

        <jsp:useBean id="dao" class="minhnq.daos.AnswerDAO" scope="request"></jsp:useBean>

        </head>
        <body id="page-login-index" class="format-site  path-login safari dir-ltr lang-en yui-skin-sam yui3-skin-sam lms-undergrad-fpt-edu-vn pagelayout-login course-1 context-1 notloggedin content-only layout-option-langmenu">

            <!--B.O.Header-->
        <jsp:include page="header_page_style.jsp"></jsp:include>
            <!--E.O.Header-->
            <h1>Correct Answer: ${requestScope.CORRECT}</h1>
            <h1>Total grade: ${requestScope.GRADE}</h1>

        <form action="return">
            <input type="submit" value="Return To Home Page" name="btnSubmit" />
        </form>

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

        <!--B.O.Footer-->
        <jsp:include page="footer_page_style.jsp"></jsp:include>
        <!--E.O.Footer-->

    </body>
</html>
