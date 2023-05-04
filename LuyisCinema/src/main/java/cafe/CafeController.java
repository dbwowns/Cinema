package cafe;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cafe.dao.CafeDAO;
import cafe.dto.CafeDTO;
import member.MemberDTO;



public class CafeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//클라이언트의 요청 주소처리
		String url=request.getRequestURL().toString();
		//컨텍스트 패스
		String context=request.getContextPath();
		//dao 인스턴스 생성
		CafeDAO dao=new CafeDAO();
		if(url.indexOf("list.do")!= -1) {//메인홈페이지로 이동
			String page="/cafe/main.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩(주소가 바뀌지않는다)
		}else if (url.indexOf("cinema.do") != -1) {//시네마 페이지로 이동
			 HttpSession session = request.getSession();
			    if (session.getAttribute("userid") != null) {//로그인되어 있으면 
			        String page = "/cafe/login_ok.jsp";
			        RequestDispatcher rd = request.getRequestDispatcher(page);
			        rd.forward(request, response);//포워딩(주소가 바뀌지않는다)
			    } else {//로그인되어 있지 않으면
			        String page = "/cafe/cinema.jsp";
			        RequestDispatcher rd = request.getRequestDispatcher(page);
			        rd.forward(request, response);//포워딩(주소가 바뀌지않는다)
			    }
		
//			//바꾸기전 
			    //시네마페이지로 이동
//			String page="/cafe/cinema.jsp";
//			RequestDispatcher rd = request.getRequestDispatcher(page);
//			rd.forward(request, response);//포워딩(주소가 바뀌지않는다)
		}else if(url.indexOf("signup.do") != -1) { //회원가입창으로 이동
			String page="/cafe/signup.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩(주소가 바뀌지않는다)
		}else if(url.indexOf("join.do") != -1) { //회원등록(회원가입화면)
			String userid =request.getParameter("userid");
			String passwd =request.getParameter("passwd");
			String name = request.getParameter("name");
			String email =request.getParameter("email");
			String tel = request.getParameter("tel");
			CafeDTO dto =new CafeDTO();
			System.out.println("시스템이상 무");
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setTel(tel);
			dao.insert(dto);//추가
			System.out.println("추가완료");
		}else if(url.indexOf("loginpage.do") != -1) { //로그인화면
			String page="/cafe/login.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩(주소가 바뀌지않는다)
		}else if(url.indexOf("login.do") != -1) { //로그인 처리
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			CafeDTO dto = new CafeDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result =dao.loginCheck(dto);
			System.out.println(result);
			String page= "/cafe/login.jsp";
			if(!result.equals("로그인 실패")) { //로그인 성공
				//세션 객체 생성
				HttpSession session=request.getSession();
				//세션에 값 저장
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page ="/cafe/login_ok.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else {//로그인 실패
				response.sendRedirect(request.getContextPath()+page+"?message=error");
			}
		}else if(url.indexOf("logout.do") != -1	) {
			 //로그아웃 처리
			//세션 객체 생성
			HttpSession session=request.getSession();
			//세션을 초기화
			session.invalidate();
			//로그인 페이지로 이동
		//	String page = request.getContextPath()+"/cafe/cinema.jsp?message=logout";
			String page = request.getContextPath()+"/cafe_servlet/cinema.do?message=logout";
			response.sendRedirect(page);
		
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
