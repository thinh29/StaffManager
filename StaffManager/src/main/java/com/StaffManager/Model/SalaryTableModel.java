package com.StaffManager.Model;

public class SalaryTableModel extends aAbstractModel<SalaryTableModel> {
	private String fullName;
	private Long staffId;
	private Long positionId;
	private Long periodId;
	private Long typeId;
	private Float workDay;
	private	Float overtime;
	private Long bonus;
	private Long punish;
	private Long advance;
	private Long insurance;
	private Long tax;
	private Long total;
	private Integer settlement;
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Long getStaffId() {
		return staffId;
	}
	public void setStaffId(Long staffId) {
		this.staffId = staffId;
	}
	public Long getPositionId() {
		return positionId;
	}
	public void setPositionId(Long positionId) {
		this.positionId = positionId;
	}
	public Long getPeriodId() {
		return periodId;
	}
	public void setPeriodId(Long periodId) {
		this.periodId = periodId;
	}
	public Long getTypeId() {
		return typeId;
	}
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}
	public Float getWorkDay() {
		return workDay;
	}
	public void setWorkDay(Float workDay) {
		this.workDay = workDay;
	}
	public Float getOvertime() {
		return overtime;
	}
	public void setOvertime(Float overtime) {
		this.overtime = overtime;
	}
	public Long getBonus() {
		return bonus;
	}
	public void setBonus(Long bonus) {
		this.bonus = bonus;
	}
	public Long getPunish() {
		return punish;
	}
	public void setPunish(Long punish) {
		this.punish = punish;
	}
	public Long getAdvance() {
		return advance;
	}
	public void setAdvance(Long advance) {
		this.advance = advance;
	}
	public Long getInsurance() {
		return insurance;
	}
	public void setInsurance(Long insurance) {
		this.insurance = insurance;
	}
	public Long getTax() {
		return tax;
	}
	public void setTax(Long tax) {
		this.tax = tax;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public Integer getSettlement() {
		return settlement;
	}
	public void setSettlement(Integer settlement) {
		this.settlement = settlement;
	}
}
