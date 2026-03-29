package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.springframework.core.SpringVersion;

public class NhisServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");

        String springVersion = SpringVersion.getVersion();  // Spring 버전 조회

        resp.getWriter().write("<h1>건강보험공단 테스트 페이지</h1>");
        resp.getWriter().write("<p>Spring Framework Version: " + springVersion + "</p>");
    }
}
