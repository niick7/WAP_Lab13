package controllers;

import models.Quiz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Quiz quiz = new Quiz();
        if(session.getAttribute("quiz") == null) {
            session.setAttribute("quiz", quiz);
        } else {
            // Reset quiz when click from index.html
            if (req.getParameter("is_new") != null) {
                session.setAttribute("quiz", quiz);
            } else {
                quiz = ((Quiz) session.getAttribute("quiz"));
                String answerParams = req.getParameter("answer");
                if(answerParams != null && answerParams.trim() != "") {
                    String question = req.getParameter("question");
                    Integer answer = Integer.parseInt(answerParams);
                    quiz.setAnswerResult(question, answer);
                }
            }
        }

        req.getRequestDispatcher("/views/quiz.jsp").forward(req, resp);
    }
}
