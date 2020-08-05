package kr.co.min.beans;

public class OnetoOneBean {

	private int Num;
	private String Subject;
	private String Eamil;
	private String phone;
	private String Reg_date;
	private String Content;

	public int getNum() {
		return Num;
	}

	public void setNum(int num) {
		Num = num;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getEamil() {
		return Eamil;
	}

	public void setEamil(String eamil) {
		Eamil = eamil;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReg_date() {
		return Reg_date;
	}

	public void setReg_date(String reg_date) {
		Reg_date = reg_date;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

}