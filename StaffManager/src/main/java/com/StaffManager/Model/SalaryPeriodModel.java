package com.StaffManager.Model;

public class SalaryPeriodModel extends aAbstractModel<SalaryPeriodModel> {
	private String name;
	private String month;
	private String year;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
}
