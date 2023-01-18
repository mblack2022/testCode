package main.service;

public class BoardVO {
	
	private 	int 	unq;
	private 	String 	title;
	private 	String 	pass;
	private 	String 	name;
	private		String	content;
	private		int		hits;
	private		String	rdate;
	
	private		int		viewPage = 1;
	private		int		startIndex = 0;
	private		int		listCnt	= 10;
	
	private		String	seachFilter;
	private		String	seachText;
	
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public String getSeachFilter() {
		return seachFilter;
	}
	public void setSeachFilter(String seachFilter) {
		this.seachFilter = seachFilter;
	}
	public String getSeachText() {
		return seachText;
	}
	public void setSeachText(String seachText) {
		this.seachText = seachText;
	}
}
