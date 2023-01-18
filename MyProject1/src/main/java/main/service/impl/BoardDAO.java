package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO{

	public String insertBoard(BoardVO vo) {
/*		System.out.println("DAO제목 : " + vo.getTitle() );
		System.out.println("DAO비번 : " + vo.getPass() );
		System.out.println("DAO이름 : " + vo.getName());
		System.out.println("DAO내용 : " + vo.getContent());		*/
		return (String) insert("boardDAO.insertNBoard",vo); //고유한 이름이 들어가야 해서 작명함."boardDAO.insertNBoard"
	}

	public List<?> selectNBoardList(BoardVO vo) {
		return (List<?>)list("boardDAO.selectNBoardList",vo);
	}

	public BoardVO selectNBoardDetail(int unq) {
		return (BoardVO) select("boardDAO.selectNBoardDetail",unq);
	}

	public int selectNBoardCnt(BoardVO vo) {
		return (int) select("boardDAO.selectNBoardCnt",vo);
	}

	public int updateNBoardHits(int unq) {
		return (int) update("boardDAO.updateNBoardHits",unq);
	}

	public int updateNBoardDetail(BoardVO vo) {
		return (int) update("boardDAO.updateNBoardDetail", vo);
	}

	public int deleteNBoardDetail(BoardVO vo) {
		return (int) delete("boardDAO.deleteNBoardDetail",vo);
	}

	public int selectPassCntNBoard(BoardVO vo) {
		return (int) select("boardDAO.selectPassCntNBoard",vo);
	}
	


}
