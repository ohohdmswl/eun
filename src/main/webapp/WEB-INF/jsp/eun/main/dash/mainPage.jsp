<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- header -->
<jsp:include page="/WEB-INF/jsp/eun/main/layout/header.jsp"></jsp:include>


</head>
<body>

<h1>안녕 나는 메인페이지야</h1>

	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>

</body>

	<SCRIPT type="text/javascript">
		
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

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		
	</SCRIPT>

</html>