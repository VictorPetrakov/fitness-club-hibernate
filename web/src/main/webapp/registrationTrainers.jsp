<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored ="false" %>
<%@ page errorPage="401.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="https://www.rudebox.org.ua/favicon.ico"/>
    <link rel='stylesheet prefetch' href='https://www.rudebox.org.ua/demo/lessons/styles/style.css'>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylelogin.css">

</head>

<body class="login-page">
<nav class="colorlib-nav" role="navigation">
    <div class="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div id="colorlib-logo"><a href="index.jsp">FitnessCamp</a></div>
                </div>
                <div class="col-md-10 text-right menu-1">
                    <ul>
                        <li class="active"><a href="index.jsp">Главная</a></li>
                        <li class="has-dropdown">
                            <a href="classes.html">Группы</a>
                            <ul class="dropdown">
                                <li><a href="classes-single.html">Индивидуальные занаятия</a></li>
                                <li><a href="#">Кроссфит группа</a></li>
                                <li><a href="#">Группа бокса</a></li>
                                <li><a href="#">Фитнес группа</a></li>
                                <li><a href="#">Бодибилдинг</a></li>
                                <li><a href="#">Силовой экстрим</a></li>
                                <li><a href="#">Йога</a></li>
                                <li><a href="#">Степ-аэробика</a></li>
                            </ul>
                        </li>
                        <li><a href="schedule.jsp">Расписание</a></li>
                        <li><a href="about.html">Тренеры</a></li>
                        <li><a href="event.html">События</a></li>
                        <li><a href="blog.html">Блог</a></li>
                        <li><a href="contact.html">Контакты</a></li>
                        <c:if test="${sessionScope.statusAdmin == true || sessionScope.statusTrainer == true}">
                            <li><a href="trainerPage.jsp">Тренерская</a></li>
                        </c:if>
                        <c:if test="${sessionScope.statusAdmin == true}">
                            <li><a href=administration.jsp>Администрирование</a></li>
                        </c:if>
                        <c:if test="${sessionScope.userId == null}">
                            <li><a href="login.html">Войти</a></li>
                        </c:if>
                        <c:if test="${sessionScope.userId != null}">
                            <li><a href="logout">Выйти</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<main>

    <div class="login-block">
        <img src="images/1.png" alt="your foto"><br>

        <form action="registTrainers" method="post">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user ti-user"></i></span>
                    <input name="login" type="text" class="form-control" placeholder="Ваш логин">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user ti-user"></i></span>
                    <input name="firstname" type="text" class="form-control" placeholder="Ваше имя">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user ti-user"></i></span>
                    <input name="lastname" type="text" class="form-control" placeholder="Ваша фамилия">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user ti-user"></i></span>
                    <select name="group" class="form-control" >
                        <option value="none" hidden="">Название группы</option>
                        <option value="bodybuilding">Бодибилдинг</option>
                        <option value="crossfit">Кроссфит</option>
                        <option value="yoga">Йога</option>
                        <option value="group">Групповые занятия</option>
                        <option value="aerobics">Аэробика</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                    <input name="birthdate" type="date" class="form-control" value="2000-01-01"  min="1900-01-01" max="2020-12-31">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-at" aria-hidden="true"></i></span>
                    <input name="email" type="text" class="form-control" placeholder="Ваш email">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock ti-unlock"></i></span>
                    <input name="password" type="password" class="form-control" placeholder="Ваш пароль">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock ti-unlock"></i></span>
                    <input name="password" type="password" class="form-control" placeholder="Повторите Ваш пароль">
                </div>
            </div>

            <button class="btn btn-primary btn-block" type="submit">Регистрация</button>
            <div class="login-footer">
                <h6>или войдите с помощью</h6>
                <ul class="social-icons">
                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>

        </form>
    </div>

    <div class="login-links">
        <p class="text-center"> <a class="txt-brand" href="index.jsp"><font color=#29aafe>На главную</font></a></p>
    </div>

</main>

</body>
</html>
