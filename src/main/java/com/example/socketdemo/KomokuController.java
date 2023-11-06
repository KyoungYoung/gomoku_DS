package com.example.socketdemo;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet("/setStone.do")
public class KomokuController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Board board;

    public void init(ServletConfig config) throws ServletException {
        board = new Board();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("실행");
        String stone = request.getParameter("stone");
        String row = request.getParameter("row");
        String col = request.getParameter("col");
        board.setStone(stone, row, col);
        boolean isVictory = board.check(stone);


        if(isVictory) {
            System.out.println("이겨따");
            board = new Board();
            response.getWriter().write("victory");
        }
    }

}