<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="border-right">
	<div>
		<section>
			<div class="title">
				<span class="icon"><i class="fas fa-calendar-alt icon_"
					aria-hidden="true"></i>캘린더</span>

			</div>
		</section>
		<section>
			<div class="title_button">
				<button type="button" onclick="location.href='/josso/schedule/write'" class="btn btn-info btn-sm btn-block">일정등록</button>
			</div>
		</section>
		<section>
			<div class="side_title1">
				<span class="hover_icon">
				 <i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
				</span> 
				<span class="hover_title">내 캘린더</span>
			</div>
			<div>
				<ul class="hover_tag1">
					<li>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox1" value="option1" name="scheuleCheck" checked >
							<label class="form-check-label" for="inlineCheckbox1" >내 일정(기본)</label>
						</div>
					</li>
				</ul>
			</div>
			<div class="side_title2">
				<span class="hover_icon">
				 <i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
				</span> 
				<span class="hover_title">팀 캘린더</span>
			</div>
			<div>
				<ul class="hover_tag2">
					<li>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" name="scheuleCheck" value="option2">
							<label class="form-check-label" for="inlineCheckbox2">팀 일정</label>
						</div>
					</li>
				</ul>
			</div>
			<div class="side_title3">
				<span class="hover_icon">
				 <i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
				</span> 
				<span class="hover_title">전체 캘린더</span>
			</div>
			<div>
				<ul class="hover_tag3">
					<li>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox3" name="scheuleCheck" value="option3"> 
							<label class="form-check-label" for="inlineCheckbox3">전체 일정</label>
						</div>
					</li>
				</ul>
			</div>
		</section>
	</div>
</aside>
