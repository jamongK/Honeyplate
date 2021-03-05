<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="store.model.vo.Review"%>
<%@page import="store.model.vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Store store = (Store)request.getAttribute("store");
Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />

<!-- JS, Popper.js, and jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- icon fontawesome -->
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<!-- storeview css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/storeview.css" />

<!-- 메뉴바(헤더) 애니메이션 효과 -->
<script src="<%=request.getContextPath()%>/js/newTpl.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/newTpl.css">

<title>HoneyPlate</title>
  </head>
  <body>
   <!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="<%=request.getContextPath()%>/images/logo/apitherapy.png" alt="preloader-image-honeycomb-and-bee">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <div class="logo">
            <a href="index.html"><img src="<%=request.getContextPath()%>/images/logo/hplogo.png" alt="logo image(honey jar)"><span class="logo-text">Honey Plate</span></a>
        </div>
        <nav id="navigation">
            <a href="#">Sign in</a>
            <a href="#" class="signup">Sign up</a>
        </nav>
    </header>
    
    <hr />
    <!-- 클래스명은 변경하면 안 됨 -->
	<div class="swiper-container col-md-12">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0010.jpg" /></div>
			<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0004.jpg" /></div>
			<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0492.jpg" /></div>	
		</div>
	
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
      <br />
       <div class="row">
         <div class="col-md-8">
         <div class= detail-info>
          <table class="table">
            <thead>
              <tr></tr>
                <th scope="col" colspan="2" style="font-size:30px; color: #FFA726;"><%= store.getStore_name()%></th>
               
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"><i class="fas fa-edit" style="font-size: 30px; padding-left: 14px;"></i>
                  <a href="review.html"><br>리뷰쓰기</a></th>
                <!-- location.href='<%= request.getContextPath() %>/store/writereview'; -->
                <th scope="col"><i class="fas fa-shopping-cart" style="font-size: 30px; padding-left: 5px;"></i>
                  <a href="#"><br>예약하기</a></th>
              </tr>
            </thead>
            <tbody>
	            <tr>
	                <th scope="row" class="sto-phone">전화번호</th>
	                <td><%= store.getStore_phone()%></td>
	              </tr>
	             <tr>
                <tr>
	                <th scope="row" class="sto-location">주소</th>
	                <td><%= store.getLocation()%></td>
              	</tr>
              	<tr>
	                <th scope="row" class="sto-rest">휴무</th>
	                <td><%= store.getClosing_day()%></td>
             	</tr>
             	<tr>
	                <th scope="row" class="sto-open">오픈시간</th>
	                <td><%= store.getOpen_hours()%></td>
             	</tr>
	            <tr>
	               <th scope="row" class="sto-close">클로즈시간</th>
	               <td><%= store.getClose_hours()%></td>
	            </tr>
              <%if(store.getBreaktime_close()!=null){ %>
	            <tr>
	               <th scope="row" class="sto-braketime">브레이크타임시작</th>
	               <td><%= store.getBreaktime_open()%></td>
	            </tr>
	            <tr>
	              <th scope="row" class="sto-braketime">브레이크타임끝</th>
	              <td><%= store.getBreaktime_close()%></td>
	            </tr>
	            <%} %>
	            <tr>
	                <th scope="row" class="sto-menu">대표메뉴</th>
	                <td><%= store.getMenu()%></td>
	            </tr>
	            <tr>
	               <th scope="row" class="sto-parking">주차</th>
	               <td><%= store.getParking()%></td>
	             </tr>
              
            </tbody>
          </table>
           </div>
          <hr />
           <div class= "col-md-7" >
            <div class="review-info">
          <h5 style="font-size:30px; font-weight: bold;">리뷰</h5>
          <table class="type08">
            <thead>
            <tr>
              <th scope="cols" colspan="2"></th>
             
            </tr>
            </thead>
            <tbody>
            <tr>
              <th scope="row" rowspan="2"><i class="far fa-grin-alt review-icon" style="font-size: 62px; padding-left: 14px;"></i></th>
              <td><%= review.getReview_date()%></td>
            </tr>
            <tr>
              
              <td><%= review.getRating()%></td>
            </tr>
            <tr>
             <th scope="row" rowspan="2" style="text-align: center;"><%= review.getMember_id()%></th>
              <td><%= review.getReview_content()%></td>
            </tr>
            <tr>
              <td>첨부파일받아올것 음여러개니깐 따로불러와야하나 컬럼추가가 아니라</td>
            </tr>
            </tbody>
          </table>
        </div> 
          </div>

         </div>
      
         
         <div class="col-md-3">
          <ul class="nav">
            <div style="background-color: hotpink; height: 300px;" class= "col-md-12">
              	여기가 지도 넣을 자리인가?
            </div>
         
            <div style="border: solid 2px gray; height: 400px;" class= "around_sto col-md-12">
              <h6 >주변인기가게</h6>
              <br />
              <br />
              <div class="col-md-12">
                <table class="table">
                   <tbody>
                    <tr>
                      <th scope="row">가게사진</th>
                      <td>가게이름</td>
                     
                    </tr>
                    <tr>
                      <th scope="row">가게사진</th>
                      <td>가게이름</td>
                    </tr>
                    <tr>
                      <th scope="row">가게사진</th>
                      <td>가게이름</td>
                    </tr>
                  </tbody>
                </table>               
              </div>
            </div>
            
            
            <div style="border: solid 2px gray; height: 150px;" class= "col-md-12">
              <h6>해시태그</h6>
              <a href="#">#해시태그 쓸겁니다~</a><a href="#">#해시태그 쓸겁니다2</a><a href="#">#해시태그 쓸겁니다3</a>
            </div>
          </ul>
        </div>
       </div>
      
       <hr />
      <footer>
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
  <script>
    new Swiper('.swiper-container', {
    
    slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
    spaceBetween : 30, // 슬라이드간 간격
    slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    
    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
    loopFillGroupWithBlank : true,
    
    loop : true, // 무한 반복
    
    pagination : { // 페이징
      el : '.swiper-pagination',
      clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    },
    navigation : { // 네비게이션
      nextEl : '.swiper-button-next', // 다음 버튼 클래스명
      prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
    },
    });
          
    </script>
</html>