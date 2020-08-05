package kr.co.min.beans;

public class ReservationBean {

	private int custno;
	private int salenol;
	private int pcost;
	private int amount;
	private int price;
	private String pcode;
	private String carsale_img;
	private String carsale_name;
	private String sdate;

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getSalenol() {
		return salenol;
	}

	public void setSalenol(int salenol) {
		this.salenol = salenol;
	}

	public int getPcost() {
		return pcost;
	}

	public void setPcost(int pcost) {
		this.pcost = pcost;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getCarsale_img() {
		return carsale_img;
	}

	public void setCarsale_img(String carsale_img) {
		this.carsale_img = carsale_img;
	}

	public String getCarsale_name() {
		return carsale_name;
	}

	public void setCarsale_name(String carsale_name) {
		this.carsale_name = carsale_name;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

}
