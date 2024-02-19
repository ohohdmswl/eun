package eun.proj.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import eun.proj.service.MainService;
import eun.proj.service.MainVO;


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
		
		
		String abc = "";
		
		return "eun/main/dash/test";
//		return "abc";
	}
	
	@RequestMapping(value = "/renameNordFile.do")
	public String renameNordFile(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model, SessionStatus status, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		logger.info("##### [renameNordFile] (/renameNordFile.do)  #####");
		
		
		String abc = "";
		
		return abc;
	}
	
	
}
