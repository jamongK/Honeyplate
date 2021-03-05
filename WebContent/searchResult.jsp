<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 마이페이지, 식당정보 페이지 등 랜딩페이지를 제외한 나머지 페이지에 쓰이는 템플릿입니다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>searchResult</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/b36a7fe661.js" crossorigin="anonymous"></script>
<script src="js/newTpl.js"></script>

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/images/favicon/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/searchResult.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/newTpl.css">

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
            <a href="index.html"><img src="images/logo/hplogo.png" alt="logo image(honey jar)"><span class="logo-text">Honey Plate</span></a>
        </div>
        <nav id="navigation">
            <a href="#">Sign in</a>
            <a href="#" class="signup">Sign up</a>
        </nav>
    </header>
    
	<section>
	   <!--검색바-->
        <div class="wrap">
            <form class="search">
                <input type="text" class="searchTerm" id="searchTermcss" placeholder="지역, 식당, 음식, 해시태그로 검색해보세요!" >
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </form>
        </div>
    
<h2 id="key-word">'키워드' 검색 결과</h2>
  
<br>
  
  
  
  
  <!--검색목록-->
<div class="result-container">

  <div class="row">
    <div class="col-2">
    </div>
    <div class="col-4">
      <div class="card" style="width: 18rem;">
        <img src="http://placehold.it/260x180" class="card-img-top" alt="...">
        <div class="card-body">
          <p class="card-text">Somethe 식당소개 content.</p>
        </div>
      </div>
    </div>
    <div class="col-4">
      <div class="card" style="width: 18rem;">
        <img src="http://placehold.it/260x180" class="card-img-top" alt="...">
        <div class="card-body">
          <p class="card-text">Somethe 식당소개 content.</p>
        </div>
      </div>
    </div>
    <div class="col-2">
    </div>
  </div>

  <div class="row">
    <div class="col-2">
    </div>
    <div class="col-4">
      <div class="card" style="width: 18rem;">
        <img src="http://placehold.it/260x180" class="card-img-top" alt="...">
        <div class="card-body">
          <p class="card-text">Somethe 식당소개 content.</p>
        </div>
      </div>
    </div>
    <div class="col-4">
      <div class="card" style="width: 18rem;">
        <img src="http://placehold.it/260x180" class="card-img-top" alt="...">
        <div class="card-body">
          <p class="card-text">Somethe 식당소개 content.</p>
        </div>
      </div>
    </div>
    <div class="col-2">
    </div>
  </div>
  
</div>

<br>


<!-- 페이지바 -->
<nav aria-label="numbering">
  <ul class="pagination" id="pagination">
      
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>

    <li class="page-item"><a class="page-link" href="#">1</a>
    </li>

    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">2</a>
    </li>

    <li class="page-item"><a class="page-link" href="#">3</a>
    </li>

    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
<br>
<br>
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