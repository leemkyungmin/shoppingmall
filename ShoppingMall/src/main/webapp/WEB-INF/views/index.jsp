<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Template/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
	<script>
	$(function(){
		  var $slider = $('.slider'),
		      $firstSlide = $slider.find('li').first() // 첫번째 슬라이드
		  .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기

		  function PrevSlide(){ // 이전버튼 함수
		    var $lastSlide = $slider.find('li').last() //마지막 슬라이드
		    .prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
		    $secondSlide = $slider.find('li').eq(1)
		   //두 번째 슬라이드 구하기
		   .stop(true).animate({'opacity':0},400); //밀려난 두 번째 슬라이드는 fadeOut 시키고
		    $firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
		    .stop(true).animate({'opacity':1},400);
		    //새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
		  }
		  function NextSlide(){ // 다음 버튼 함수
		    $firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
		    .appendTo($slider); // 맨 마지막으로 보내기
		    var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
		    .stop(true).animate({'opacity':0},400); // fadeOut시키기
		    $firstSlide = $slider.find('li').first()
		    // 맨 처음 슬라이드
		    .stop(true).animate({'opacity':1},400);
		    // fadeIn 시키기
		  }
		  
		  $('#next').on('click', function(){ //다음버튼 클릭
		    NextSlide();
		  });
		    $('#prev').on('click', function(){ //이전 버튼 클릭하면
		    PrevSlide();
		  });
		  
		  setInterval(NextSlide, 5000); //자동 슬라이드 설정
		  
		  
		  
		  
		});
	</script>
  <div class="wrap">
  	<ul class="slider">
    <c:forEach var="bimg" items="${bdto}">
	    <li>
	      <div>
	        <img alt="${bimg.bFileinfo }" src="resources/assets/images/bannerImg/${bimg.bFilename}">
	        <dl class="right">
	          <dt></dt>
	          <dd></dd>
	        </dl>
	      </div>
	    </li>
    </c:forEach>
    
  </ul>
  <div class="btn">
    <button type="button" id="prev"><</button>
    <button type="button" id="next">></button>
  </div>

	
	<div class="user_main">
		<div class="recent_products">
			<div class="recent_product_info">
				<h1>최근 본 상품 추천상품</h1>
			</div>		
		</div>
	</div>
  </div>
  
		
	
	
<%@ include file="Template/fotter.jsp" %>
