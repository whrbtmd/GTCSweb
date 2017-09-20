package yjc.wdb.spring.domain;


public class GoodSearchCriteria extends Criteria{
	private String searchType;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	private String keyword;
	private String category;
	
	@Override
	public String toString() {
		return super.toString() + " GoodSearchCriteria "
				+ "[searchType=" + searchType + ", keyword ="
				+ keyword + ",catetory=" + category + "]";
	}
}
