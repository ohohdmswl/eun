package eun.proj.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import eun.proj.service.MainService;
import eun.proj.service.MainVO;


@Controller
public class MainController {

	/** EgovSampleService */
	@Resource (name = "mainService")
	private MainService mainService;
	

	@RequestMapping(value = "/mainPage.do")
	public String mainPageView(@ModelAttribute("mainVO") MainVO mainVO, ModelMap model) throws Exception {

		System.out.println("아니 어디서 안되는건데");
		return "eun/main/dash/mainPage";
	}
	
}
