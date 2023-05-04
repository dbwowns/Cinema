package cinemaboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinemaboard.dao.CinemaBoardDAO;
import cinemaboard.dto.CinemaBoardDTO;
import page.Pager;


@WebServlet("/cinemaboard_servlet/*")
public class CinemaBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String uri=request.getRequestURI();
		System.out.println(uri);
		CinemaBoardDAO dao=new CinemaBoardDAO();
		if(uri.indexOf("list.do") != -1) {
			//여기추가
			 //안되면 빼버리기
			int count=dao.cinemaCount();//레코드 갯수 계산
			int curPage=1; //null일때는 기본값 1을 줌
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count,curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			//List<CinemaBoardDTO> list=dao.cinemaList(start,end);
			//	request.setAttribute("list", list);
			
			//검색옵션과 검색키워드
			String searchkey=request.getParameter("searchkey");
			String search=request.getParameter("search");
			//검색옵션, 검색키워드에 기본값 할당
			if(searchkey==null) searchkey="name";
			if(search==null) search="";
			System.out.println("searchkey:"+searchkey);
			System.out.println("search:"+search);
			
			List<CinemaBoardDTO> items=dao.getList(searchkey,search,start,end);
			request.setAttribute("list", items);
			request.setAttribute("count", items.size());//레코드 갯수
			request.setAttribute("page", pager);//페이지 네비게이션에 필요한 정보 전달
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			//git에 추가 테스트
			
			String page="/cinemaboard/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insert.do") != -1) {
			String name=request.getParameter("name");
			String title=request.getParameter("title");
			String passwd=request.getParameter("passwd");
			String content=request.getParameter("content");
			CinemaBoardDTO dto=new CinemaBoardDTO();
			dto.setName(name);
			dto.setTitle(title);
			dto.setPasswd(passwd);
			dto.setContent(content);
			dao.cbInsert(dto);//dao에 레코드 추가 요청
			//방명록 목록 갱신
			String url="/cinemaboard_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}else if(uri.indexOf("passwd_check.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String passwd=request.getParameter("passwd");
			System.out.println("게시물 번호 :" + idx);
			System.out.println("비번 : " + passwd);
			boolean result=dao.passwdCheck(idx, passwd);
			//비번이 맞으면 true, 틀리면 false 리턴
			System.out.println("결과 : " + result);
			String url="";
			if(result) {
				url="/cinemaboard/edit.jsp";//수정용 페이지
				//게시물 내용을 dto로 리턴받음
				CinemaBoardDTO dto=dao.cbDetail(idx);
				//request 영역에 저장
				request.setAttribute("dto", dto);
			}else {
				url="/cinemaboard_servlet/list.do";
			}
			//화면이동
			RequestDispatcher rd=request.getRequestDispatcher(url);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String name=request.getParameter("name");
			String title=request.getParameter("title");
			String passwd=request.getParameter("passwd");
			String content=request.getParameter("content");
			CinemaBoardDTO dto=new CinemaBoardDTO();
			dto.setIdx(idx);
			dto.setName(name);
			dto.setTitle(title);
			dto.setPasswd(passwd);
			dto.setContent(content);
			
			dao.cbUpdate(dto);
			//방명록 목록 갱신
			String url="/cinemaboard_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}else if(uri.indexOf("delete.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			//레코드 삭제
			dao.cbDelete(idx);
			//방명록 목록 갱신
			String url="/cinemaboard_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
