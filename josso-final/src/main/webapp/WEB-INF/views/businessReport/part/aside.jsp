<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fa fa-paste icon_" aria-hidden="true"></i>����</span>
                            
                    </div>
                </section>
    
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">������ ��������</span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1">
                                        <a href="${pageContext.request.contextPath}/report/weekly/list" class="report_kind">�ְ� ��������</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox2">
                                        <a href="${pageContext.request.contextPath}/report/monthly/list" class="report_kind">���� ��������</a>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>