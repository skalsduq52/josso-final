package com.josso.board.vo;

public class BoardPaging {

		private static final long serialVersionUID = 1111L;
		private String boardTitle;
		private String employeeName;
		private int page = 1;
		private String title = "";
		private String query = "";
		private int count;
		private int startNum;
		private int lastNum;
		private int startRange;
		private int endRange;
		
		// 기본 생성자
		public BoardPaging() {}
		
		// 매개변수 생성자
		public BoardPaging(String boardTitle, String employeeName, int page, String title, String query, int count, int startNum, int lastNum,
				int startRange, int endRange) {
			this.boardTitle = boardTitle;
			this.employeeName = employeeName;
			this.page = page;
			this.title = title;
			this.query = query;
			this.count = count;
			this.startNum = startNum;
			this.lastNum = lastNum;
			this.startRange = startRange;
			this.endRange = endRange;
		}
		
		// 메서드
		public String getBoardTitle() {
			return boardTitle;
		}

		public void setBoardTitle(String boardTitle) {
			this.boardTitle = boardTitle;
		}

		public String getEmployeeName() {
			return employeeName;
		}

		public void setEmployeeName(String employeeName) {
			this.employeeName = employeeName;
		}

		public int getPage() {
			return page;
		}

		public void setPage(int page) {
			this.page = page;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getQuery() {
			return query;
		}

		public void setQuery(String query) {
			this.query = query;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

		public int getStartNum() {
			return startNum;
		}

		public void setStartNum(int page) {
			this.startNum = page-(page-1)%5;
		}

		public int getLastNum() {
			return lastNum;
		}

		public void setLastNum(int count) {
			this.lastNum = (int)Math.ceil((double)count/10);
		}

		public int getStartRange() {
			return startRange;
		}

		public void setStartRange(int page) {
			this.startRange = 1+(page-1)*10;
		}

		public int getEndRange() {
			return endRange;
		}

		public void setEndRange(int page) {
			this.endRange = page * 10;
		}

		@Override
		public String toString() {
			return "BoardPaging [boardTitle=" + boardTitle + ", employeeName=" + employeeName + ", page=" + page
					+ ", title=" + title + ", query=" + query + ", count=" + count + ", startNum=" + startNum
					+ ", lastNum=" + lastNum + ", startRange=" + startRange + ", endRange=" + endRange + "]";
		}
		
		

}
