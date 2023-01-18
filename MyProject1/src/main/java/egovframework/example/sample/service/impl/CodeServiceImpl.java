package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl 
							 implements CodeService {
	
	@Resource(name="codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertCode(CodeVO vo) throws Exception {
		return codeDAO.insertCode(vo);
	}


	@Override
	public List<?> selectCodeList() throws Exception {
		return codeDAO.selectCodeList();
	}

	@Override
	public int selectCodeCount(CodeVO vo) throws Exception {
		return codeDAO.selectCodeCount(vo);
	}
	
	@Override
	public int deleteCode(int codeno) throws Exception {
		return codeDAO.deleteCode(codeno);
	}


	@Override
	public CodeVO selectCode(int codeno) throws Exception {
		return codeDAO.selectCode(codeno);
	}


	@Override
	public int updateCode(CodeVO vo) throws Exception {
		return codeDAO.updateCode(vo);
	}

	
}
