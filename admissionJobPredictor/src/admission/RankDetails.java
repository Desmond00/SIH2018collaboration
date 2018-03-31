package admission;
import connect.*;

public class RankDetails {
	private String branch;
	private int genRank, SCRank, STRank, OBCRank;
	
	public void setRank(int genRank, int SCRank, int STRank, int OBCRank) {
		this.genRank = genRank;
		this.SCRank = SCRank;
		this.STRank = STRank;
		this.OBCRank = OBCRank;
	}
	
	public void setBranch(String branch) {
		this.branch = branch;
	}
}
