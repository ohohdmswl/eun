<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- header -->
<%-- <jsp:include page="/WEB-INF/jsp/eun/main/layout/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/jsp/eun/main/layout/header.jsp"%>
<%@ include file="/WEB-INF/jsp/eun/main/layout/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="css/zTreeStyle.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="css/main.css"/>">

<h6>통계화면</h6>







<!-- content -->
<!-- 
<div class="content flex flexCol">

	<div class="ifrDiv">
		<iframe src="https://www.youtube.com/embed/Rrf8uQFvICE" width="300px", height=200px>
		  <p>사용 중인 브라우저는 iframe을 지원하지 않습니다.</p>
		</iframe>
	</div>
	
	<div class="ifrDiv">
		<iframe id="ifrm1" src="https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1IN1502&vw_cd=MT_ZTITLE&list_id=A11_2015_1_10_10&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=MT_ZTITLE&path=%252FstatisticsList%252FstatisticsListIndex.do" width="1000px", height=200px>
		  <p>사용 중인 브라우저는 iframe을 지원하지 않습니다.</p>
		</iframe>
	</div>

	<div class="ifrDiv">
		<iframe id="ifrm2" src="https://www.naver.com/" width="300px", height=200px>
		  <p>사용 중인 브라우저는 iframe을 지원하지 않습니다.</p>
		</iframe>
	</div>

</div>
-->







</body>

<script>

//데이터 전송
//data: 전달할 메시지나 데이터
//ports: 메시지 포트(생략가능)
//targetOrigin: 타겟 도메인, 특정 도메인이 아니면 * 사용 가능
// => window.postMessage(data, [ports], targerOrigin)
// window.postMessage(data, [ports], targerOrigin)

//데이터 수신
// window.onmessage = function(e){
// 	if(e.origin === "https://보낸곳의도메인주소"){
// 		처리
// 		console.log(e.data);
// 	}
// }
//그외 데이터 수신
//window.addEventListener("message", 컨트롤함수, true);
//window.attachEvent("onmessage", 컨트롤함수);


// window.addEventListener('message', function(e) {
//   console.log(e.data); // { hello: 'parent' }
//   var item = localStorage.getItem('dummy');
//   console.log(item); // zerocho
//   document.getElementById('ifrm').contentWindow.postMessage(item, '*');
// });



// window.onload = function() {

//   console.log('child load');  
  
  //targetWindow.postMessage(message, targetOrigin, [transfer]);
//   window.parent.postMessage({ childData : 'test data' }, 'http://abc.com');
  
  //모든 도메인에 대해서 허용하고자 하는 경우 targetOrigin(두번째인자) 인자를 '*'로 작성
  //보안을 위해 추천하지 않음
//   window.parent.postMessage({ childData : 'test data' }, '*');
  
// };



// window.postMessage({ childData : 'test data' }, "*");

//데이터 수신
// window.onmessage = function(e){
// 	if(e.origin === "*"){
// 		// 처리
// 		console.log(e.data);
// 	}
// }


var iframeWindow = document.getElementById(‘ifrm1’).contentWindow;
iframeWindow.postMessage(‘hello’, ‘*');

		window.addEventListener(‘message’, function (e) {
			  if (e.origin === ‘*') {
			    console.log(e.data); //—> ‘hello’가 출력된다.
			    e.source.postMessage(‘hi’, ‘*');
			  }
			});
		
		

		
		

</script>

</html>