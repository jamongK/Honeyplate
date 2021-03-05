<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>review</title>

<!-- JS, Popper.js, and jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b36a7fe661.js" crossorigin="anonymous"></script>
<script src="js/newTpl.js"></script>

<!-- CSS here -->
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- storeview css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/review.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/newTpl.css">
<script>
$(document).ready(function(){

$("input[type='radio']").click(function(){
var sim = $("input[type='radio']:checked").val();
//alert(sim);
if (sim<3) { $('.myratings').css('color','red'); $(".myratings").text(sim); }else{ $('.myratings').css('color','green'); $(".myratings").text(sim); } }); });

</script>
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
    
	<section>
		<!-- 소연님 코드 시작 -->
	    <div class="wrapper">
	        <div class ="reivew_title">
	            <p>이 가게에 대한 솔직한 리뷰를 써주세요</p>
	        </div>
	    </div>    
	    
	    <br />
	    <div class="wrapper2">   
	        <div class="row">
	            <div class="star-rating">
	                <div class="stars">
						<form action=""> <!-- action에다가 url 작성할 것! -->
						    <input class="star star-5" id="star-5" type="radio" name="star"/>
						    <label class="star star-5" for="star-5"></label>
						    <input class="star star-4" id="star-4" type="radio" name="star"/>
						    <label class="star star-4" for="star-4"></label>
						    <input class="star star-3" id="star-3" type="radio" name="star"/>
						    <label class="star star-3" for="star-3"></label>
						    <input class="star star-2" id="star-2" type="radio" name="star"/>
						    <label class="star star-2" for="star-2"></label>
						    <input class="star star-1" id="star-1" type="radio" name="star"/>
						    <label class="star star-1" for="star-1"></label>
								
						        <div class="review-group">
						            <textarea class="review-control" rows="3" placeholder="맛있으셨나요?가게에 대한 솔직한 리뷰를 써주세요."></textarea>
						            
						            <input type="file" class="review-file form-control-file" style="margin-left: 52px; margin-top: 10px;"/>       
						         
						            <button type="button" class="rebtn-close btn-warning" style="margin-left: 52px; margin-top: 10px;">작성취소</button>
	 					            <!-- <button type="button" class="rebtn-done btn-warning">작성완료</button> -->
						            <button type="submit" class="rebtn-done btn-warning">작성완료</button>
						            
								</div>
							
						</form>
	                </div>
	            </div>
	        </div>
	    </div>
		<!-- 소연님 코드 끝 -->
		<!-- 유정님 코드는 지움. 백업해둠. -->
	</section>
	
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
</html>