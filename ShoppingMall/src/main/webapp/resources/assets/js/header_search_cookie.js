/**
 * 
 */
	function search_cookies(){
		$('.slist').html('');
		var search_cookies = Cookies.getJSON('query');
		var html ='';
		//최근 검색한 쿠키를 먼저 꺼내기(역순) //최근 검색한 10개만 보여줄것 .
		for(i=search_cookies.length-1; i>0 ; i--){
			for(keys in search_cookies[i]){
				if(search_cookies[i][keys] !=''){
					html +='<li>';
					html +='<a href="search?search-item='+search_cookies[i][keys]+'">'+search_cookies[i][keys]+'</a>';
					html +='<button id='+search_cookies[i][keys]+'>x</button>';
				}
			}
		}
		$('.slist').html(html);
	}