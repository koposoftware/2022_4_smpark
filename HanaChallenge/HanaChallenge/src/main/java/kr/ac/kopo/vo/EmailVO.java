package kr.ac.kopo.vo;

public class EmailVO {
	private String address;
    private String title;
    private String content;
    
	@Override
	public String toString() {
		return "EmailVO [address=" + address + ", title=" + title + ", content=" + content + "]";
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
    
	
    
}
