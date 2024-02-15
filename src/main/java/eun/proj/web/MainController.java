package eun.proj.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	

	
	
	
}
