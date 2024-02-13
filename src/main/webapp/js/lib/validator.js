/*******************************************************************************
 * 폼 검증
 ******************************************************************************/
	function doFormValidate(form) {
		var IE=(document.all)?true:false;
		if (IE){
			for (var i = 0; i < form.all.length; i++) {
				switch (form.all(i).tagName.toLowerCase()) {
				case "textarea":
					if (!validate(form.all(i)))
						return false;
				case "select":
					if (!validate(form.all(i)))
						return false;
				case "input":
					if (form.all(i).name == "")
						continue;
					if (!validate(form.all(i)))
						return false;
				default:
					;
				}
			}		
		}else{
			for (var i = 0; i < form.length; i++) {
				switch (form.elements[i].tagName.toLowerCase()) {
				case "textarea":
					if (!validate(form.elements[i]))
						return false;
				case "select":
					if (!validate(form.elements[i]))
						return false;
				case "input":
					if (form.elements[i].name == "")
						continue;
					if (!validate(form.elements[i]))
						return false;
				default:
					;
				}
			}
		}
	
		return true;
	}

/*******************************************************************************
 * 객체 검증
 ******************************************************************************/
	function validate(obj) {
		var message = itemCheck(obj);
		if (message == "")
			return true;
		else {
			alert(message);
			return false;
		}
	}

/*******************************************************************************
 * 객체에대한 검증을 실행한다.(title)
 ******************************************************************************/
	function itemCheck(obj) {
		var retMseeage = "";
		
		var title   = (obj.title == "" || typeof (obj.title) == "undefined" ? obj.name : obj.title);
		var value   = jfncTrim(obj.value);
		
		if ((obj.getAttribute("req") == "" ? true : false) && value == "") {
			retMseeage = title + "은(는) 필수입력 항목입니다.";
			obj.focus();
		}
		
//		if(obj.options != 'undefined' && obj.options != '' && obj.options != null) {
//			if(obj.options[obj.options.selectedIndex].value == "" || obj.options[obj.options.selectedIndex].value == null ? true : false) {
//				retMseeage = title + " 선택을 확인해주세요.";
//				obj.focus();
//			}
//		}
		
		if(value != ""){
			if(obj.getAttribute("email") == "" ? true : false){
				var reg=/^[a-zA-Z0-9._-]+@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
				
				if(!reg.test(value)){
					retMseeage = title + " 형식이 올바르지 않습니다.";
					obj.focus();
				}
			}else if(obj.getAttribute("tel") == "" ? true : false){
				var reg=/^\d{2,3}-\d{3,4}-\d{4}$/;
				
				if(!reg.test(value)){
					retMseeage = title + " 형식이 올바르지 않습니다.";
					obj.focus();
				}
			}else if(obj.getAttribute("ip") == "" ? true : false){
				var reg= /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
				
				if(!reg.test(value)){
					retMseeage = title + " 형식이 올바르지 않습니다.";
					obj.focus();
				}
			}else if(obj.getAttribute("date") == "" ? true : false){
				var reg= /^((19|20)\d{2})-?(0[1-9]|1[012])-?(0[1-9]|[12][0-9]|3[0-1])$/;
				
				if(!reg.test(value)){
					retMseeage0 = title + " 형식이 올바르지 않습니다.";
					obj.focus();
				}
			}else if(obj.getAttribute("numb")=="" ? true : false){
				var reg = /^[0-9]*$/;
				
				if(!reg.test(value)){
					retMseeage = title + " 형식이 올바르지 않습니다.";
					obj.focus();
				}
			}
			/*else if(obj.type == "file" && obj.value != ""){
				var imgArr = ['jpg', 'jpeg', 'bmp', 'png', 'gif'];
				var extArr = ['htm', 'html', 'asp', 'aspx', 'jsp', 'php', 'php3', 'java', 'class', 'xml', 'out', 'dll', 'exe', 'h', 'c', 'cpp', 'ocx', 'dat', 'js', 'sh'];
				var cmdArr = ['BS0620', 'BS0630', 'BS0720', 'BS0730'];
				var permitArr = ['jpg', 'jpeg', 'bmp', 'png', 'gif', 'xls', 'xlsx', 'hwp', 'ppt', 'doc', 'pdf', 'zip'];
				var ext = obj.value.split('.').pop().toLowerCase();
				var cmd = window.location.search;
				cmd = cmd.substring(cmd.indexOf("=")+1);
				
				if($.inArray(cmd, cmdArr) == -1) {
					if($.inArray(ext, extArr) > -1) {
						retMseeage = "해당 파일은 첨부가 불가능합니다.";
					}
				} 
				else {
					if($.inArray(ext, imgArr) == -1) {
						retMseeage = "이미지 파일만 첨부 가능합니다.";
					}
				}
				if($.inArray(ext, permitArr) == -1) {
					retMseeage = "해당 파일은 첨부가 불가능합니다.\n(가능파일 : 이미지, 한글, 엑셀)";
				}
			}*/
		}		
		
		return retMseeage;
	}

/*******************************************************************************
 * 공백 제거
 ******************************************************************************/
	function jfncTrim(str) {
		return str.replace(/^\str*/, '').replace(/\str*$/, '').replace(/\s/g, '');
	}

/*******************************************************************************
 * Description : inputbox 숫자체크 , 세자리마다 콤마, 스트링 글자수 제한 스크립트
 * Ex   : <input type="text" id="" name="" class="" onkeyup="inputCheck(this, 'float', '3', '3');" />
 ******************************************************************************/
	
	var fStr = "";//입력받기 전 값 저장 

	/**  
	 * @param obj  : 객체
	 * @param type : int, flt, str, num, num2(숫자만)
	 * @param pn   : int, flt(정수부 자리수), str(byte)
	 * @param sn   : int(사용안함), flt(소수점 이하 자리수), str(사용안함)
	 * @param com  : 세자리마다 콤마 : Y(사용), N(사용안함) 
	 */
	function inputCheck(obj, type, pn, sn, com) {
	
		var str = obj.value;
				
		if ( type == "str" ) {
			
			var comp = "\"'`";
			
			for ( var i=0; i<str.length; i++ ) {
				if ( comp.indexOf(str.substring(i,i+1)) > -1 ) {
					alert("특수문자는 쓰실수 없습니다.[\", ', `]");
					str = str.replace("\"","");
					str = str.replace("'","");
					str = str.replace("`","");
					obj.value= str;
					return;
				}
			}
			
			var bytee = getByte(str);
			
			if ( bytee > pn ) {
				alert(pn + "Byte 이상 입력하실 수 없습니다.");
				str = fStr;
				obj.value = fStr;
				return;
			}				
		} else {
			
			if ( event.keyCode == 32 ) {
				obj.value = str.replace(/\ /g,"");//공백 제거
				return;
			} else {
				str = numberCheck(str, type, pn, sn);
			
				if ( type == "num" ) {
					obj.value = str;
				} else {
					var reg = /(^[+-]?\d+)(\d{3})/;
					str += '';
					
					if( com == 'Y' ){
						while ( reg.test(str) )
							str = str.replace(reg, '$1' + ',' + '$2');
					}
					obj.value = str;
				}
			}
		}
		
		fStr = str;	
	}
	
	
	/**
	 * 숫자 체크
	 */
	function numberCheck(objVal, type, pn, sn){
	
		var str = objVal;
		var minus = "";
		
		if (str.charAt(0) == "-") {
			str = objVal.substring(1);
			minus = "-";
		}
		
		//콤마 제거
		str = str.replace(/\,/g,"");
		
		if (str != ""){
			if (isNaN(str)){
				alert("숫자만 입력하실 수 있습니다.");
				if (isNaN(fStr)){ 
					return "";	
				}
				//return fStr;
				return "";
			}
		}
		
		if (type == "num") {
			//자리수 체크
			if (str.length > pn) {
				alert(pn+"자리까지만 입력가능합니다.");
				str = str.substring(0, pn);
			}
		} 
		
		if (type == "num2") {			
			//소수점 체크
			if(str.indexOf(".") > -1) {
				alert("숫자만 입력가능합니다.");
				str = str.replace(/\./g,"");
			}
			//자리수 체크
			if (str.length > pn) {
				alert(pn+"자리까지만 입력가능합니다.");
				str = str.substring(0, pn);
			}
			
		}
		
		if (type == "int") {
			//첫자리가 0체크
			if (str.length > 1) {
				if (str.charAt(0) == "0") {
					alert("첫번째 자리는 0으로 시작할 수 없습니다.");
					str = str.substring(1);
				}
			}
			//소수점 체크
			if(str.indexOf(".") > -1) {
				alert("정수만 입력가능합니다.");
				str = str.replace(/\./g,"");
			}
			//자리수 체크
			if (str.length > pn) {
				alert(pn+"자리까지만 입력가능합니다.");
				str = str.substring(0, pn);
			}
			
		}
		
		if (type == "flt") {
			var intNumber = str;
			var floatNumber = "";
			var dotYn = "";
			//소수점이 있는지 체크
			
			if(str.indexOf(".") > -1) {
				dotYn = "Y";//소수점이 존재
				intNumber = str.substring(0, str.indexOf("."));
				floatNumber = str.substring(str.indexOf(".")+1, str.length);
			}
			
			//정수자리수 체크
			if (intNumber.length > pn) {
				alert("정수는" + pn + "자리까지만 입력가능합니다.");
				intNumber = intNumber.substring(0, pn);
			}
			
			//소수점이하 자리수 체크
			if (floatNumber.length > sn) {
				alert("소수점 이하는 " + sn + "자리까지만 입력가능합니다");
				floatNumber = floatNumber.substring(0, sn);
			}
			
			if (dotYn == "") {
				str = intNumber;
			} else {
				str = intNumber + "." + floatNumber;
			}
		}
		
		return minus + str;
	}	
	
	/*
	 * 바이트 조회
	 */
	function getByte(str) {
		var l = 0;
		for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 128) ? 2 : 1;
		return l;
	}
	
	/*
	 * 공개여부 비밀번호관련(영문과, 숫자만 입력)
	 */
	function fncCheckValue(obj){ 
		  var str = obj.value;
		  var strId = obj.id;
		  
		  if(str != ""){
		      var strReg = /^[A-Za-z0-9]+$/; 
	
		      if (!strReg.test(str)) {
		    	  alert('영문과 숫자만 입력가능합니다.');
		    	  obj.value = "";
		    	  return;
		      } 
		  }
	}
	
	/*
	 * 숫자만 입력
	 */
	function fncNumCheckValue(obj){ 
		  var str = obj.value;
		  var strId = obj.id;
		  
		  var strArray=strId.split('_'); //해당되는 id 숫자값을 알기 위해 id값에서 id숫자값 추출
		  var subId = strArray[3]; // ex)item_select_cnt_1에서 맨뒤의 숫자를 가져오기 위해
		  
		  var aa = ($("#question_method_"+subId).val()).substring(1,2); //선택한 객관식 보기갯수를 가져옴 
		  
	      var strReg = new RegExp("^[2-"+aa+"]+$"); //2에서 선택한 객관식 보기갯수까지의 정규식 범위를 적용
	      

	       if (!  strReg.test(str) )
	       {
				if("2" == aa){
					alert('숫자2 만 입력가능합니다.');
				}else{
					alert('2에서 '+aa+'까지의 숫자만 입력가능합니다.');
				}
				$("#"+strId).val("2");
				$("#"+strId).focus();
				return;
	       }
	}
	
	function fncChkInteger(obj){
		for( i=0 ; i < obj.value.length ; i++ ){
			if((obj.value.charAt(i)<"0") || (obj.value.charAt(i)>"9")){  
				alert("숫자만 입력가능합니다."); 
				obj.value=""
				obj.focus();
		        return false; 
			}
		} // end for 
		return true;
	}
	
	/*
	 * 시간, 날짜 from-to 체크
	 */
	function fcnChkFromTo(sstr, estr, gubun){
		if(Number(sstr.replace(/(^0+)/, "")) > Number(estr.replace(/(^0+)/, ""))){
			if(gubun == "time"){
				alert("시작시간이 종료시간보다 늦습니다.\n다시 입력하세요.");
			}else if(gubun == "day"){
				alert("시작일이 종료일보다 늦습니다.\n다시 입력하세요.");
			}
			return false;
		}
		return true;
	}
	