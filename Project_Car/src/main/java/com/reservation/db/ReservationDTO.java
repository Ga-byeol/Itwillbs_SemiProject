package com.reservation.db;

public class ReservationDTO {
	private int res_num;
	private String res_car_num; // CarDTO
	private String res_stime;
	private int res_time;
	private int return_car;
	private int user_num; // UserDTO
	private int navi;
	private int sheet;
	private int hipass;
	
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_car_num() {
		return res_car_num;
	}
	public void setRes_car_num(String res_car_num) {
		this.res_car_num = res_car_num;
	}
	public String getRes_stime() {
		return res_stime;
	}
	public void setRes_stime(String res_stime) {
		this.res_stime = res_stime;
	}
	public int getRes_time() {
		return res_time;
	}
	public void setRes_time(int res_time) {
		this.res_time = res_time;
	}
	public int getReturn_car() {
		return return_car;
	}
	public void setReturn_car(int return_car) {
		this.return_car = return_car;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getNavi() {
		return navi;
	}
	public void setNavi(int navi) {
		this.navi = navi;
	}
	public int getSheet() {
		return sheet;
	}
	public void setSheet(int sheet) {
		this.sheet = sheet;
	}
	public int getHipass() {
		return hipass;
	}
	public void setHipass(int hipass) {
		this.hipass = hipass;
	}
}
