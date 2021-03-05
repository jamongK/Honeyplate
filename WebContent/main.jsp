<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
	integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
	integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/template_common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/newTpl.css">

</head>

<body>
	<!-- preloader 무한로딩시 아래처럼 주석처리하고, preloader 확인하고자 할 시, 주석 해제 요망 -->
	<!-- <div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="images/logo/apitherapy.png" alt="">
				</div>
			</div>
		</div>
	</div> -->

	<header class="landing-header">
		<img src="images/logo/logo2.png" class="landing-logo">
	</header>


	<div class="searchbar">
		<!--검색바-->
		<div class="wrap">
			<div class="search">
				<input type="text" class="searchTerm" id="searchTermcss"
					placeholder="지역, 식당, 음식, 해시태그로 검색해보세요!" onclick="searchpop()">

				<!--data-toggle="tab"이 탭으로 보여주게 만드는 코드-->
				<div class="tab-container">
					<div class="row">
						<div class="col">
							<!-- <p>Tab</p> -->
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#qwe">추천검색어</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#asd">인기검색어</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#zxc">최근검색어</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="qwe">
								<a href="">고기맛집</a><br>
								<hr>
								<a href="">데이트코스</a><br>
								<hr>
								<a href="">강남맛집</a><br>
								<hr>
							</div>
							<div class="tab-pane fade" id="asd">
								<a href="">예쁜카페</a><br>
								<hr>
								<a href="">핫플</a><br>
								<hr>
								<a href="">강남맛집</a><br>
								<hr>
							</div>
							<div class="tab-pane fade" id="zxc">
								<a href="">혼밥</a><br>
								<hr>
								<a href="">혼술</a><br>
								<hr>
								<a href="">강남맛집</a><br>
								<hr>
							</div>
						</div>
					</div>
				</div>

				<button type="submit" class="searchButton">
					<i class="fa fa-search"> </i>
				</button>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".nav-link").click(function(e) {
				$(this).tab('show');
			})
			$(".searchTerm")
					.focus(
							function() {
								document.querySelector(".tab-container").style.visibility = "visible";
							});

			$(".searchTerm")
					.blur(
							function() {
								$(".tab-container")
										.mouseleave(
												function() {
													document
															.querySelector(".tab-container").style.visibility = "hidden";
												});
							});
		});
	</script>
	<section>

		<!--첫번째 베스트 목록-->
		<div id="carouselExampleControls6" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">

				<div class="carousel-item active">
					<div class="row">
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
					</div>
				</div>

				<div class="carousel-item">
					<div class="row">
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
					</div>
				</div>

			</div>

			<a class="carousel-control-prev" href="#carouselExampleControls6"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon6" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls6"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>





		<br>

		<h3 class="listtitle">예약베스트</h3>
		<!--두번째 베스트 목록-->
		<div id="carouselExampleControls3" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">

				<div class="carousel-item active">
					<div class="row">
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
					</div>
				</div>

				<div class="carousel-item">
					<div class="row">
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
						<div class="col-4">
							<img src="http://placehold.it/260x180" alt="..."
								class="img-thumbnail">
						</div>
					</div>
				</div>

			</div>

			<a class="carousel-control-prev" href="#carouselExampleControls3"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon3" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls3"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<br> <br>




	</section>


	<footer>
		<div class="footer-logo">
			<h2>Honey Plate</h2>
		</div>
		<div class="footer-menu">
			<a href="#" style="margin-right: 15px;">이용약관</a> <a href="#"
				style="margin-left: 15px; margin-right: 15px;">커뮤니티 가이드라인</a> <a
				href="#" style="margin-left: 15px; margin-right: 15px;">문의하기</a> <a
				href="#" style="margin-left: 15px;">공지하기</a>
		</div>
		<div class="social-media-icon">
			<a href="#"><i class="fab fa-facebook-square fa-2x fb-icon"></i></a>
			<a href="#"><i class="fab fa-instagram-square fa-2x ig-icon"></i></a>
		</div>
	</footer>

</body>