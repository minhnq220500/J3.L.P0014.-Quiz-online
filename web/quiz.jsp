<%-- 
    Document   : quiz
    Created on : Feb 20, 2021, 3:38:43 PM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Quiz Page</title>

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

        <!--        <script type="text/javascript">
                    var Second = ${requestScope.time};//300
                    var min = Math.floor(Second / 60);//5p00s
        
        
                    function System() {
                        var count1 = document.getElementById("timeremain");
                        if ((Second % 60) == 0) {
                            min = min - 1;
                        }
        
                        count1.value = (min) + "minute" + ((Second - 1) % 60) + "second";
                        document.getElementById("time").value = (min) + "minute" + ((Second - 1) % 60) + "second";
                        Second = Second - 1;
                        if ((min * 60) == 0 && Second == 0) {
                            Helicop();
                        }
                        setTimeout("System()", 1000);
        
                    }
                    function Helicop()
                    {
                        window.location.replace("grading");// TIME OUT RES TO GRADE CONTROLLER
                    }
                </script>-->

        <c:if test="${sessionScope.LOGIN_USER==null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <jsp:useBean id="dao" class="minhnq.daos.AnswerDAO" scope="request"></jsp:useBean>

        </head>
        <body onload="System()" id="page-login-index" class="format-site  path-login safari dir-ltr lang-en yui-skin-sam yui3-skin-sam lms-undergrad-fpt-edu-vn pagelayout-login course-1 context-1 notloggedin content-only layout-option-langmenu">

            <!--B.O.Header-->
        <jsp:include page="header_page_style.jsp"></jsp:include>
            <!--E.O.Header-->

            <!--            Time left: <input type="text" id="timeremain" disabled="" />-->

            <div id="clock" class="area">Time left</div>

            <script>
                // Set the date we're counting down to
                var countDownDate = new Date('<c:out value="${sessionScope.QUIZ_TIME}"/>').getTime();

                // Update the count down every 1 second
                var x = setInterval(function () {

                    // Get today's date and time
                    var now = new Date().getTime();

                    // Find the distance between now and the count down date
                    var distance = countDownDate - now;

                    // Time calculations for days, hours, minutes and seconds
                    //                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    // Output the result in an element with id="demo"
                    document.getElementById("clock").innerHTML = hours + "h " + minutes + "m " + seconds + "s ";

                    // If the count down is over, write some text 
                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("clock").innerHTML = "Time's up";
                        document.getElementById("Submit").click();
                    }
                }, 1000);
        </script>

        <p>Question: ${requestScope.QUESTION.questionContent}</p></br> 

        <c:set var="questionID" value="${requestScope.QUESTION.questionID}"/>

        <form action="grading">

            <c:forEach var="answer" items="${dao.getListAnswerByQuestionID(questionID) }">
                <p> <input type="radio" name="radAnswerID" value="${answer.answerID}" 

                           <c:forEach var="studentAnswer" items="${sessionScope.LIST_ANSWER}">
                               <c:if test="${studentAnswer.answerID == answer.answerID}"> 
                                   checked="true" 
                               </c:if> 
                           </c:forEach>
                           />
                    
                    ${answer.answerContent}
                </p>
            </c:forEach>

            <input type="hidden" name="questionID" value="${requestScope.QUESTION.questionID}" />
            <input type="hidden" name="subjectID" value="${requestScope.SUBJECT_ID}" />
            <input type="hidden" name="index" value="${requestScope.index}" />

            <input type="submit" value="Next" name="btnSubmit" /></br>

        </form>

        <form action="total">
            <input type="hidden" name="subjectID" value="${requestScope.SUBJECT_ID}" />
            <input type="submit" value="Finish Quiz" name="btnSubmit" onclick="return confirm('Are you sure want to finsh this quiz?')"/>
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

        <p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>

        <!-- paging -->    

        <c:if test="${sessionScope.LOGIN_USER!=null and sessionScope.LOGIN_USER.roleID =='SD'}">
            <div class="paging">
                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                    <a id="${i}" href="takeQuiz?index=${i}&subjectID=${requestScope.SUBJECT_ID}">${i}</a>
                </c:forEach>
            </div>
        </c:if>

        <!--B.O.Footer-->
        <jsp:include page="footer_page_style.jsp"></jsp:include>
        <!--E.O.Footer-->

    </body>
</html>
