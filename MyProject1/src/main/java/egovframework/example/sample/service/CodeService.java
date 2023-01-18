package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.service.CodeVO;

public interface CodeService {

	public String insertCode(CodeVO vo) throws Exception;
	public List<?> selectCodeList() throws Exception;
	public int selectCodeCount(CodeVO vo) throws Exception;
	public int deleteCode(int codeno) throws Exception;
	public CodeVO selectCode(int codeno) throws Exception;
	public int updateCode(CodeVO vo) throws Exception;
}
