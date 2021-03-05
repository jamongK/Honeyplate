<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- JS here -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b36a7fe661.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/newTpl.js"></script>
<script src="<%= request.getContextPath() %>/js/myPageCustomer.js"></script>
	
<!-- CSS here -->
<link rel="stylesheet"href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myPageCustomer.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/newTpl.css">
<% %>
<script>
$(function(){
	var resvPageNum = 0;
	var resvPageMax = 0;
	
	$("#show-reservation").click(function (){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/reservation/listCustomer",
			dataType:"json",
		
			success:function(data){
				if(data != null){
					resvPageMax = (data.length)-1;
					var reservation = data[resvPageNum];
					var dateStr = reservation.rsvDate;
					var date = new Date(dateStr);
					console.log(compareDate(date));
					
					if((reservation.reservationStatus == null || reservation.reservationStatus == 'N' || reservation.depositYn == "N" ) 
							&& compareDate(date)){
						//예약이 승인되지않았고, 결제도 하지 않은 상태에서 예약일이 지난날일때 예약 취소 출력
						$("#reservation-state").text("예약 취소");
					
					}else if(reservation.reservationStatus == null){
						$("#reservation-state").text("예약 확인중");
					
					}else if(reservation.reservationStatus == 'N'){
						$("#reservation-state").text("예약 거절");
					
					}else if(reservation.depositYn == "N"){
						$("#reservation-state").text("결제 대기중");
						
					}else if(reservation.depositYn == "Y"){
						$("#reservation-state").text("결제 완료");
					}
					
					console.log(reservation);
					
					$("#reservation-date").text(getDateStr(date, date.getDay()));
					
					$("#reservation-phone").text(reservation.reservationPhone);
					$("#reservation-child").text(reservation.child + '명');
					$("#reservation-adult").text(reservation.adult + '명');
					
					var sum = (Number(reservation.child) + Number(reservation.adult)) * 5000;
					$("#reservation-sum").text(new Intl.NumberFormat('en-IN', { maximumSignificantDigits: 3 }).format(sum) + '원');
				}
				console.log(data);
				
			},
			error:function(xhr,status,error){
				alert("조회를 실패했습니다.")
			}
		
		}); //end of ajax

	});//end of $("#show-reservation").click
		
	$("#resv-pre").click(function(){
		if(resvPageNum != 0){
			--resvPageNum;
			$("#show-reservation").click();
		}
	});
	
	$("#resv-next").click(function(){
		if(resvPageNum != resvPageMax){
			++resvPageNum;
			$("#show-reservation").click();
		}
	});
		
		

});
	function getDateStr(date, index){
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var dayOfWeek = ['일','월','화','수','목','금','토'];
			var hours = date.getHours();
			var minutes = date.getMinutes()
			
			month = month > 9 ? month : "0" + month;
			day = day > 9 ? day : "0" + day;
			hours = hours > 9 ? hours : "0" + hours;
			minutes = minutes > 9 ? minutes : "0" + minutes;
			
			return year + '.' + month  + '.' + day + ' ' + dayOfWeek[index] + " " +  hours + ":" + minutes;
	}
	
	function compareDate(date){
		var now = new Date();
		var a = now.getTime();
		var b = date.getTime();
		
		return a > b;
	}

</script>
<title>마이페이지</title>
</head>
<body>
	<!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="images/logo/apitherapy.png" alt="preloader-image-honeycomb-and-bee">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <div class="logo">
            <a href="index.html"><img src="images/logo/hplogo.png" alt="logo image(honey jar)"><span class="logo-text" style="font-family: 'yg-jalnan', sans-serif;">Honey Plate</span></a>
        </div>
        <nav id="navigation">
            <a href="#">Sign in</a>
            <a href="#" class="signup">Sign up</a>
        </nav>
    </header>
	
    <div class="mypage-container">
        <div class="mypage-menu">
            <ul>
                <li>
                    <h2>홍길동님 안녕하세요!</h2>
                </li>
                <li>
                    <hr>
                </li>                
                <li>
                    <button id="show-update">개인정보 수정</button>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <button href="" id="show-password">비밀번호 변경</button>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <button href="" id="show-reservation">예약내역 확인</button>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <button href="" id="show-review">내 리뷰 관리</button>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <button href="" id="show-bookmark">즐겨찾기한 식당 목록</button>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <button href="" id="show-withdrawal">회원탈퇴</button>
                </li>
                <li>
                    <hr>
                </li>
            </ul>
        </div>
        
        <div class="mypage-myinfo showbox">
            <table>
                <tr>
                    <th>회원구분</th>
                    <th>일반회원</th>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>honggd</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>2000-01-01</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>honggd@gmail.com</td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td>010-1234-1234</td>
                </tr>
            </table>

            <input type="button" value="로그아웃" id="logout-btn">
        </div>

        <div class="myinfo-update showbox">
            <table>
                <tr>
                    <th>회원구분</th>
                    <th>일반회원</th>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>honggd</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>2000-01-01</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" placeholder="honnggd@gmail.com"></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td><input type="tel" placeholder="01012341234"></td>
                </tr>
            </table>

            <input type="button" value="업데이트" id="update-btn">
        </div>

        <div class="password-update showbox">
            <form>
                <div class="form-group">
                  <label for="formGroupExampleInput">현재 비밀번호</label>
                  <input type="password" class="form-control" id="formGroupExampleInput" placeholder="현재 비밀번호를 입력하세요." required>
                  <p>*현재 비밀번호가 일치하지 않습니다.</p>
                </div>
                
                <div class="form-group">
                  <label for="formGroupExampleInput2">변경할 비밀번호</label>
                  <input type="password" class="form-control" id="formGroupExampleInput2" placeholder="변경할 비밀번호를 입력하세요." required>
                  <p>*비밀번호는 최소 4자리입니다.</p>
                </div>
                
                <div class="form-group">
                    <label for="formGroupExampleInput2">비밀번호 확인</label>
                    <input type="password" class="form-control" id="formGroupExampleInput3" placeholder="변경할 비밀번호를 한번 더 입력하세요." required>
                    <p>*비밀번호가 일치하지 않습니다.</p>
                </div>
            </form>

            <input type="submit" value="변경하기" id="password-update-btn"/>
        </div>
        
        <div class="reservation-list showbox">
            <div class="reservation-list-title"> 
                <hr>
                <h2>예약내역</h2>
                <hr>
            </div>
            
            <ul>  
                <li>
                    <i class="fas fa-check-square"></i>
                    <p>예약 상태 : </p>
                    <p id="reservation-state"></p>
                </li>
                <li>
                    <i class="fas fa-calendar-day"></i>
                    <p>예약 날짜 : </p>
                    <p id="reservation-date"></p>
                </li>
                <li>
                    <i class="fas fa-phone-square-alt"></i>
                    <p>예약자 번호 : </p>
                    <p id="reservation-phone"></p>
                </li>
                <li>
                    <i class="fas fa-child"></i>
                    <p>어린이 인원 : </p>
                    <p id="reservation-child"></p>
                </li>

                <li>
                    <i class="fas fa-user"></i>
                    <p>어른 인원 : </p>
                    <p id="reservation-adult"></p>
                </li>
                <li>
                    <i class="fas fa-won-sign"></i>
                    <p>결제 금액 : </p>
                    <p id="reservation-sum"></p>
                </li>
            </ul>

            <div class="pageBar">
                <button type="button" class="btm_image" id="resv-pre"><i class="fas fa-caret-left next"></i></button>
                <input type="submit" value="결제하기" id="payment-btn" />
                <button type="button" class="btm_image" id="resv-next"><i class="fas fa-caret-right next"></i></button>
            </div>
        </div>

        <div class="review-list showbox">
            <ul>
                <li>
                    <div class="review review-1">
                        <img class="card-img-top" src="https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80" alt="Card image cap">
                        <div class="review-text">
                            <h3 id="store_name">평양냉면</h3>
                            <p class="review-content">제가 가장 좋아하는 평양 냉면집입니다. 들어가보면 외국인이 많음 빈대 튀김 수준의 빈대떡도 맛있음
                             직원들이 친절함</p>
                            <div>
                                <p class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </p>

                                <input type="submit" value="삭제" id="delete-btn" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="review review-1">
                        <img class="card-img-top" src="https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80" alt="Card image cap">
                        <div class="review-text">
                            <h3 id="store_name">평양냉면</h3>
                            <p class="review-content">제가 가장 좋아하는 평양 냉면집입니다. 들어가보면 외국인이 많음 빈대 튀김 수준의 빈대떡도 맛있음
                             직원들이 친절함</p>
                            <div>
                                <p class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </p>

                                <input type="submit" value="삭제" id="delete-btn" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="review review-1">
                        <img class="card-img-top" src="https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80" alt="Card image cap">
                        <div class="review-text">
                            <h3 id="store_name">평양냉면</h3>
                            <p class="review-content">제가 가장 좋아하는 평양 냉면집입니다. 들어가보면 외국인이 많음 빈대 튀김 수준의 빈대떡도 맛있음
                             직원들이 친절함</p>
                            <div>
                                <p class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </p>

                                <input type="submit" value="삭제" id="delete-btn" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <button type="button" class="review-next review-preview" id="img_btn"><i class="fas fa-caret-left next"></i></button>
                    <button type="button" class="review-next review-next" id="img_btn"><i class="fas fa-caret-right next"></i></button>
                </li>
            </ul>
        </div>

        <div class="bookmark-list showbox">
            <ul>
                <li>
                    <div class="bookmark bookmark-1">
                        <img class="card-img-top" src="https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80" alt="Card image cap">
                        <div class="bookmark-text">
                            <h4 id="store-name">진미식당</h4>
                            <p class="store-info">간장게장, 마포맛집, 단체모임, 한식</p>
                            <div>
                                <p class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <p class="score">4.7</p>
                                </p>

                                <input type="submit" value="삭제" id="delete-btn" />
                            </div>
                        </div>
                    </div>
                </li>
                
                <li>
                    <div class="bookmark bookmark-1">
                        <img class="card-img-top" src="https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80" alt="Card image cap">
                        <div class="bookmark-text">
                            <h4 id="store-name">진미식당</h4>
                            <p class="store-info">간장게장, 마포맛집, 단체모임, 한식</p>
                            <div>
                                <p class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <p class="score">4.7</p>
                                </p>

                                <input type="submit" value="삭제" id="delete-btn" />
                            </div>
                        </div>
                    </div>
                </li>
                
                <li>
                    <div class="bookmark bookmark-1">
                        <img class="card-img-top" src="https://images.unsplash.com/photo-1428660386617-8d277e7deaf2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80" alt="Card image cap">
                        <div class="bookmark-text">
                            <h4 id="store-name">진미식당</h4>
                            <p class="store-info">간장게장, 마포맛집, 단체모임, 한식</p>
                            <div>
                                <p class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <p class="score">4.7</p>
                                </p>

                                <input type="submit" value="삭제" id="delete-btn" />
                            </div>
                        </div>
                    </div>
                </li>

                <li>
                    <button type="button" class="review-next review-preview" id="img_btn"><i class="fas fa-caret-left next"></i></button>
                    <button type="button" class="review-next review-next" id="img_btn"><i class="fas fa-caret-right next"></i></button>
                </li>
            </ul>
        </div>

        <div class="withdrawal showbox">
            <form>
                <h3>회원 탈퇴</h3>
                <div class="form-group">
                  <input type="password" class="form-control" id="formGroupExampleInput" placeholder="현재 비밀번호를 입력하세요." required>
                  <p>*현재 비밀번호가 일치하지 않습니다.</p>
                </div>
            </form>

            <input type="submit" value="탈퇴하기" id="password-update-btn"/>
        </div>
    </div>
    
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