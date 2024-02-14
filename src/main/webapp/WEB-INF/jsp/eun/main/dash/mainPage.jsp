<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header -->
<%-- <jsp:include page="/WEB-INF/jsp/eun/main/layout/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/jsp/eun/main/layout/header.jsp"%>
<%@ include file="/WEB-INF/jsp/eun/main/layout/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="css/zTreeStyle.css"/>">


<h1>안녕 나는 메인페이지야</h1>

	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>




</body>

	<SCRIPT type="text/javascript">
		/*
		var setting = {	};

		var zNodes =[
			{ name:"pNode 01", open:true,
				children: [
					{ name:"pNode 11",
						children: [
							{ name:"leaf node 111"},
							{ name:"leaf node 112"},
							{ name:"leaf node 113"},
							{ name:"leaf node 114"}
						]},
					{ name:"pNode 12",
						children: [
							{ name:"leaf node 121"},
							{ name:"leaf node 122"},
							{ name:"leaf node 123"},
							{ name:"leaf node 124"}
						]},
					{ name:"pNode 13 - no child", isParent:true}
				]},
			{ name:"pNode 02",
				children: [
					{ name:"pNode 21", open:true,
						children: [
							{ name:"leaf node 211"},
							{ name:"leaf node 212"},
							{ name:"leaf node 213"},
							{ name:"leaf node 214"}
						]},
					{ name:"pNode 22",
						children: [
							{ name:"leaf node 221"},
							{ name:"leaf node 222"},
							{ name:"leaf node 223"},
							{ name:"leaf node 224"}
						]},
					{ name:"pNode 23",
						children: [
							{ name:"leaf node 231"},
							{ name:"leaf node 232"},
							{ name:"leaf node 233"},
							{ name:"leaf node 234"}
						]}
				]},
			{ name:"pNode 3 - no child", isParent:true}

		];

		*/
		
		var setting = {
				data: {
					simpleData: {
						enable: true
// 						idKey: "id",
// 						pIdKey: "pId",
// 						rootPId: 0
					}
				}
			};
		
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
		
		$(document).ready(function(){
			
		var zNodes = cnvrtTree();
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		var jsonData = ${jsonData}
		console.log(jsonData);
		
		
		
		}); //ready end
		
		function cnvrtTree() {
			
			//모델 값으로 받아온 list
			var jsonData = ${jsonData}
			console.log(jsonData);

			//[id-> my_sn, pId -> parent_sn, name -> nm]
			var jsonTree = [];
			console.log("jsonData.length : " + jsonData.length);
			
			for (var i = 0; i < jsonData.length; i++) {
				var data = "";
				var id = jsonData[i]["my_sn"];
				var pId = jsonData[i]["parent_sn"];
				if(jsonData[i]["parent_sn"] == null ||  jsonData[i]["parent_sn"] == "") pId = '0'; 
				var name = jsonData[i]["nm"];
				console.log("중간확인 : " + [i] + "번째 " + id + " : " + pId + " : "+ name);
			
// 				data += '{"id":' + id + ', "pId":' + pId + ', "name":"' + name + '"}';
// 			    jsonTree.push(data);
				
				var obj = {
						  "id": id,
						  "pId": pId,
						  "name": name
						};
				
			    jsonTree.push(obj);

			}//for
			
			console.log("반복문 확인 : " + jsonTree);
			console.log(jsonTree);
			return jsonTree;
			
		}//cnvrtTree()
		
	</SCRIPT>

</html>