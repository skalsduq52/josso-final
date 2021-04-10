<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.fas{
    padding-right: 10px;
}
a {
    color: black;
    font-weight: bold;
}
</style>
<div>
	<section>
		<div class="title">
			<span class="icon"><i class="fas fa-clock fa-lg"
				aria-hidden="true"></i>예약</span>
		</div>
	</section>
	<section>
		<div class="side_title" style="width: 200px;padding-top: 40px;">
			<ul style="padding-left: 0px;">
				<li style="padding-bottom: 5px;"><span class="hover_icon"><i
						class="fas fa-sort-down fa-rotate-270" style="color: gray"></i> <a
						href="/josso/reserve/room"> 회의실(사옥) </a> </span></li>
				<li class="hover_tag" style="padding-left: 25px;"><a
					href="/josso/reserve/room/first?itemNumber=1"> 1회의실 </a></li>
				<li class="hover_tag" style="padding-left: 25px;"><a
					href="/josso/reserve/room/second?itemNumber=2"> 2회의실 </a></li>
				<li class="hover_tag" style="padding-left: 25px;margin-bottom: 20px;" ><a
					href="/josso/reserve/room/third?itemNumber=3"> 3회의실 </a></li>
			</ul>
			<ul style="padding-left: 0px;">
				<li style="padding-bottom: 5px;"><span class="hover_icon"><i
						class="fas fa-sort-down fa-rotate-270" style="color: gray"></i> <a
						href="/josso/reserve/car"> 공용차량 </a> </span></li>
				<li class="hover_tag" style="padding-left: 25px;"><a
					href="/josso/reserve/car/avante?itemNumber=4"> 아반떼 </a></li>
				<li class="hover_tag" style="padding-left: 25px;"><a
					href="/josso/reserve/car/benz?itemNumber=5"> 벤츠 </a></li>
			</ul>
		</div>
	</section>
</div>