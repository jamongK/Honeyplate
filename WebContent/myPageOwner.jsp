<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.text.DecimalFormat"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>사업자 마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b36a7fe661.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/myPageOwner.js"></script>
<script src="<%= request.getContextPath() %>/js/newTpl.js"></script>

<!-- CSS here -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myPageOwner.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/newTpl.css">

<%
	String showMenu = (String)session.getAttribute("showMenu");
	if(showMenu != null) session.removeAttribute("showMenu");
	
	Reservation resv = 	(Reservation)request.getAttribute("reservation");
	
	String msg = (String)session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");//1회 사용후 폐기
%>
<script>

$(function(){
	
//session에서 받아온 값 기준으로 어떤 div를 보여줄지 정합니다.
if('<%=showMenu%>' == 'reservationList'){
	$(".showbox").hide();
	$(".reservation-list").show();
		 
}else if('<%=showMenu%>' == 'reservationTable'){
	$(".showbox").hide();
	$("#show-reservation").click();
}

//msg를 출력합니다.
<%if(msg != null) {%>
	alert("<%=msg%>"); 
<%}%>
	
var resvPageNum = 1; //페이지바 현재 페이지
var numPerPage = 10; //몇 개의 리스트를 출력할지
var pageStart = 1; //페이지바의 시작값
 
 $("#show-reservation").click(function(){

	 $.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/reservation/listOwner",
			data:{pageNum:resvPageNum},
			dataType:"json",
		
			success:function(data){
				$("#reservation-table-body").html("");
				
				var flag = false;
				var start = (resvPageNum -1) * numPerPage;
				var maxNum = (resvPageNum  * 10) - 1;
				
				for(var i = 0; i < data.length; i++){
					if(!flag){
						
						console.log('start' + start);
						i += start;
						console.log('i' + i);
						flag = true;
					}
			
					if(i > maxNum){
						console.log(i)
						console.log(maxNum);
						//페이지 10개씩 출력 그 이상은 다음페이지로
						break;
					}
					
					var order = data[i];
					var date = new Date(order.rsvDate);
					var strDate = getDateStr(date,date.getDay());
					var status = order.reservationStatus;
					var deposit = order.depositYn;
					var text = "";
					
					if((status == null || status == 'N' || deposit == "N" ) 
						&& compareDate(date)){
						//예약이 승인되지않았고, 결제도 하지 않은 상태에서 예약일이 지난날일때 예약 취소 출력
						text ="예약 취소";
					
					}else if(status == null){
						text ="수락 대기중";
					
					}else if(status == 'N'){
						text ="예약 거절";
					
					}else if(deposit == "N"){
						text ="결제 대기중";
						
					}else if(deposit == "Y"){
						text ="결제 완료";
					}

					var html = "<tr>";				
					html += "<td>" + text + "</td>";
					html += "<td><a  style='color: #333333;'"
					html += "href="
					html +="<%=request.getContextPath()%>/reservation/listDetailsOwner?reservationNo=" + order.reservationNo;
					html += ">" + order.memberId + "</a></td>"; 
					html += "<td>" + strDate + "</td>";
					html += "<td>" + order.noShow + '회' + "</td>";
					html += "</tr>";

					$("#reservation-table-body").append(html);			
				}
				
				//페이지바 만드는곳 
				var pageBarSize = 3;
				var pageEnd = pageStart + pageBarSize - 1;
				var pageNo = pageStart;
				var totalPage = Math.ceil(data.length / numPerPage);
				
				$(".pagination").html("");
				if(data.length >= 10){

					var nav = "<li class='page-item'>" 
					nav += "<button class='page-link' aria-label='Previous'>"
					nav += "<span aria-hidden='true'>&laquo;</span>"
					nav += " <span class='sr-only'>Previous</span></button></li>"
					$(".pagination").append(nav);
					
					nav = '';
					
					while(pageNo <= pageEnd && pageNo <= totalPage) {
						nav += "<li class='page-item'><button class='page-link' style='color: #FF9800'>" +  pageNo  +"</button></li>"
						pageNo++;
					}
					
					if(pageNo <= totalPage){
						nav += "<li class='page-item'>";
						nav += "<button class='page-link' href='#' aria-label='Next'>";
						nav += "<span aria-hidden='true'>&raquo;</span>";
						nav += "<span class='sr-only'>Next</span></button></li>"
						
					}									
					
					$(".page-item").after(nav);
				}
			},
			error:function(xhr,status,error){
				alert("조회를 실패했습니다.");
			}
		
		}); //end of ajax
		
 });//end of $("#show-reservation").click

 
 //페이지바 클릭시 새로운 리스트 출력됨.
 $(".pagination").click(function(e){
	 var $btn = $(e.target);
	 var page = $btn.text();
	 
	 if(page.indexOf('«') != -1){
		 
 		 if(resvPageNum == pageStart && resvPageNum != 1)
			 pageStart = pageStart - 3;
		 
		resvPageNum = resvPageNum != 1 ? --resvPageNum : resvPageNum;
		 
	 }else if(page.indexOf('»') != -1){
		 
		 if(resvPageNum % 3 == 0)
			 pageStart += 3;
		 
		++resvPageNum;
	 }else{
		 resvPageNum = $btn.text();
	 }

	 $("#show-reservation").click();
 });//end of $(".pagination").click
 
 
 //수락 버튼
 $("#approval-btn").click(function(){
	 
	 <%if(resv != null){%>
		if("<%=resv.getReservationStatus()%>" == 'Y'){
			alert("이미 수락하신 예약입니다.");
			return;
		
		}else if("<%=resv.getReservationStatus()%>" == 'N'){
			alert("이미 거절하신 예약입니다.");
			return;
		
		}else if("<%=resv.getDepositYn()%>" == 'Y'){
			alert("이미 결제된 예약입니다.");
			return;
		}
		 
		$("#resv-form").submit();
	 <%}%>
 });
 
 //거절 버튼
 $("#refusal-btn").click(function(){
	 
	 <%if(resv != null){%>
		if("<%=resv.getReservationStatus()%>" == 'Y'){
			alert("이미 수락하신 예약입니다.");
			return;
		
		}else if("<%=resv.getReservationStatus()%>" == 'N'){
			alert("이미 거절하신 예약입니다.");
			return;
		
		}else if("<%=resv.getDepositYn()%>" == 'Y'){
			alert("이미 결제된 예약입니다.");
			return;
		}
		
		//hidden 사용해서 boardNo 넘김
		//ReservationStatusRequestRefusalServlet 에서 거절 기능 만들어주시면 됩니다.
		$("#resv-form").attr("<%=request.getContextPath()%>/reservation/request/statusRefusal")	
					   .submit();
	 <%}%>
 });




	 
});

//date값 받아서 string값으로 리턴하는 메소드
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

//현재날짜와 예약날짜 비교하는 메서드
function compareDate(date){
	var now = new Date();
	var a = now.getTime();
	var b = date.getTime();
	
	return a > b;
}
</script>
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
                    <button href="" id="show-reservation">내 가게 예약요청</button>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <button href="" id="show-bookmark">내 식당</button>
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
                    <th>사업자 회원</th>
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
                    <td>사업자번호</td>
                    <td>0101234621234</td>
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
                    <td>사업자번호</td>
                    <td>0101234621234</td>
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
        <div class="reservation-table showbox">
            <table class="table">
                <thead >
                  <tr>
                    <th scope="col">수락여부</th>
                    <th scope="col">예약자</th>
                    <th scope="col">시간</th>
                    <th scope="col">노쇼</th>
                  </tr>
                </thead>
                <tbody id="reservation-table-body">
					
                </tbody>
              </table>
        </div>
        <nav aria-label="reservation-table showbox Page navigation example" class="">
                <ul class="pagination">
                  <li class="page-item page-first">

                  </li>
                </ul>
        </nav>
          
 
        <div class="reservation-list showbox"style="display:none">
            <button id="reservation-close">
                <i class="far fa-times-circle"></i>
            </button>
            
            <ul>
            	<%if(resv != null) {%>

            	<li>
            		<form action="<%=request.getContextPath()%>/reservation/request/status" method="post" id="resv-form">
	                    <input type="hidden" name="resv-board-no" value="<%=resv.getReservationNo()%>" />
            		</form>
                    
                    <i class="fas fa-portrait"></i>
                    <p>예약자 아이디 : </p>
                    <p><%=resv.getMemberId() %></p>
                </li>
                <li>
                    <i class="fas fa-exclamation-circle"></i>
                    <p>노쇼 : </p>
                    <p><%=resv.getNoShow() %>회</p>
                </li>
                <li>
                    <i class="fas fa-calendar-day"></i>
                    <p>예약 날짜 : </p>
                    <p><%=resv.timestampToString()%></p>
                </li>
                <li>
                    <i class="fas fa-phone-square-alt"></i>
                    <p>예약자 전화번호 : </p>
                    <p><%=resv.getReservationPhone()%></p>
                </li>
                <li>
                    <i class="fas fa-child"></i>
                    <p>어린이 인원 : </p>
                    <p><%=resv.getChild()%>명</p>
                </li>
                <li>
                    <i class="fas fa-user"></i>
                    <p>어른 인원 : </p>
                    <p><%=resv.getAdult()%>명</p>
                </li>
                <li>
                
                <% 
                    int sum = (resv.getChild() + resv.getAdult()) * 5000;
                	DecimalFormat df = new DecimalFormat("#,###");
                 %>
                    <i class="fas fa-won-sign"></i>
                    <p>결제 금액 : </p>
                    <p><%=df.format(sum) %></p>
                </li>
                <%} %>
            </ul>

            <div class="pageBar">
                <input type="button" value="승인" id="approval-btn" />
                <input type="button" value="거절" id="refusal-btn" />
            </div>
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
