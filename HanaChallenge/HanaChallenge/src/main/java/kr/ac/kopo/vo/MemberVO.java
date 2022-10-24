package kr.ac.kopo.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String jumin1;
	private String jumin2;
	private String email;
	private String tel;
	private String address_main;
	private String address_detail;
	private String zipcode;
	private String userType; //default = 'U'(유저) 관리자는 'S'
	private String joinDate;
	private String redirectPath;
	private int member_lv;
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", jumin1=" + jumin1 + ", jumin2="
				+ jumin2 + ", email=" + email + ", tel=" + tel + ", address_main=" + address_main + ", address_detail="
				+ address_detail + ", zipcode=" + zipcode + ", userType=" + userType + ", joinDate=" + joinDate
				+ ", redirectPath=" + redirectPath + ", member_lv=" + member_lv + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress_main() {
		return address_main;
	}
	public void setAddress_main(String address_main) {
		this.address_main = address_main;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getRedirectPath() {
		return redirectPath;
	}
	public void setRedirectPath(String redirectPath) {
		this.redirectPath = redirectPath;
	}
	public int getMember_lv() {
		return member_lv;
	}
	public void setMember_lv(int member_lv) {
		this.member_lv = member_lv;
	}
		
}
