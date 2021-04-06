<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<section>
		<div class="title">
			<span class="icon"><i class="fa fa-envelope fa-lg"
				aria-hidden="true"></i></span> 전자결재
		</div>
	</section>
	<section>
		<div class="title_button">
			<button type="button" class="btn btn-info btn-sm btn-block"
				data-toggle="modal" data-target="#newsign">새 결재 진행</button>
		</div>
	</section>
	<section>
		<div class="side_title">
			<ul>
				<li><span class="hover_title"><i
						class="fas fa-sort-down fa-rotate-270" style="color: gray;"></i>
						<a href="/josso/elecApproval/waiting">결재 대기 문서</a></span></li>
			</ul>
			<ul>
				<li><span class="hover_title"><i
						class="fas fa-sort-down fa-rotate-270" style="color: gray"></i> 
						<a href="/josso/elecApproval/my">내가 기안한 문서</a></span></li>
			</ul>
			<ul>
				<li><span class="hover_title"><i
						class="fas fa-sort-down fa-rotate-270" style="color: gray"></i> 
						<a href="/josso/elecApproval/receive">결재 수신 문서 </a></span></li>
			</ul>
		</div>
	</section>
</div>