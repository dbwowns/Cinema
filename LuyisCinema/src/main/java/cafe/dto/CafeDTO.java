package cafe.dto;

public class CafeDTO {
	private String userid;
	private String passwd; 
	private	String name; 
	private String tel;
	private String email;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "CafeDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel + ", email="
				+ email + "]";
	}
	public CafeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CafeDTO(String userid, String passwd, String name, String tel, String email) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}
	
	
	
}
