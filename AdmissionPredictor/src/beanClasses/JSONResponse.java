package beanClasses;

import java.util.ArrayList;

public class JSONResponse {
	ArrayList<String> branchName= new ArrayList<String>();
	ArrayList<Integer> gr = new ArrayList<Integer>();
	ArrayList<Integer> scr = new ArrayList<Integer>();
	ArrayList<Integer> str = new ArrayList<Integer>();
	ArrayList<Integer> obcr = new ArrayList<Integer>();
	
	
	public JSONResponse() {
		super();
	}



	public void setBranchName(String branchName) {
		this.branchName.add(branchName);
	}

	public void setGeneralRank(int generalRank) {
		gr.add(generalRank);
	}

	public void setScRank(int scRank) {
		scr.add(scRank);
	}

	public void setStRank(int stRank) {
		str.add(stRank);
	}

	public void setObcRank(int obcRank) {
		obcr.add(obcRank);
	}
}
