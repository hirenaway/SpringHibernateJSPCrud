package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Member;
import com.dao.MemberDao;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	ApplicationContext context = new ClassPathXmlApplicationContext("application.xml");
	Member member = null;
	MemberDao dao = context.getBean("memberDao", MemberDao.class);

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");

		if(action.equalsIgnoreCase("Register") || action.equalsIgnoreCase("Update")) {
			saveOrUpdate(new Member(), action, request, response);
		} else if (action.equalsIgnoreCase("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			member = dao.getMember(id);
			request.setAttribute("member", member);
			request.getRequestDispatcher("insert.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			member = dao.getMember(id);
			request.getRequestDispatcher("display.jsp").forward(request, response);
		}
	}

	protected void saveOrUpdate(Member member, String action,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(action.equalsIgnoreCase("Update")) {
			member.setMemberId(Integer.parseInt(request.getParameter("id")));
		}
		member.setFirstName(request.getParameter("firstName"));
		member.setLastName(request.getParameter("lastName"));
		member.setEmail(request.getParameter("email"));
		member.setMobile(request.getParameter("mobile"));
		dao.addUpdateMember(member);
		response.sendRedirect("display.jsp");
	}
}
