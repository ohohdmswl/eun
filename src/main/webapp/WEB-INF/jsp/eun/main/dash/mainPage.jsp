<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header -->
<%-- <jsp:include page="/WEB-INF/jsp/eun/main/layout/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/jsp/eun/main/layout/header.jsp"%>
<%@ include file="/WEB-INF/jsp/eun/main/layout/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="css/zTreeStyle.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="css/main.css"/>">


<h6>안녕 나는 메인페이지야</h6>

	<div class="zTreeDemoDiv mb40">
		<ul id="treeDemo" class="ztree"></ul>
	</div>

	<form id="frm" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="parent_sn" id="parent_sn" value="" />
		<input type="hidden" name="my_sn" id="my_sn" value="" />
		<input type="hidden" name="day_wrtr" id="day_wrtr" value="" />
		<input type="hidden" name="day_wrtday" id="day_wrtday" value="" />
		<input type="hidden" name="newName" id="newName" value="" />
	
		<!-- 변경할 새로운 이름 input id = "nm" -->
		<!-- <input type="hidden" name="nm" id="nm" value="" /> -->
		
		<div class="btn mb20">
		<!-- 선택한 파일 다운로드 -->
		<button type="button" class="" onclick="javascript:fncFileDown();">다운로드</button>
		</div>
		
		
		<div class="btn mb20">
		<!-- 선택한 노드 삭제 -> 그룹명 삭제시 해당 그룹노드 포함 하위 그룹노드, 파일 모두 삭제
						 -> 노드만 있는 경우에 노드만 삭제 (위의 조건에서 분기하면 되지 않을까? 자식 체크해서) -->
		<button type="button" class="" onclick="javascript:fncNodeDel();">[노드]삭제</button>
		</div>
		
		<div class="btn mb20">
		<!-- 선택한 파일 삭제 -> 해당 파일 삭제
										-> 그룸노드 하위에 파일이 1개 이상 (그룹노드 그대로 유지)
										-> 그룹노드 하위에 파일이 0개 
																	-> 그룹노드 같이 삭제
																	-> 그룹노드 유지)  -->
		<button type="button" class="" onclick="javascript:fncFileDel();">[파일]삭제</button>
		</div>
		
		<div class="btn mb20">
<!-- 		<input type="text" id="nm" name="nm" title="그룹정보명" maxlength="100" /> -->
		<!-- 선택한 노드명 변경 -> 선택한 노드명만 변경 -->
<!-- 		<button type="button" class="" onclick="javascript:fncBefNordRename();">[노드]정보명변경</button> -->
		<button type="button" class="" onclick="javascript:fncNodeNmUpdt();">[노드]정보명변경</button>
<!-- 		<button type="button" class="" onclick="javascript:fncNordRename();">[노드]정보명변경</button> -->
		</div>
		
		<div class="btn mb20">
<!-- 		<input type="text" id="file_nm" name="file_nm" title="파일명" maxlength="100" /> -->
		<!-- 선택한 파일명 변경 -> 선택한 파일명만 변경 -->
		<button type="button" class="" onclick="javascript:fncFileNmUpdt();">[파일]정보명변경</button>
		</div>
		
		
		<!-- tb div -->
		<div>
			<table class="table">
				<colgroup>
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th>그룹명</th>
						<td>
							<input type="text" id="nm" name="nm" title="그룹정보명" maxlength="200" />
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td></td>
					</tr>
				</tbody>
				
			</table>
		</div>
		
	
	</form>





</body>

	<SCRIPT type="text/javascript">
		
		var setting = {
				data: {
					simpleData: {
						enable: true		//간단한 데이터 형식을 허용 여부(default : false)
					}
				},
				view: {
// 					dblClickExpand: false	//더블클릭 - 폴더열기(하위노드 펼침)
					selectedMulti: false	//중복선택 - (default : true) -> false로 중복 선택 방지
					,showIcon: true
					,nameIsHTML: false		//html 태그 허용금지 ex.{"name":"<font color='red'>test</font>"}
				},
				callback: {
					onClick: fncClikNode,
					beforeRename: fncBefNordRename //true: onrename 실행
					,onRename: fncNordRename
				},
				edit: {
					enable: false
					,editNameSelectAll: true
// 					,removeTitle: "remove the node"	//이게 뭔지 모르겠어
				}
				
			};
		
		/*zNodes 샘플*/
		/* var zNodes = [
			
		    {"id":1, "pId":0, "name":"test1"},
		    {"id":11, "pId":1, "name":"test11"},
		    {"id":12, "pId":1, "name":"test12"},
		    {"id":111, "pId":11, "name":"test111"}
			
		    {"id":'1', "pId":'0', "name":"test1"},
		    {"id":'11', "pId":'1', "name":"test11"},
		    {"id":'12', "pId":'1', "name":"test12"},
		    {"id":'111', "pId":'11', "name":"test111"}
		    
		    {"id":1, "pId":0, "name":"test1"},
		    {"id":2, "pId":1, "name":"test2"},
		    {"id":3, "pId":1, "name":"test3"},
		    {"id":4, "pId":3, "name":"test4"},
		    {"id":5, "pId":4, "name":"test5"},
		    {"id":6, "pId":2, "name":"test6"},
		    {"id":7, "pId":5, "name":"test7"},
		    {"id":8, "pId":0, "name":"test8"} 
		    
		] */
		
		//zTree 객체 변수 선언
		var treeObj;
		
		$(document).ready(function(){
		
			//db에서 받아온 treenode값 (type: json) 
			var jsonData = ${jsonData};
			console.log(jsonData);

			//zTree 실행
			var zNodes = cnvrtTree(jsonData);
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			
			//zTree 객체 할당
			treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		
			
		
		
		}); //ready end
		
/*
 * zTree - zNodes data 가공 
 * DB값으로 트리 id, pId, name 값 가공
 */
function cnvrtTree(jsonData) {
			
	//[id-> my_sn, pId -> parent_sn, name -> nm]
	var jsonTree = [];
	console.log("jsonData.length : " + jsonData.length);
	
	for (var i = 0; i < jsonData.length; i++) {
		var id = jsonData[i]["my_sn"];
		var name = jsonData[i]["nm"];
		var day_wrtr = jsonData[i]["day_wrtr"];
		var day_wrtday = jsonData[i]["day_wrtday"];
		var pId = "";
			if(jsonData[i]["parent_sn"] == null ||  jsonData[i]["parent_sn"] == ""){
				pId = '0'
			}else {
				pId = jsonData[i]["parent_sn"];
			}
		console.log("중간확인 : " + [i] + "번째 " + id + " : " + pId + " : "+ name);
	
		var obj = {
				  "id": id,
				  "pId": pId,
				  "name": name,
				  "day_wrtr": day_wrtr,
				  "day_wrtday": day_wrtday
				  
				};
	    jsonTree.push(obj);
	}//for
	return jsonTree;
}//cnvrtTree()
		
/**
 * 선택한 노드 정보값 hidden 할당
 */
function fncClikNode(event, treeId, treeNode, clickFlag) {
	
	
	console.log("event : " + event+  " / treeId : " +treeId+  " / treeNode : " + treeNode+ " / clickFlag : " + clickFlag);
	console.log("treeNode.id : " + treeNode.id +  " / treeNode.name : " + treeNode.name +  " / treeNode.pId : " + treeNode.pId +  " / treeNode.day_wrtr : " + treeNode.day_wrtr +  " / treeNode.day_wrtday : " + treeNode.day_wrtday+  " / treeNode.tId : " + treeNode.tId);
	
	$("#my_sn").val(treeNode.id);
	$("#parent_sn").val(treeNode.pId);
// 	$("#nm").val(treeNode.name);
	$("#day_wrtday").val(treeNode.day_wrtday);
	$("#day_wrtr").val(treeNode.day_wrtr);
// 	$("#selectTid").val(treeNode.tId + "_span");
	
}		
		
/**
 * 
 */
function fncFileDown() {
	
}

/**
 * 
 */
function fncNodeDel() {
	
}

/**
 * 
 */
function fncFileDel() {
	
}

/**
 * 
 */
function fncNodeNmUpdt() {
	/*
	+ 노드 이름 변경 과정
	1. 노드 이름 변경 버튼에 onclick로 fncNodeNmUpdt()함수 설정
	2. 해당 함수에서 선택한 노드의 값을 받아 nodes에 할당하고 해당 노드 editNamd 메소드 실행
	3. set 설정 중 edit 부분에서 editNameSelectAll: true 로 변경하려는 노드이름 선택되게 설정
	4. 콜백함수 중 onRename: fncNordRename()을 사용해 이름 변경 후 엔터 누를 때 (노드 이름 변경 후) 변경된 노드를 treeNode에 할당
	*/
	var nodes = treeObj.getSelectedNodes();
	console.log("##fncNodeNmUpdt## [nodes[0].name] : " + nodes[0].name);
	treeObj.editName(nodes[0]);
	
    
}

/**
 * 
 */
function fncFileNmUpdt() {
	
}

var renameChk;
function fncBefNordRename(treeId, treeNode, newName, isCancel) {
	alert("before")
	
	console.log(isCancel);
	console.log(newName);
	console.log("후후 : " + treeNode.name);
	
	if(isCancel) {
		treeObj.refresh();
		return;
	}

    if (confirm("변경하신 이름으로 저장하시겠습니까?")) {
		console.log("네")
		renameChk = true;
		
    } else {
		console.log("아니오")
		renameChk = false;
		
		//둘 중 하나 골라쓰면됨
// 		treeObj.refresh();	//취소시 zTree 새로고침 
		treeObj.cancelEditName();	//여기서 true되네 -> 여기서 다시 fncBefNordRename 함수 콜백 -> if(isCancel) 통해 zTree 새로고침
		
        return false; // 함수 종료
    }
// 	return true;
}

function fncNordRename(event, treeId, treeNode, isCancel) {
	//treeNode : 새로 변경된 노드의 정보 할당 (해당 인자 통해 새로 바꾼 이름확인 가능)
	if(renameChk){
	console.log("##fncNordRename##");
	console.log("77event : " + event+  " / treeId : " +treeId+  " / treeNode : " + treeNode+ " / isCancel : " + isCancel);
	console.log("77treeNode.id : " + treeNode.id +  " / treeNode.name : " + treeNode.name +  " / treeNode.pId : " + treeNode.pId +  " / treeNode.day_wrtr : " + treeNode.day_wrtr +  " / treeNode.day_wrtday : " + treeNode.day_wrtday);

	
	console.log("이름번경 : " + treeNode.id + ", " + treeNode.name);
	
	$("#newName").val(treeNode.name);
	console.log("이름번경 hidden : " + $("#newName").val());
	
	$("#frm").attr({"action": "<c:out value='${pageContext.request.contextPath}/renameNord.do'/>", "method": "post"}).submit();
	
	}
}

		
		
	</SCRIPT>

</html>