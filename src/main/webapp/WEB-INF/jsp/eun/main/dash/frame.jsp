<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<h6>iframe</h6>

		<iframe id="ifrm1" src="https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1IN1502&vw_cd=MT_ZTITLE&list_id=A11_2015_1_10_10&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=MT_ZTITLE&path=%252FstatisticsList%252FstatisticsListIndex.do" width="1000px", height=200px>
		  <p>사용 중인 브라우저는 iframe을 지원하지 않습니다.</p>
		</iframe>

	
window.onmessage = function(e){

  if(e.origin === "*"){

     alert(e.data);

  }

}
