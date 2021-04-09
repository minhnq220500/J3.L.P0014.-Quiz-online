<%-- 
    Document   : header_page_style
    Created on : Jan 30, 2021, 7:23:02 PM
    Author     : Ticket 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<header id="header">



    <div class="header-main">
        <div class="container-fluid">
            <div class="header-logo">
                <a href="home">
                    <img src="//lms-undergrad.fpt.edu.vn/pluginfile.php/1/theme_eguru/logo/1596867874/lo_fug.jpg" width="183" height="67" alt="Eguru">
                </a>
            </div>

            <div class="custom-menu hidden-desktop">
                <ul>
                    <li>
                        <a href="#">Courses</a>
                    </li>
                    <li class="no-divider">
                        <a href="#">Log in</a>
                    </li>
                </ul>
            </div>
            <div class="custom-menu visible-desktop">
                <ul>
                    <c:if test="${sessionScope.DANG_LAM_QUIZ_DO_NHA == null}">
                        <li>
                            <a href="home">Home</a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.LOGIN_USER!=null and sessionScope.LOGIN_USER.roleID =='AD'}">
                        <c:forEach var="subject" items="${sessionScope.LIST_SUBJECT}">
                            <li class="list-group-item text-white ">
                                <a href="searchBySubject?subjectID=${subject.subjectID}&index=1">
                                    ${subject.subjectName}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>

                    <!--                    <li>
                                            <a href="#">Courses</a>
                                        </li>-->

                    <c:if test="${sessionScope.LOGIN_USER!=null and sessionScope.LOGIN_USER.roleID =='AD'}">
                        <li>
                            <a href="createQuestion.jsp">Create Question</a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.LOGIN_USER!=null}">
                        <li>
                            <a href="#">Hello ${sessionScope.LOGIN_USER.name}</a>
                        </li>
                        <li class="no-divider">
                            <a href="logout">Logout</a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.LOGIN_USER==null}">
                        <li class="no-divider">
                            <a href="#">Log in</a>
                        </li>
                    </c:if>



                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="header-menubar">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a data-target="#Mainmenu" data-toggle="collapse" class="btn btn-navbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a href="#" class="brand" style="display: none;">Eguru</a>
                    <c:if test="${sessionScope.LOGIN_USER.roleID =='AD'}">

                        <div id="Mainmenu" class="nav-collapse collapse navbar-responsive-collapse">
                            <div class="custom-nav-search">
                                <form action="searchByName" method="get">
                                    <div class="fields-wrap">
                                        <input type="text" placeholder="Search Question" name="txtSearch" value="${requestScope.SEARCH}" required="">
                                        <input type="hidden" name="index" value="1" />
                                        <div class="btn-search fa fa-search"><input type="submit" value="Search"></div>
                                    </div>
                                </form> 

                            </div>
                            <div class="custom-nav-search">
                                <form action="searchByStatus" method="get">
                                    <select name="cmbStatus" style="width: 200px"></br>
                                        <option ${requestScope.TRUE} value="true">True</option>
                                        <option ${requestScope.FALSE} value="false">False</option>
                                    </select>
                                    <div class="fields-wrap">

                                        <input type="hidden" name="index" value="1" />
                                        <div class="btn-search fa fa-search"><input type="submit" value="Search"></div>
                                    </div>
                                </form> 

                            </div>
                        </div>

                    </c:if>
                </div>
            </div>
        </div>
    </div>

</header>
