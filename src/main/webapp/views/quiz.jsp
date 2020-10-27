<%@ page import="java.util.Random" %>
<%@ page import="models.Quiz" %><%--
  Created by IntelliJ IDEA.
  User: nhanxautrai
  Date: 10/15/20
  Time: 2:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WAP Lab13</title>
</head>
<body>
    <h1>The Number Quiz</h1>
    <form method='get'>
        <% Quiz quiz = ((Quiz) session.getAttribute("quiz")); %>
        <p>Your current score is <%=quiz.getScores()%></p>
        <% if (quiz.getAnswerTimes() < 5) { %>
            <p>Guess the next number in the sequence.</p>
            <%
                Random random = new Random();
                int index = random.nextInt(quiz.getQuestions().length);
                String randomQuestion = quiz.getQuestions()[index];
            %>
            <p><%= randomQuestion %></p>
            <p><input type='hidden' name='question' readonly value='<%=randomQuestion%>' /></p>
            <p>Your answer: <input type='number' required name='answer' /></p>
            <p><input type='submit' /></p>
        <% } else { %>
            <p>You have completed the Number Quiz, with a score of <%=quiz.getScores()%> out of 5.</p>
            <p><a href='quiz?is_new=true'>Play again?</a></p>
        <% }%>
    </form>
</body>
</html>
