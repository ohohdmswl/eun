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
<!-- 		<button type="button" class="" onclick="javascript:fncNodeNmUpdt();">[노드]정보명변경</button> -->
		<button type="button" class="" onclick="javascript:fncNordRename();">[노드]정보명변경</button>
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
					onClick: fncClikNode
// 					,onRename: fncNordRename
				},
				edit: {
					editNameSelectAll: true
					,removeTitle: "remove the node"	//이게 뭔지 모르겠어
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
	console.log("treeNode.id : " + treeNode.id +  " / treeNode.name : " + treeNode.name +  " / treeNode.pId : " + treeNode.pId +  " / treeNode.day_wrtr : " + treeNode.day_wrtr +  " / treeNode.day_wrtday : " + treeNode.day_wrtday);
	
	$("#my_sn").val(treeNode.id);
	$("#parent_sn").val(treeNode.pId);
// 	$("#nm").val(treeNode.name);
	$("#day_wrtday").val(treeNode.day_wrtday);
	$("#day_wrtr").val(treeNode.day_wrtr);
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
// 	$("#my_sn").val(treeNode.id);
// 	$("#parent_sn").val(treeNode.pId);
// 	$("#nm").val(treeNode.name);
// 	$("#day_wrtday").val(treeNode.day_wrtday);
// 	$("#day_wrtr").val(treeNode.day_wrtr);
	
// 	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeObj.getSelectedNodes();
// 	var nodes = treeObj.getNodes();
	console.log("왜 안되냐1 : " + nodes[0].name);
	treeObj.editName(nodes[0]);
	
	
	
	
	
}

/**
 * 
 */
function fncFileNmUpdt() {
	
}



function fncNordRename(event, treeId, treeNode, isCancel) {
	
	var nodes = treeObj.getSelectedNodes();
// 	var nodes = treeObj.getNodes();
	console.log("왜 안되냐77 : " + nodes[0].name);
	treeObj.editName(nodes[0]);
	
	alert(treeNode.id + ", " + treeNode.name);
	
	
	
}

		
		
	</SCRIPT>

</html>