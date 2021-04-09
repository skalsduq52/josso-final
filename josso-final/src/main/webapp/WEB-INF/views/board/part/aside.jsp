<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

        <div>
            <section>
                <div class="title">
                    <span class="icon"><i class="fas fa-list-ul fa-lg icon-" aria-hidden="true"></i>게시판</span>
                        
                </div>
            </section>

            <section>
                
                <div class="side_title">
                    <span class="hover_icon">
                        <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                    </span>
                    <span class="hover_title">게시판 목록</span>
                </div>
                <div>
                    <ul class="hover_tag">
                        <li>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" for="inlineCheckbox1">
                                    <a href="${pageContext.request.contextPath}/board/notice/list" class="report_kind">공지사항</a></label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" for="inlineCheckbox2">
                                    <a href="${pageContext.request.contextPath}/board/suggestion/list" class="report_kind">건의사항</a>
                                </label>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
