package cinemaboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import cinemaboard.dto.CinemaBoardDTO;
import sqlmap.MybatisManager;

public class CinemaBoardDAO {
	public List<CinemaBoardDTO> getList(String searchkey, String search,int start,int end){
		//mybatis 실행객체
		SqlSession session=MybatisManager.getInstance().openSession();
		List<CinemaBoardDTO> list=null;
		if(searchkey.equals("name_content")) { //이름+내용
			list=session.selectList("cbListAll", "%"+search+"%");
		}else {
			Map<String,Object> map=new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("cbList",map);
		}

		//줄바꿈, 특수문자 처리기능 추가
		for(CinemaBoardDTO dto : list) {
			String content=dto.getContent();
			//태그처리
			content=content.replace("<", "&lt");
			content=content.replace(">", "&gt");
			//줄바꿈 처리
			content=content.replace("\n", "<br>");
			//공백 2문자이상 처리
			content=content.replace("  ", "&nbsp;&nbsp;");
			//검색키워드 색상 처리
			if(!searchkey.equals("name")) {
				content=content.replace(search, "<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content);
		}
		session.close();
		return list;
	}
	
	
	public int cinemaCount() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("cinemaboard.cinemaCount");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
		
//		public List<CinemaBoardDTO> cinemaList(int start, int end){
//			SqlSession session=MybatisManager.getInstance().openSession();
//			Map<String,Object> map=new HashMap<>();
//			map.put("start", start);
//			map.put("end", end);
//			System.out.println(map);
//			
//			List<CinemaBoardDTO> items=session.selectList("cinemaboard.cinemaList", map);
//			session.close();
//			return items;
//		}//여기까지
	
	
	
	
	
	
	public void cbInsert(CinemaBoardDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("cbInsert", dto);
		session.commit();
		session.close();
	}

	//비밀번호 체크(idx:게시물 번호, passwd:사용자의 비번입력값)
	public boolean passwdCheck(int idx, String passwd) {
		boolean result=false;
		SqlSession session=MybatisManager.getInstance().openSession();
		CinemaBoardDTO dto=new CinemaBoardDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		//레코드가 1개 리턴
		int count=session.selectOne("passwdCheck", dto);
		session.close();
		if(count==1) {
			result=true;
		}
		return result;
	}
	
	//게시물 상세정보
	public CinemaBoardDTO cbDetail(int idx) {
		CinemaBoardDTO dto=new CinemaBoardDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("cbDetail", idx);
		session.close();
		return dto;
	}

	public void cbUpdate(CinemaBoardDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("cinemaboard.cbUpdate", dto);
		session.commit();
		session.close();		
	}

	public void cbDelete(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("cinemaboard.cbDelete", idx);
		session.commit();
		session.close();
	}

	




}
