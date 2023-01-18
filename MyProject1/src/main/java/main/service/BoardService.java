package main.service;

import java.util.List;

public interface BoardService {
	
	
	/* 게시글 목록 조회  */
	public List<?> selectAllNBoard(BoardVO vo) throws Exception;
	
	/* 게시글 상세 조회 */
	public BoardVO selectDetailNBoard(int unq) throws Exception;
	
	/* 게시글 전체 건수 조회 */
	public int selectCntNBoard(BoardVO vo) throws Exception;
	
	/* 비밀번호 존재 확인 */
	public int selectPassCntNBoard(BoardVO vo) throws Exception;
	
	/* 게시글 저장 */
	public String insertNBoard(BoardVO vo) throws Exception;
	
	/* 조회수 증가 */
	public int updateNBoardHits(int unq) throws Exception;
	
	/* 게시글 제목 수정 */
	public int updateNBoardDetail(BoardVO vo) throws Exception;
	
	/* 게시글 삭제 */
	public int deleteNBoardDetail(BoardVO vo) throws Exception;
	
}
