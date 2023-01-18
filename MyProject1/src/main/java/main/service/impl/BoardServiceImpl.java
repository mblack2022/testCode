package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl  implements BoardService {
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
	/*	System.out.println("--제목 : " + vo.getTitle() );
		System.out.println("--비번 : " + vo.getPass() );
		System.out.println("--이름 : " + vo.getName());
		System.out.println("--내용 : " + vo.getContent());*/
		
		return boardDAO.insertBoard(vo);
	}

	@Override
	public int selectCntNBoard(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardCnt(vo);
	}

	@Override
	public List<?> selectAllNBoard(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardList(vo);
	}

	@Override
	public BoardVO selectDetailNBoard(int unq) throws Exception {
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		return boardDAO.updateNBoardHits(unq);
	}

	@Override
	public int updateNBoardDetail(BoardVO vo) throws Exception {
		return boardDAO.updateNBoardDetail(vo);
	}

	@Override
	public int deleteNBoardDetail(BoardVO vo) throws Exception {
		return boardDAO.deleteNBoardDetail(vo);
	}

	@Override
	public int selectPassCntNBoard(BoardVO vo) throws Exception {
		return boardDAO.selectPassCntNBoard(vo);
	}
	
	

}
