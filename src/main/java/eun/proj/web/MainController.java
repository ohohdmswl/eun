package eun.proj.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import eun.proj.service.MainService;
import eun.proj.service.MainVO;
import eun.proj.service.SviewVO;


@Controller
public class MainController {

	/* Service */
	@Resource (name = "mainService")
	private MainService mainService;
	
	
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   // Get class name for logger
   private final String className = this.getClass().toString();
	

	@RequestMapping(value = "/mainPage.do")
	public String mainPageView(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model) throws Exception {

		logger.info("##### [mainPageView] (/mainPage.do)  #####");
		
		int result = mainService.testCount();
		logger.info("@@@ : " + result);
		
		//DB 노드 가져와서 트리표출
		List<MainVO> mainList = mainService.selectMainList();
		logger.info("selectMainList : " + mainList);
		//list 빈값, null일 경우 처리
		
		//mainList (List -> json)
		ObjectMapper objectMapper = new ObjectMapper();
        String jsonData = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(mainList);
//        logger.info("jsonData : " + jsonData);

		model.addAttribute("jsonData", jsonData);
		
        
		
		
		return "eun/main/dash/mainPage";
		
	}
	
	@RequestMapping(value = "/renameNord.do", method = RequestMethod.POST)
	public String renameNord(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model, HttpServletResponse response , SessionStatus status, MultipartHttpServletRequest multipartRequest) throws Exception {
//		public String renameNord(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model, SessionStatus status, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		logger.info("##### [renameNord] (/renameNord.do)  #####");
		
		
		logger.info("renameNord.do : " + mainVO );	// null값들이 빈값으로 들어옴
		logger.info("renameNord.do multifile : " + multipartRequest.getFileMap());
//		logger.info("renameNord.do multifile : " + request.getFiles("board_file"));
		
		logger.info("renameNord.do null : " + mainVO.getParent_sn().equals(null) );
		logger.info("renameNord.do 빈값 : " + mainVO.getParent_sn().equals("") );
		
		// checkChildState (-1 : 최하위노드, else : 폴더)
		// 최하위노드(-1) : 
		//상관없이 그냥 my_sn으로 흐음 디비구조를 알아야하겠는데
		
		
		
		
		return "eun/main/dash/test";
//		return "abc";
	}
	
	@RequestMapping(value = "/renameNordFile.do")
	public String renameNordFile(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model, SessionStatus status, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		logger.info("##### [renameNordFile] (/renameNordFile.do)  #####");
		
		
		String abc = "";
		
		return abc;
	}
	
	
	@RequestMapping(value = "/statsView.do")
	public String statsView(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model) throws Exception {
		
		logger.info("##### [statsView] (/statsView.do)  #####");
		
		
		
		
		return "eun/main/dash/statsView";
		
	}
	
//	@RequestMapping(value = "/devGuidePop.do", method = RequestMethod.POST)
	@RequestMapping(value = "/test.do")
	public String test(ModelMap model, HttpServletRequest request) throws Exception {
		
		logger.info("##### [test] (/test.do)  #####");
		
		return "eun/main/dash/test";
	}
	
//	@ResponseBody
	@RequestMapping(value = "/devGuidePop.jsp", method = RequestMethod.POST)
	public String devGuidePop(ModelMap model, @RequestParam String method,
            @RequestParam String key,
            @RequestParam String vwcd,
            @RequestParam String parentId,
            @RequestParam String type) throws Exception {
		
		logger.info("##### [devGuidePop] (/devGuidePop.do)  #####");
		
		logger.info(method);
		logger.info(key);
		logger.info(vwcd);
		logger.info(parentId);
		logger.info(type);
		
		model.addAttribute("method", method);
		model.addAttribute("key", key);
		model.addAttribute("vwcd", vwcd);
		model.addAttribute("parentId", parentId);
		model.addAttribute("type", type);
		
		return "eun/main/dash/devGuidePop";
		
		/*
	    URL url = new URL("http://kosis.kr/openapi/Expt/statisticsList.do?method=getList&apiKey=MTBjZjAwY2JhNzUxNzgyMjBjOTE4YzA3NDJlMTk2MTE=&vwCd=MT_ZTITLE&parentListId=B_003&format=json");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        StringBuilder sb = new StringBuilder();
        if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), "utf-8"));
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            br.close();
//            JSONObject responseData=new JSONObject(sb.toString());
            System.out.println("확인확인" + sb.toString());
            //return responseData;
        } else {
            System.out.println(con.getResponseMessage());
        }
		Map<String, String> map = new HashMap<>();
		map.put("result", sb.toString());
		model.addAttribute("result",map);
		return "jsonView";
		*/
		
		
	}
	/*
	@RequestMapping(value = "/devGuidePop.jsp")
	public String testtest(ModelMap model, HttpServletRequest request) throws Exception {
		
		logger.info("##### [testtest] (/devGuidePop.jsp)  #####");
		
		return "eun/main/dash/test";
	}
	*/
	
	
	//------------------------------------------------------------------------------------------------------------------//
	//시작
	@RequestMapping(value = "/SpageView.do")
	public String SpageView(@ModelAttribute("searchVO") SviewVO searchVO,
			ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
	
		
		
		
		
		return "eun/main/dash/16view";
	}
		
	
	
	
	
	
	
}
