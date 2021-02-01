$(document).ready(function(){
		
		$('#loginbtn').click(function(){
			var id =$('#id');	
			var pw =$('#pw'); 
			if(id.val() ==''){
				alert('아이디를 입력해주세요');
				id.focus();
			}else if(pw.val() =='' || pw.length >20 || pw.val() <6 ){
				alert('비밀번호를 확인해주세요');
				pw.focus();
			}else{
				$.ajax({
					url : 'loginchk',
					type : 'post',
					data : 'uSerid=' + id.val() + '&uPw=' + pw.val() +'&type='+$('#type').val(),
					success : function(data){
						if(data =='1'){
							alert('로그인 성공');
							location.href= 'index';
						} else if(data =='-1') {
							alert('이용이 중지된 아이디 입니다.');
							id.val('');
							pw.val('');
						} else {
							alert('아이디 비밀번호를 확인해주세요');
							pw.focus();
							pw.val('');
						}
					},
					error : function(){
						alert('ajax통신 실패');
					}
				});
			}
		}); 
		$('#dept_login').click(function(){
			$('#type').val('dept');
			$('.dept-border').css({'background' : 'yellow'});
			$(this).css({'background' : 'yellow',"font-weight" : "bold"});
			$('.user-border').css({'background' : 'white'});
			$('#user_login').css({'background' : 'white',"font-weight" : "normal"});
		});
		$('#user_login').click(function(){
			$('#type').val('user');
			
			$(this).css({'background' : 'yellow',"font-weight" : "bold"});
			$('.user-border').css({'background' : 'yellow'});
			$('.dept-border').css({'background' : 'white'});
			$('#dept_login').css({'background' : 'white',"font-weight" : "normal"});
		});
	});