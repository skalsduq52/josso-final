<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header>
	
    <div class="navigation">
        <ul>
            <li>
                <a href="/josso/main">
                <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                <span class="icon">홈</span>
                </a>
            </li>
            <li>
                <a href="/josso/email/accept/list">
                <span class="icon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                <span class="icon">메일</span>
                </a>
            </li>
            <li>
                <a href="/josso/schedule">
                <span class="icon"><i class="fas fa-calendar-alt fa-lg" aria-hidden="true"></i></span>
                <span class="icon">캘린더</span>
                </a>
            </li>
            <li>
                <a href="/josso/elecApproval">
                <span class="icon"><i class="fas fa-clipboard fa-lg" aria-hidden="true"></i></span>
                <span class="icon">결재</span>
                </a>
            </li>
            <li>
                <a href="/josso/report/weekly/list">
                <span class="icon"><i class="fa fa-paste" aria-hidden="true"></i></span>
                <span class="icon">보고</span>
                </a>
            </li>
            <li>
                <a href="/josso/board/notice/list">
                <span class="icon"><i class="fas fa-list-ul fa-lg" aria-hidden="true"></i></span>
                <span class="icon">게시판</span>
                </a>
            </li>
            <li>
                <a href="/josso/reserve">
                <span class="icon"><i class="fas fa-clock fa-lg" aria-hidden="true"></i></span>
                <span class="icon">예약</span>
                </a>
            </li>
            
            <li>
                <a href="/josso/staff/organization">
                <span class="icon"><i class="fas fa-user-friends fa-lg" aria-hidden="true"></i></span>
                <span class="icon">조직도</span>
                </a>
            </li>
            <c:if test="${employee.roleCode == '1'}">
	             <li >
	                <a href="/josso/employee/employeeList">
	                <span class="icon"><i class="fas fa-user-lock fa-lg" aria-hidden="true" ></i></span>
	                <span class="icon" >관리자</span>
	                </a>
	            </li>
            </c:if>
        </ul>
    </div>
</header>
