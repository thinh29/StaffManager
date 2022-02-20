package com.StaffManager.Model;

import java.sql.Date;

public class StaffModel extends aAbstractModel<StaffModel> {
	private String fullName;
	private Date dateOfBirth;
	private String peopleId;
	private String address;
	private Long hometown;
	private Integer sex;
	private Long position;
	private String emailAddress;
	private Long basicSalary;
	private Integer dependent;
	private Long typeSt;
	private String phone;
	private String story;
	private Date beginWork;
	private Date finishWork;
	private String positionName;
	private String sexName;

	public Long getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(Long basicSalary) {
		this.basicSalary = basicSalary;
	}

	public Long getTypeSt() {
		return typeSt;
	}

	public void setTypeSt(Long typeSt) {
		this.typeSt = typeSt;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Long getPosition() {
		return position;
	}

	public void setPosition(Long position) {
		this.position = position;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public Date getBeginWork() {
		return beginWork;
	}

	public void setBeginWork(Date beginWork) {
		this.beginWork = beginWork;
	}

	public Date getFinishWork() {
		return finishWork;
	}

	public void setFinishWork(Date finishWork) {
		this.finishWork = finishWork;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getSexName() {
		return sexName;
	}

	public void setSexName(String sexName) {
		this.sexName = sexName;
	}

	public String getPeopleId() {
		return peopleId;
	}

	public void setPeopleId(String peopleId) {
		this.peopleId = peopleId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getHometown() {
		return hometown;
	}

	public void setHometown(Long hometown) {
		this.hometown = hometown;
	}

	public Integer getDependent() {
		return dependent;
	}

	public void setDependent(Integer dependent) {
		this.dependent = dependent;
	}
}
