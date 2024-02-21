<!-- cross domain 제약을 우회하기 위한 jsp (devGuidePop.jsp) --> 
<%-- <%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
var method = "${method}";
var key = "${key}";
var vwcd = "${vwcd}";
var parentId = "${parentId}";
var type = "${type}";

// JavaScript에서 값 확인
console.log("Method: " + method);
console.log("Key: " + key);
console.log("Vwcd: " + vwcd);
console.log("ParentId: " + parentId);
console.log("Type: " + type);
</script>



<c:set var="method" ><%out.println(request.getParameter("method") == null ? "" : (request.getParameter("method"))); %></c:set>
<c:set var="key" ><%out.println(request.getParameter("key") == null ? "" : (request.getParameter("key"))); %></c:set>
<c:set var="vwcd" ><%out.println(request.getParameter("vwcd") == null ? "" : (request.getParameter("vwcd"))); %></c:set>
<c:set var="parentId"><%out.println(request.getParameter("parentId") == null ? "" : (request.getParameter("parentId")));%></c:set>
<c:set var="type" ><%out.println(request.getParameter("type") == null ? "" : (request.getParameter("type"))); %></c:set>

<%-- <c:import url="https://kosis.kr/openapi/Expt/statisticsList.do?method=${method}&apiKey=${key}&vwCd=${vwcd}&parentListId=${parentId}&format=${type}" charEncoding="utf-8"/> --%>

<c:import url="http://kosis.kr/openapi/Expt/statisticsList.do?method=${method}&apiKey=${key}&vwCd=${vwcd}&parentListId=${parentId}&format=${type}" charEncoding="utf-8"/>




<!-- 해당 url 값 확인할 수 있는 URL -->
<!-- https://kosis.kr/openapi/statisticsList.do?method=getList&apiKey=MTBjZjAwY2JhNzUxNzgyMjBjOTE4YzA3NDJlMTk2MTE=&vwCd=MT_ZTITLE&parentListId=A&format=json&jsonVD=Y -->
<%-- <c:import url="https://kosis.kr/openapi/statisticsList.do?method=getList&apiKey=MTBjZjAwY2JhNzUxNzgyMjBjOTE4YzA3NDJlMTk2MTE=&vwCd=MT_ZTITLE&parentListId=A&format=json&jsonVD=Y" charEncoding="utf-8"/> --%>