<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Template/registerhearder.jsp" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 

<!-- join_user_conditions.css 생성  -->
<style>
	.modal-backdrop fade in{
		height: 0;
	}
	#Modal,#myModal {
         display: none;
	    position: absolute;
	    margin: auto;
	    width: 500px;
	    height: 800px;
	    z-index: 1;
	    left: 37%;
	    top: 30%;
    }
        
    #Modal h2{
    	margin:0;
   	}
  
    #Modal .modal-content,#myModal .modal-body {
	    width:100%;
	    height : 500px;
	    margin:0px auto;
	    padding:20px 10px;
	    background:#fff;
	    overflow: scroll;
    }
    #Modal .modal-content,#myModal .modal-title {
    	width: 550px;
    	position: relative;
         
	}
	#Modal .modal-content,#myModal .modal-title .title {
		position: absolute;
		text-align: center;
		/* left: 10px; */
		width: 100%;
		font-size: 18px;
	}
	#Modal .modal-content,#myModal .modal-title .close {
    	position: absolute;
   		right: 30px;
         
	}
        
	#Modal .modal_layer ,#myModal .modal_layer{
    	position:fixed;
    	top:0;
    	left:0;
		width:100%;
   		height:100%;
    	background:rgba(0, 0, 0, 0.5);
     	z-index:-1;
	}
	#myModal .modal-header{
		position: relative;
		width: 520px;
		height: 46px;
		background: white;
		border-bottom: 1px solid black;
	}
	.modal-header >button{
		position: absolute;
		bottom: 0;
		right: 10px;
	}
	.wrap{
		width: 460px;
		margin: 0px auto;
	}
	.page_title{
		margin-bottom: 62px;
	}
	.page_title h1{
		font-size: 44px;
	}
	#agreeForm .agree-section{
		margin-bottom: 27px;
		border-bottom: 1px solid lightgray;
	}
	#agreeForm .agree-section .check_allbtn{
		width: 400px;
		height: 46px;
		display:block;
		position : relative;
		border:  2px solid lightgray;
		margin-bottom: 28px;
	}
	#agreeForm .agree-section .check_allbtn #select_all{
		position : absolute;
		left: 15px;    	
	}
	#agreeForm .agree-section .check_allbtn .label{
		position : absolute;
		left: 150px;
		height: 46px;
		line-height: 46px;
		font-size: 25px;    	
	}
	#agreeForm .agree-section .check_all_info{
		font-size: 15px;
	}
	#agreeForm .agree-section .check_all_info .text-bold{
		font-weight: bold;
	}
	.agree-group .agree-area .agree-title{
		margin-top : 36px;
		font-size: 20px;
	}
	.agree-group .agree-area .agree-list{
		margin-top : 36px;
		font-size: 20px;
		padding : 0;
	}
	.agree-group .agree-area .agree-list .agree-item{
		margin-bottom : 15px;
		display: inline-block;
	}
	.dsc-item {
	    font-size: 14px;
	    color: #666;
	}
    .content-bottom {
	    margin-top: 80px;
	}
	.content-bottom .bottom-btn.col-narrow{
		height: 62px;
	}
	.content-bottom .bottom-btn.col-narrow #backButton {
	    float: left;
	    width: 160px;
	    padding: 10px;
	    height: 62px;
	}
	.content-bottom .bottom-btn.col-narrow #btn_next {
	    float: right;
	    width: 288px;
	   height: 62px;
	}    
</style>

<!-- join_user_Conditions.js 생성 -->
<script>
	$('.step1').removeClass('on');
	$('.step2').addClass('on');
	$('.step3').removeClass('on');
	$('.step4').removeClass('on');
	$().ready(function(){
		var allcheck=false;
		
		function chk_onchage(){
			
		}
		// 체크박스가 변경되었을때 ????
		
		$('.check_allbtn').click(function(){
			if(allcheck ==false){
				$("input[name=agreeYn]:checkbox").each(function() {
					if($(this).is(':checked')==false){
						$(this).prop("checked", true);
						allcheck =true;
					}
					$('.check_allbtn').css('background-color','red');
					$('.check_allbtn').css('color','white');
					$('.check_allbtn').css('font-weight','bold');
					$('#btn_next').attr('disabled',false);
				});
				//$('input[name=agreeYn]:checkbox').attr('checked',true);
			}else{
				$("input[name=agreeYn]:checkbox").each(function() {
					if($(this).is(':checked')){
						$(this).prop("checked", false);
						allcheck =false;
						
					}
					$('.check_allbtn').css('background-color','white');
					$('.check_allbtn').css('color','black');
					$('.check_allbtn').css('font-weight','inherit');
					$('#btn_next').attr('disabled',true);
				});
				
			}
		});
		
		$('.test').click(function(){
			$('.test').each(function(){
				if($(this).is(':checked')){
					$('#btn_next').attr('disabled',false);
					
				}else{
					$('#btn_next').attr('disabled',true);
				}
			})
		});
		
	});
</script>


	<div class="wrap">
		<div class="wrap_content">
			<div class="page_title">
				<h1>가입 약관 동의</h1>
			</div>
			<form id="agreeForm" name="agreeForm" method="post" action="memberRegisterPage">
				<div class="agree-section">
					<span class="check_allbtn">
						<i class="fas fa-check fa-3x" id="select_all"></i>
						<label for="select_all" class="label">
							모두 동의
						</label>		
					</span>
					<p class="check_all_info">
						모두 동의는 필수 및 선택 정보에 대한 동의도 포함되어 있으며, 개별적으로도 동의를 선택하실수 있습니다.
						<em class="text-bold">선택 항목에 대한 동의를 거부하시는 경우에도 서비스는 이용이 가능합니다.</em>
					</p>
				</div>
				<div class="agree-group">
					<div class="agree-area">
						<h3 class="agree-title">
							아이디 
							<span class="sub">이용약관, 개인정보 수집이용 동의</span>
						</h3>
						<ul class="agree-list">
							<li class="agree-item">
								<div class="agree-item-title">
									<span class="c-ick">
										<input type="checkbox" name="agreeYn" id="agreeYn01" class="test">
										<label for="link_agree01" class="agree01">
											아이디 이용약관 동의 (필수)
										</label>
									</span>
									<button type="button" class="btn-more" id="link_agree01"  data-remote="agree01" data-toggle="modal" data-target="#myModal">
										<span class="ico-arrow">상세보기</span>
									</button>
								</div>
								
							</li>
							<li class="agree-item">
								<div class="agree-item-title">
									<span class="c-ick">
										<input type="checkbox" name="agreeYn" id="agreeYn02" class="test">
										<label for="link_agree02" class="agree02">
											아이디 개인 정보 수집/이용 동의(필수)
										</label>
									</span>
									<button type="button" class="btn-more" id="link_agree02"  data-remote="agree02" data-toggle="modal" data-target="#myModal">
										<span class="ico-arrow">상세보기</span>
									</button>
								</div>
								
							</li>
							<li class="agree-item">
								<div class="agree-item-title">
									<span class="c-ick">
										<input type="checkbox" name="agreeYn" id="agreeYn03" class="test">
										<label for="link_agree03" class="agree03">
											제 3자 정보 제공(필수)
										</label>
									</span>
									<button type="button" class="btn-more" id="link_agree03"  data-remote="agree03" data-toggle="modal" data-target="#myModal">
										<span class="ico-arrow">상세보기</span>
									</button>
								</div>
								
							</li>
							<li class="agree-item">
								<div class="agree-item-title">
									<span class="c-ick">
										<input type="checkbox" name="agreeYn" id="agreeYn04">
										<label for="link_agree04" class="agree04">
											아이디 광고성 정보 수신 동의(선택)
										</label>
									</span>
									<button type="button" class="btn-more" id="link_agree04"  data-remote="agree04" data-toggle="modal" data-target="#myModal">
										<span class="ico-arrow">상세보기</span>
									</button>
								</div>
								
							</li>
							<li class="agree-item">
								<div class="agree-item-title">
									<span class="c-ick">
										<input type="checkbox" name="agreeYn" id="agreeYn05">
										<label for="link_agree05" class="agree05">
											아이디 개인 정보 수집 이용 동의(선택)
										</label>
									</span>
									<button type="button" class="btn-more" id="link_agree05"  data-remote="agree05" data-toggle="modal" data-target="#myModal">
										<span class="ico-arrow">상세보기</span>
									</button>
								</div>
								
							</li>
						</ul>
					</div>
				</div>
				<p class="dsc-item">* 약관 제목을 누르면 관련 내용을 모두 확인할 수 있습니다.</p>
				<div class="content-bottom">
						<div class="bottom-btn col-narrow">
							<button id="backButton" type="button">취소</button>
                            <button type="submit" class="btn-secondary" id="btn_next" disabled="disabled">동의</button>
						</div>
					</div>
			</form>
		</div>
	</div>
	
	<!-- join_user_conditions_modal.js 만들기 -->
	
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header" data-backdrop="static">
			<!-- data-dismiss="modal" -->
		<div class="modal-title" data-backdrop="static">
			<h1 class="title">안녕하세요</h1>
			<button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
				<i class="fas fa-times fa-3x"></i>
			</button>
		</div>   	
			
		</div>
		<div class="modal-body" data-backdrop="static">
				    
		</div>
		
				  
		<div class="modal_layer" data-backdrop="static"></div>
	</div>
	<script>
		$().ready(function(){
			setInterval(() => {
				if($('.modal-backdrop').val()==''){
					$('.modal-backdrop').remove();
				}	
			}, 500);
		});
			$('#myModal').on('show.bs.modal',function(e){
				var button = $(e.relatedTarget);
				var modal = $(this);
				var class_remote = button.data("remote");
				modal.find('.modal-body').load(button.data("remote"));
				$('.title').text($('.'+class_remote).text().trim());  
			});
			
	</script>  
</body>
</html>