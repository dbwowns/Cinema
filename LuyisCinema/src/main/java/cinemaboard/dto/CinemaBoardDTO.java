package cinemaboard.dto;

import java.util.Date;

public class CinemaBoardDTO {
	private	int idx; //게시물번호
	private	String name;  //작성자
	private	 String passwd;  //비밀번호   
	private	 String title; //제목   
	private	 String content; //내용    
	private	 Date post_date; //작성일자  
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "CinemaBoardDTO [idx=" + idx + ", name=" + name + ", passwd=" + passwd + ", title=" + title
				+ ", content=" + content + ", post_date=" + post_date + "]";
	}

	
	
}
