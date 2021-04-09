<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

            <div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-user-friends fa-lg icon_" aria-hidden="true"></i>주소록</span>
                            
                    </div>
                </section>
    
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">임직원 정보</span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1">
                                        <a href="${pageContext.request.contextPath}/staff/organization" class="report_kind">조직도</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox2">
                                        <a href="${pageContext.request.contextPath}/staff/address/list" class="report_kind">주소록</a>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>