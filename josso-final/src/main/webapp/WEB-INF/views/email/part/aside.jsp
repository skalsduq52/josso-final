<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	   		<style type="text/css">
				 .abc { color: black;}
				 
			</style>
			<div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-calendar-alt icon_" aria-hidden="true"></i>메일</span>
                            
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <a href="${pageContext.request.contextPath}/email/write/open"><button type="button" class="btn btn-info btn-sm btn-block"> 메일쓰기</button></a>
                    </div>
                </section>
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span style="font-weight:bold;" class="myEmail abc hover_title">내 메일함</span>
                        <span class="write_img">
                            <img src="${pageContext.request.contextPath}/resources/images/글쓰기(연필).png">
                        </span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1"><a class="abc" href="${pageContext.request.contextPath}/email/accept/list" style="font-size: 15px; font-weight: bold;">받은 메일함</a></label><label style="color: gray; padding:8px 0px 0px 10px;">${emailCount}</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1"><a class="abc" href="${pageContext.request.contextPath}/email/send/list" style="font-size: 15px; font-weight: bold;"> 보낸 메일함</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                           
                                    <label class="form-check-label" for="inlineCheckbox1"><a class="abc" href="${pageContext.request.contextPath}/email/wastebasket/list" style="font-size: 15px; font-weight: bold;"> 휴지통</a></label><label style="color: gray; padding:8px 0px 0px 10px;">${wastebasketCount}</label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>