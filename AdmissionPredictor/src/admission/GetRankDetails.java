package admission;

public class GetRankDetails {
	
	public void setInformation(String subCategory, String stateQuota) {
		SubCategoryStateQuota CategoryQuota = new SubCategoryStateQuota();
		CategoryQuota.setSubCategory(subCategory);
		CategoryQuota.setStateQuota(stateQuota);
		
	}
	
	
}
