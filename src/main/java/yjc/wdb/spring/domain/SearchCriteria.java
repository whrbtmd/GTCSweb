package yjc.wdb.spring.domain;

public class SearchCriteria extends Criteria{
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
	   private String keyword;
	   
	   @Override
	   public String toString() {
	      return super.toString() + " SearchCriteria "
	            + "[searchType=" + searchType + ", keyword ="
	            + keyword + "]";
	   }
	}