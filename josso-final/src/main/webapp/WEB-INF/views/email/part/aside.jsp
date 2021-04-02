<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-calendar-alt icon_" aria-hidden="true"></i>메일</span>
                            
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <button type="button" class="btn btn-info btn-sm btn-block"><a href="${pageContext.request.contextPath}/email/write/open"> 메일쓰기</a></button>
                    </div>
                </section>
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">내 메일함</span>
                        <span class="write_img">
                            <img src="${pageContext.request.contextPath}/resources/images/글쓰기(연필).png">
                        </span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1"><a href="${pageContext.request.contextPath}/email/accept/list">받은 메일함</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1"><a href="${pageContext.request.contextPath}/email/send/list"> 보낸 메일함</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    
                                    <label class="form-check-label" for="inlineCheckbox1"><a href="${pageContext.request.contextPath}/email/wastebasket/list"> 휴지통</a></label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>