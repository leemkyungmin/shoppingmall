$().ready(function(){
			$('.user').click(function(){
				if(!$(this).hasClass('selected')){
					$(this).addClass('selected');
					$('.dept').removeClass('selected');
				}
				$('#type').val('user');
			});
			$('.dept').click(function(){
				if(!$(this).hasClass('selected')){
					$(this).addClass('selected');
					$('.user').removeClass('selected');
				}
				$('#type').val('dept');
			});
			
			$(document).on('click','#login',function(){
				
				var id = $('#id');
				var pw =$('#pw');
				var type =$('#type').val();
				if(id .val()==''){
					alert('아이디를 입력해주세요');
					id.focus();
				} else if(pw.val() ==''){
					alert('비밀번호를 입력해주세요');
					pw.focus();
				} else{
					
					$.ajax({
						url:'${pageContext.request.contextPath}/product/buy/loginchk',
						type:'post',
						data:'id='+id.val() + '&pw='+pw.val() +'&type='+type,
						success:function(data){
							
							if(data ==0){
								alert('로그인 실패'); 
							} else { 
								
								opener.$('#fm').submit();
								window.close();
								
							}
						} ,error:function(){
							alert('통신실패');
						}
					});
				}
				
				
			});
			
		});