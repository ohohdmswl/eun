	// pageObj:페이지 표시할 Element, totalData:총 데이터 수, dataPerPage:한 페이지에 나타낼 게시글 수, pageCount:페이징에 나타낼 페이지 수, currentPage:현재 페이지	
	function pagination(pageObj, totalData, dataPerPage, pageCount, currentPage) {
		// console.log("currentPage : " + currentPage);

		totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
		  
		if(totalPage<pageCount){
			pageCount=totalPage;
		}
		  
		var pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
		var last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
		  
		if (last > totalPage) {
			last = totalPage;
		}

		var first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
		var next = last + 1;
		var prev = first - 1;

		var pageHtml = "";
		
		// console.log("pageGroup:" + pageGroup);
		
		if(pageGroup != Infinity && pageGroup > 1){
			pageHtml += "<li><a href='#' id='first'>≪</a>&#160;</li>";
		}

		if (prev > 0) {
			pageHtml += "<li><a href='#' id='prev'>＜</a>&#160;</li>";
		}

		//페이징 번호 표시 
		for (var i = first; i <= last; i++) {
			if (currentPage == i) {
				pageHtml += "<li><a href='#' class=\"active\" id='" + i + "'>" + i + "</a>&#160;</li>";
			} else {
				pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a>&#160;</li>";
			}
		}

		if (last < totalPage) {
			pageHtml += "<li><a href='#' id='next'>＞</a>&#160;</li>";	
		}
		
		if(totalPage > 0 && last < totalPage){		
			pageHtml += "<li><a href='#' id='last'>≫</a>&#160;</li>";
		}

		$(pageObj).html(pageHtml);

		// 페이징 번호 클릭 이벤트 
		$(pageObj + " li a").click(function () {
			let $id = $(this).attr("id");
			selectedPage = $(this).text();

			if ($id == "next") selectedPage = next;
			if ($id == "prev") selectedPage = prev;
			if ($id == "first") selectedPage = 1;
			if ($id == "last") selectedPage = totalPage;
		    
			fncSearch(selectedPage);
		});
	}
	
	// pageObj:페이지 표시할 Element, totalData:총 데이터 수, dataPerPage:한 페이지에 나타낼 게시글 수, pageCount:페이징에 나타낼 페이지 수, currentPage:현재 페이지	
	function paginationCtzn(pageObj, totalData, dataPerPage, pageCount, currentPage) {
		// console.log("currentPage : " + currentPage);

		totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
		  
		if(totalPage<pageCount){
			pageCount=totalPage;
		}
		  
		var pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
		var last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
		  
		if (last > totalPage) {
			last = totalPage;
		}

		var first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
		var next = last + 1;
		var prev = first - 1;

		var pageHtml = "";
		
		if(pageGroup != Infinity && pageGroup > 1){
			pageHtml += "<li class=\"img\"><a href=\"javascript:void(0);\" id=\"first\"><img src=\"/images/ctzn/img_page_first.png\" alt=\"맨처음\"></a></li>";
		}

		if (prev > 0) {
			pageHtml += "<li class=\"img\"><a href=\"javascript:void(0);\" id=\"prev\"><img src=\"/images/ctzn/img_page_prev.png\" alt=\"이전\"></a></li>";
		}

		//페이징 번호 표시 
		for (var i = first; i <= last; i++) {
			if (currentPage == i) {
				pageHtml += "<li><a href='javascript:void(0);' class=\"active\" id='" + i + "'>" + i + "</a></li>";
			} else {
				pageHtml += "<li><a href='javascript:void(0);' id='" + i + "'>" + i + "</a></li>";
			}
		}

		if (last < totalPage) {
			pageHtml += "<li class=\"img\"><a href=\"javascript:void(0);\" id=\"next\"><img src=\"/images/ctzn/img_page_next.png\" alt=\"다음\"></a></li>";	
		}
		
		if(totalPage > 0 && last < totalPage){		
			pageHtml += "<li class=\"img\"><a href=\"javascript:void(0);\" id=\"last\"><img src=\"/images/ctzn/img_page_last.png\" alt=\"마지막\"></a></li>";
		}

		$(pageObj).html(pageHtml);

		// 페이징 번호 클릭 이벤트 
		$(pageObj + " li a").click(function () {
			let $id = $(this).attr("id");
			selectedPage = $(this).text();

			if ($id == "next") selectedPage = next;
			if ($id == "prev") selectedPage = prev;
			if ($id == "first") selectedPage = 1;
			if ($id == "last") selectedPage = totalPage;
		    
			fncSearch(selectedPage);
		});
	}