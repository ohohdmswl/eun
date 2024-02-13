//<![CDATA[
$(function(){
	$("#cntntsUl").find("li").click(function(){
		$("#cntntsUl").find("li").removeClass("active");
		$(this).addClass("active");
		
		$("#cntntsDiv").find("div").hide();
		$("#cntntsDiv").find("div").eq($(this).index()).show();
	});
});
//]]>