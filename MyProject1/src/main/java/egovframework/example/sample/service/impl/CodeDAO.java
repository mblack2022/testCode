package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO {

	public String insertCode(CodeVO vo) {
		return (String) insert ("codeDAO.insertCode", vo);
	}

	public List<?> selectCodeList() {
		return (List<?>) list ("codeDAO.selectCodeList");
	}

	public int selectCodeCount(CodeVO vo) {
		return (int) select("codeDAO.selectCodeCount",vo);
	}

	public int deleteCode(int codeno) {
		return (int) delete("codeDAO.deleteCode",codeno);
	}

	public CodeVO selectCode(int codeno) {
		return (CodeVO) select("codeDAO.selectCode",codeno);
	}

	public int updateCode(CodeVO vo) {
		return (int) update("codeDAO.updateCode",vo);
	}

}
