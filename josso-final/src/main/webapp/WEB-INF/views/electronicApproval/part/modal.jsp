<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="newsign">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">새 결재 진행</h4>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="border"
					style="width: 38%; float: left; margin: 10px 10px 10px 10px; height: 400px; min-width: 290px;">
					<div class="document_kind">
						<span class="hover_icon"> <i
							class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
						</span> <span class="hover_title">결재양식</span>
					</div>
					<div>
						<ul class="hover_tag">
							<li>
								<div class="document_kind_2">
									<div class="form-check form-check-inline 1">
										<span class="hover_icon"> <i
											class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										</span> <label class="form-check-label" for="inlineCheckbox1">공통양식</label>
									</div>
								</div>
								<ul class="hover_tag2">
									<li>기안서</li>
									<li>보고서</li>
								</ul>
							</li>
							<li>
								<div class="document_kind_3">
									<div class="form-check form-check-inline">
										<span class="hover_icon"> <i
											class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										</span> <label class="form-check-label" for="inlineCheckbox1">근태관리</label>
									</div>
								</div>
								<ul class="hover_tag3">
									<li>휴가신청서</li>
									<li>외근신청서</li>
									<li>휴직신청서</li>
								</ul>
							</li>
							<li>
								<div class="document_kind_4">
									<div class="form-check form-check-inline">
										<span class="hover_icon"> <i
											class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										</span> <label class="form-check-label" for="inlineCheckbox1">지출결의</label>
									</div>
								</div>
								<ul class="hover_tag4">
									<li>지출결의서</li>
								</ul>
							</li>
							<li>
								<div class="document_kind_5">
									<div class="form-check form-check-inline">
										<span class="hover_icon"> <i
											class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										</span> <label class="form-check-label" for="inlineCheckbox1">인사총무</label>
									</div>
								</div>
								<ul class="hover_tag5">
									<li>인사명령서</li>
									<li>인수인계서</li>
									<li>사유서</li>
									<li>시말서</li>
								</ul>
							</li>
							<li>
								<div class="document_kind_6">
									<div class="form-check form-check-inline">
										<span class="hover_icon"> <i
											class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										</span> <label class="form-check-label" for="inlineCheckbox1">법인카드관리</label>
									</div>
								</div>
								<ul class="hover_tag6">
									<li>발급신청서</li>
									<li>분실확인서</li>
									<li>사용신청서</li>
									<li>반납확인서</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div class="border"
					style="width: 56%; float: right; margin: 10px 10px 10px 10px; height: 400px; min-width: 428px;">
					<div class="sign_info">상세정보</div>
					<div style="width: 100%; padding-left: 10px; padding-top: 10px;" id="dragtop">
						<table>
							<tr>
								<td style="width: 100px;">제목</td>
								<td id="document_name"></td>
							</tr>
							<tr>
								<td style="padding-top: 10px;">보존연한</td>
								<td style="padding-top: 10px;">5년</td>
							</tr>
						</table>
						<div>
							<input type="text" style="width: 80%;" id="searchName">
							<!-- <img style="width: 30px; padding-bottom: 3px;" src="../search.png"> -->
						</div>
						<div class="border"
							style="overflow: auto; height: 100px; margin-top: 5px; margin-right: 10px;">
							<table class="border-top" style="width: 100%; margin-top: 5px;"
								id="board">
								<thead>
									<tr class="border-bottom dataRow">
										<th>부서</th>
										<th>직급</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody id="droppObj3">
								</tbody>
							</table>
						</div>
						<div style="width: 100%; height: 150px;">
								<div class="border"
									style="width: 200px; height: 120px; float: left; margin-top: 20px;"
									id="droppObj">
									<div class="border-bottom"
										style="height: 40px; line-height: 40px; text-align: center;">
										중간 결재자</div>
									<table style="width: 100%;" id="drop1">
										<tbody>
											<tr class="border-bottom">
												<td style="width: 36%;">부서</td>
												<td style="width: 38%;">직급</td>
												<td style="width: 26%;">이름</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="border"
									style="width: 200px; height: 120px; float: left; margin-top: 20px; margin-left:10px;"
									id="droppObj1">
									<div class="border-bottom"
										style="height: 40px; line-height: 40px; text-align: center;">
										최종 결재자</div>
									<table style="width: 100%;" id="drop2">
										<tbody id="droppObj1">
											<tr class="border-bottom">
												<td style="width: 36%;">부서</td>
												<td style="width: 38%;">직급</td>
												<td style="width: 26%;">이름</td>
											</tr>
										</tbody>
									</table>
								</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="modal_submit">등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>

		</div>
	</div>
</div>