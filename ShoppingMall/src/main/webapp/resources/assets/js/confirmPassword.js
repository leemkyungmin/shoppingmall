$().ready(function(){
		
		$('#pw_btn').click(function(){
			
			var pw = $('#pw');
			
			if(pw.val().length >0){
				$.ajax({
					url : '${pageContext.request.contextPath}/my/pwChk',
					type : 'POST',
					data :'pw='+pw.val(),
					success :function(data){
						if(data ==1){
							location.href='${pageContext.request.contextPath}/my/myPage';
						} else {
							alert('비밀번호가 틀립니다.');
							pw.val('');
							pw.focus();
						}
					}, error :function(){
						alert('서버 오류');
					}
				});
			}
			
			
		});
		
	});