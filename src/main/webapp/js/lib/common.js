//<![CDATA[

$(function(){
	
	// 센서정보 열기&닫기
	$(".poimarker").on("click", function(){
		$(".poiwrap").fadeIn(100);
		$(".poiwrap").css({left: x, top: y});
	});		
	$(".poiwrap .btn-close").on("click", function(){
		$(".poiwrap").fadeOut(100);
	});
	// 통합검색 키워드 창
	$(".btn-p-input").on("propertychange change keyup paste input", function(){
		var currentVal = $(this).val();
		if(currentVal !== "") {
			$('.keywordbox').fadeIn(300);
		} else {
			$('.keywordbox').fadeOut(300);
		}		
	});
	$(".btn-p-input, .keywordbox-close").on("blur", function(){
		$('.keywordbox').fadeOut(300);
	});
});

function fncCmmnMenuGo(url){
	location.href=url;
}

function goSearch(){					
	fncTotalSearch($("#totalSearchWord").val());
}

function goSearchSub(){					
	fncTotalSearch($("input[name=totalSearchWordSub]").val());
}

function fncTotalSearch(currentVal){
	$("#frmTotalSearch #searchKeywordF").val(currentVal);
	$("#frmTotalSearch").attr({"action": contextPath+"/data/bigDataListView.do?menuCode=M00000000007", "method": "post"}).submit();					
}

function fncFileDownload(path, filename) {
	$("#file_path").val(path);
	$("#file_nm").val(filename);
	$("#frmDownload").attr({"action": contextPath+"/cmm/fileDown.do", "method": "post"}).submit();
	setTimeout(fncFDCheck,1000);
}

$(document).ready(function () {
	
	// 메뉴 표시 초기화
//	$.initmenu = function(a,b,c){
//		var a = a - 1;
//		var b = b - 1;
//		var c = c - 1;
//		if ( a >= 0 ) {
//			$('.sidebar-menu li').removeClass("active");
//			$('.sidebar-menu').find('>li:eq('+a+')').addClass('active');
//			if (b >= 0 ) {
//				$('.sidebar-menu').find('>li:eq('+a+')>ul.treeview-menu>li:eq('+b+')').addClass('active');
//				if (c >= 0 ) {
//					$('.sidebar-menu').find('>li:eq('+a+')>ul.treeview-menu>li:eq('+b+')>ul.listwrap>li:eq('+c+')').addClass('active');
//				}
//			}
//		}
//	};
//	$.initmenu(mA,mB,mC);

	// 좌메뉴 영역 접힘/펼침 토글
	$(".left-handle").on("click", function(){
		$(".left-wrap").toggleClass("folded");
	});

	// 좌메뉴 영역 접힌 상태에서 1차 메뉴(아이콘) 클릭하면 좌메뉴 영역 펼쳐짐 
	$(".left-wrap .treeview").on("click", function(){
		$(".treeview, .treeview-menu");
		if ($(".left-wrap").hasClass("folded")) {
			$(".left-wrap").removeClass("folded");
		}
	});
	
	// 좌메뉴 1차 메뉴 접힘/펼침 토글
	$(".treeview > a").on("click", function(){
		if (!($(".left-wrap").hasClass("folded") && $(this).parent().hasClass("active"))) {
			$(this).parent().siblings(".treeview").removeClass("active");
			$(this).parent().toggleClass("active");
		}
	});
	
	// 좌메뉴 2차 메뉴 접힘/펼침 토글
	$(".treeview-menu > li > a").on("click", function(){
		$(this).parent().siblings("li").removeClass("active");
		$(this).parent().toggleClass("active");
	});
	
	// 좌메뉴 영역에서 마우스 벗어나면 현재 페이지로 메뉴 표시 초기화
	$(".left-wrap").on("mouseleave", function(){
		$(".treeview, .treeview-menu");
//		setTimeout(function() {
//			$.initmenu(mA,mB,mC);
//		}, 2000);
	});	

	// 윈도우 가로 크기가 1200 이하이면 메뉴 접힘
	function menuFold() {
		var width_size = window.outerWidth;
		if (width_size <= 1200) {
			$(".left-wrap").addClass("folded");
		}
	}
	menuFold();
	$(window).resize(function (){
		menuFold();
	});
	
	
	// 웹 접근성 처리 (탭키 이동)
	$('body').keyup(function(e) {
		var code = e.keyCode || e.which;
    	if (code == '9') {
			$('.left-wrap').on('focusin',function(){
				$(".left-wrap").removeClass("folded");
			});
			$('.left-wrap').on('focusout',function(){
				//$(".left-wrap").addClass("folded");
			});
			$('.treeview > a').on('focusin',function(){ 
				$(this).parent().addClass("on");
				$(this).next(".treeview-menu").addClass("on");
				$(this).parent().siblings(".treeview").removeClass("on");
			});
			$('.treeview > a').on('focusout',function(){ 
				$(this).parent().removeClass("on");
				$(this).next(".treeview-menu").removeClass("on");
			});
			$('.treeview-menu > li > a').on('focusin',function(){ 
				$(this).parent().parent().parent().addClass("on");
				$(this).parent().parent().addClass("on");
				$(this).parent().addClass("on");
			});
			$('.treeview-menu > li > a').on('focusout',function(){ 
				$(this).parent().parent().removeClass("on");
				$(this).parent().removeClass("on");
			});
			$('.treeview-menu > li > ul.listwrap > li > a').on('focusin',function(){ 
				$(this).parent().parent().parent().parent().parent().addClass("on");
				$(this).parent().parent().parent().parent().addClass("on");
				$(this).parent().parent().parent().addClass("on");
			});
			$('.treeview-menu > li > ul.listwrap > li > a').on('focusout',function(){ 
				$(this).parent().parent().parent().parent().removeClass("on");
				$(this).parent().parent().parent().removeClass("on");
			});
			$('.treeview:last-child > .treeview-menu:last-child > li:last-child > a').on('focusout',function(){ 
				$(".left-wrap").find("li").removeClass("on");
			});
			$('.bottom-wrap').on('focusin',function(){
				$(".bottom-wrap").removeClass("folded");
			});
			$('.bottom-wrap').on('focusout',function(){
				$(".bottom-wrap").addClass("folded");
			});
		}
	});

});
//]]>
