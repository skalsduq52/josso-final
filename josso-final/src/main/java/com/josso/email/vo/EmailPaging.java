package com.josso.email.vo;

public class EmailPaging {

   private static final long serialVersionUID = 1111L;
   private String employeeEmail;
   private int page = 1;
   private String title = "";
   private String query = "";
   private int count;
   private int startNum;
   private int lastNum;
   private int startRange;
   private int endRange;
   
   public EmailPaging() {}
    // 이건 왜 안올라가지?
   public EmailPaging(String employeeEmail, int page, String title, String query, int count, int startNum, int lastNum,
         int startRange, int endRange) {
      this.employeeEmail = employeeEmail;
      this.page = page;
      this.title = title;
      this.query = query;
      this.count = count;
      this.startNum = startNum;
      this.lastNum = lastNum;
      this.startRange = startRange;
      this.endRange = endRange;
   }

   public String getEmployeeEmail() {
      return employeeEmail;
   }

   public void setEmployeeEmail(String employeeEmail) {
      this.employeeEmail = employeeEmail;
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
      return "Paging [employeeEmail=" + employeeEmail + ", page=" + page + ", title=" + title + ", query=" + query
            + ", count=" + count + ", startNum=" + startNum + ", lastNum=" + lastNum + ", startRange=" + startRange
            + ", endRange=" + endRange + "]";
   }
   
}
