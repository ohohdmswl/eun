package eun.proj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import eun.proj.service.MainService;
import eun.proj.service.MainVO;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	/** DAO */
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public int testCount() {
		return mainDAO.selectOne("testCount");
	}
	
	@Override
	public List<MainVO> selectMainList() {
		return mainDAO.selectList("selectMainList");
	}
	
	
}
