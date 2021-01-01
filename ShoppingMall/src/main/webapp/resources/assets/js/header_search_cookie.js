/**
 * 
 */
	function search_cookies(url){
		$('.slist').html('');
		var search_cookies = Cookies.getJSON('query');
		if(search_cookies !=null){
			var html ='';
			//최근 검색한 쿠키를 먼저 꺼내기(역순) //최근 검색한 10개만 보여줄것 .
			for(i=search_cookies.length-1; i>0 ; i--){
				for(keys in search_cookies[i]){
					if(search_cookies[i][keys] !=''){
						html +='<li>';
						html +='<a class="'+search_cookies[i][keys]+'" href='+url+'/search?search-item='+search_cookies[i][keys]+'>'+search_cookies[i][keys]+'</a>';
						html +='<input type="button" class="cookie-btn" id='+search_cookies[i][keys]+' value="X">';
						html +='</li>';
					}
				}
			}
		}
		
		$('.slist').html(html);
	}
	function delete_cookie(name){
		
		console.log('11111111');
		
	}