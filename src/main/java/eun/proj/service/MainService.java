package eun.proj.service;

import java.util.List;

public interface MainService {

	//db연결 테스트
	int testCount();

	//트리 노드 select
	List<MainVO> selectMainList();

	

}
