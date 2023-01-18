package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;

	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
/*
		System.out.println("제목 : " + vo.getTitle() );
		System.out.println("비번 : " + vo.getPass() );
		System.out.println("이름 : " + vo.getName());
		System.out.println("내용 : " + vo.getContent());
*/		
		String result = boardService.insertNBoard(vo);
		
		if ( result == null) {
			System.out.println("저장 완료");
			result = "ok";
		} else {
			System.out.println("저장 실패 !!!");
			result = "fail";
		}
		
		System.out.println("result [" + result+ "]");		
		return result ;
	}
	

	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap modelmap) throws Exception {
		
		int total = boardService.selectCntNBoard(vo);
		
		int viewPage = vo.getViewPage();
		int listCnt	 = vo.getListCnt();

		int totalPage = (int)Math.ceil((double)total/listCnt);
		
		if ((viewPage > totalPage) || viewPage < 1 ) viewPage = 1;
		
		int startRowNo = total - (viewPage-1) * listCnt ;
		
		vo.setStartIndex(((viewPage-1) * listCnt));

		System.out.println("viewPage [" + viewPage + "]" + " listCnt [" + listCnt + "]" + " startRowNo [" + startRowNo + "]" 
							+ " totalPage [" + totalPage + "]" + " total [" + total + "]");
		
		List<?> boardList = boardService.selectAllNBoard(vo);

		modelmap.addAttribute("resultList", boardList);
		modelmap.addAttribute("total", total);
		modelmap.addAttribute("totalPage", totalPage);
		modelmap.addAttribute("startRowNo", startRowNo);
		modelmap.addAttribute("seachText",vo.getSeachText());
		
		System.out.println("제목 : " + vo.getTitle() );
		System.out.println("SeachFilter : " + vo.getSeachFilter() );
		System.out.println("SeachText : " + vo.getSeachText());
		System.out.println("total : " + total);

		
		return "board/boardList";
	}
	
	
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(int unq, ModelMap modelmap) throws Exception {
		
		boardService.updateNBoardHits(unq);
		
		BoardVO vo = boardService.selectDetailNBoard(unq);
		
		// 내용의 개행문자를 <br>로 변경
		String content = vo.getContent();
		vo.setContent(content.replace("\n", "<br>"));
		
		modelmap.addAttribute("result", vo);
		
		System.out.println("content [" + vo.getContent() + "]");
		
		return"board/boardDetail";
	}
	
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap modelmap) {
		
		modelmap.addAttribute("unq", unq);
		return "board/passWrite";
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteNBoardDetail(BoardVO vo) throws Exception {
		
		int result = 0;
		int count = boardService.selectPassCntNBoard(vo);
		
		if (count == 1 ) {
			result = boardService.deleteNBoardDetail(vo);
			System.out.println("deleteNBoardDetail : result [" + result+ "]");		
		} else if (count == 0) {
			result = -1;
		}
		
		return result+"" ;		
	}
		
	@RequestMapping("/boardModify.do")
	public String boardModifyNBoard(BoardVO vo) throws Exception {
		
		if (boardService.updateNBoardDetail(vo) > 0) 
			System.out.println("수정 성공 [" + vo.getTitle() + "]") ;
		else
			System.out.println("수정 실패 !!!");		
		
		return "redirect:boardList.do";
		
	}		
}
