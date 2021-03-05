<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"
	integrity="sha512-2XuQYSojalNmRQyWxr1Dr+KWZ7Gn6JgWMZvPxIYwGFRVA1r8RPWHRWybIu8zp/G2EtTTAXh56aMpk99pkrrpNA=="
	crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/d37b4c8496.js"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b36a7fe661.js"
	crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/js/reservationRequest.js"></script>
<script src="<%=request.getContextPath()%>/js/newTpl.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservationRequest.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/newTpl.css">
<%
	//Member member = request.getParameter("memberIdLoggedIn");
//int BoardNo = request.getParameter("boardNo");
%>
<title>예약 신청</title>
</head>
<body>
	<header>
	<div class="logo">
		<a href="index.html"><img
			src="<%=request.getContextPath()%>/images/logo/hplogo.png"
			alt="logo image(honey jar)"><span class="logo-text"
				style="font-family: 'yg-jalnan', sans-serif;">Honey Plate</span></a>
	</div>
	<nav id="navigation"> <a href="#">Sign in</a> <a href="#"
		class="signup">Sign up</a> </nav> </header>

	<div class="container">

		<p class="store-name">
			<a href=""><i class="fas fa-home"></i></a> Strawberry Oakwein 예약하기
		</p>
		<hr class="store-hr">

			<div class="reservation">

				<div class="reservation-info">
					<div id="carouselExampleSlidesOnly"
						class="carousel slide store-img" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="https://images.unsplash.com/photo-1590166774851-bc49b23a18fe?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="https://images.unsplash.com/photo-1544962059-b04e6d47e9a0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80"
									alt="Third slide">
							</div>
						</div>
					</div>

					<div class="info-container">
						<p class="info-text">
							[Couple Things : With You] <br> 투명하고 밝은 루비빛, 실레니, 셀라 셀렉션 피노
								누아와 함께 <br> 200여 가지의 다채롭고 신선한 요리를 롯데호텔 서울 라세느에서 즐겨보세요!<br>
										<br> <br> @가 격<br> 1) 254,000원/2인(평일 디너 한정 /
													실리니 피노누아 375ml 1병 포함)<br> 2) 화이트 데이 : 270,000원/2인(토,일
														디너 각 30팀 한정 / 반피 로사 리갈 브라케토 다퀴 375ml 1병 포함)<br> @장 소
															: 롯데호텔서울 라세느(Main Tower 1F)<br> @문 의 : 02-317-7171<br>
						</p>
					</div>

					<div class="notice-container">
						<p class="notice">
							<i class="far fa-question-circle"></i> 알립니다<br>
						</p>

						<p class="notice-text">
							*가게 사정에 따라 예약이 거절 될 수 있습니다. <br> *당일 예약은 취소가 불가능합니다.<br>
									*환불은 고객센터로 문의 바랍니다.<br>
						</p>
					</div>
				</div>

				<div class="reservation-container">
					<form id="reservation-form" method="post"
						action="<%=request.getContextPath()%>/reservation/request">
						<%-- <input type="hidden" value=<%boardNo%> /> --%>
						<input type="hidden" value="1" name="boardNo" />

						<div class="datepicker" id="datepicker"></div>

						<div class="input-reservation-info">
							<ul>
								<li class="text-day"><label for="input-day">날짜</label> <input
									name="input-day" class="input-day" type="text"
									placeholder="달력에서 날짜를 선택해주세요." readonly></li>

								<li>
									<hr>
								</li>

								<li class="text-time"><label for="timepicker">시간</label> <input
									name="timepicker" type="time" class="timepicker" required></li>

								<li>
									<hr>
								</li>

								<li><label for="child-num">아이인원</label> <input
									name="child-num" class="child-num" type="number" min="0"
									max="15" value="0" required></li>

								<li><label for="adult-num">어른인원</label> <input
									name="adult-num" class="adult-num" type="number" min="1"
									max="15" value="0" required></li>

								<li>
									<hr>
								</li>

								<li class="text-sum">
									<p>합계</p>
									<p id="sum">0원</p> <input type="hidden" id="child-sum">
										<input type="hidden" id="adult-sum">
								</li>
							</ul>
						</div>

						<div class="customer-info">
							<ul>
								<li>
									<p>예약자 정보</p>
								</li>

								<li>
									<hr>
								</li>

								<li><label for="memberId"">예약자 아이디</label> <input
									name="memberId" type="text" class="memberId_" value="abc_123"
									readonly></li>

								<li><label for="customer-phone">연락처</label> <input
									name="customer-phone" type="tel" placeholder="-을 빼고 입력해주세요."
									class="customer-phone" required>
							</ul>
						</div>

						<div class="consent-container">
							<ul>
								<li><label for="inputState">개인정보제공동의</label></li>

								<li>
									<hr>
								</li>


								<li><select id="inputState" class="form-control consent">
										<option selected>선택해주세요.</option>
										<option>동의합니다.</option>
										<option>동의하지않습니다.</option>
								</select></li>

							</ul>
						</div>
						<input type="submit" value="예약하기" id="submit-btn" />
					</form>
				</div>
			</div>
	</div>

	<footer style="margin-top:50px">
	<div class="footer-logo">
		<h2>Honey Plate</h2>
	</div>
	<div class="footer-menu">
		<a href="#" style="margin-right: 15px;">이용약관</a> 
		<a href="#" style="margin-left: 15px; margin-right: 15px;">커뮤니티 가이드라인</a> 
		<a href="#" style="margin-left: 15px; margin-right: 15px;">문의하기</a> 
		<a href="#" style="margin-left: 15px;">공지하기</a>
	</div>
	<div class="social-media-icon">
		<a href="#"><i class="fab fa-facebook-square fa-2x fb-icon" style="color: #fff !important;"></i></a> 
		<a href="#"><i class="fab fa-instagram-square fa-2x ig-icon" style="color: #fff !important;"></i></a>
	</div>
	</footer>

</body>
</html>