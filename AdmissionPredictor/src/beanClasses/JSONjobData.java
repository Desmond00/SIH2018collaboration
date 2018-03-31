package beanClasses;

public class JSONjobData {
	private String instituteName, branch;
	public String getInstituteName() {
		return instituteName;
	}
	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getDGPA() {
		return DGPA;
	}
	public void setDGPA(int dGPA) {
		DGPA = dGPA;
	}
	public int getPlaced() {
		return placed;
	}
	public void setPlaced(int placed) {
		this.placed = placed;
	}
	public int getInstitute_id() {
		return institute_id;
	}
	public void setInstitute_id(int institute_id) {
		this.institute_id = institute_id;
	}
	private int DGPA, placed, institute_id;
	
}
