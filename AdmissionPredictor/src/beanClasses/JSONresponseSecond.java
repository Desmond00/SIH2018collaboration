package beanClasses;

public class JSONresponseSecond {
	private String branch;
	private String instituteName;
	private String companies;
	private int rank;
	public JSONresponseSecond() {
		super();
	}
	public JSONresponseSecond(String branch, String instituteName, String companies, int rank) {
		super();
		this.branch = branch;
		this.instituteName = instituteName;
		this.companies = companies;
		this.rank = rank;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getInstituteName() {
		return instituteName;
	}
	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}
	public String getCompanies() {
		return companies;
	}
	public void setCompanies(String companies) {
		this.companies = companies;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
}
