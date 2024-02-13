package eun.proj.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import eun.proj.service.MainService;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	/** DAO */
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public int testCount() {
		return mainDAO.selectOne("testCount");
	}
	
}
