package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	@Resource(name="deptService")
	private DeptService deptService;

	@RequestMapping(value="/deptWrite.do")
	public String deptWrite() {
		return "dept/deptWrite";		
	}
	
	@RequestMapping(value="/deptWriteSave.do")
	public String insertDept(DeptVO vo) throws Exception {
		System.out.println("번 호 : " + vo.getDeptno() );
		System.out.println("이 름 : " + vo.getDname() );
		System.out.println("위 치 : " + vo.getDloc() );
		
		if (deptService.insertDept(vo) == null) {
			System.out.println("저장 완료");
		} else {
			System.out.println("저장 실패 !!!");
		}
		
		return "redirect:deptListAll.do";
	}
	
	@RequestMapping(value="/deptListAll.do")
	public String selectAllDeptList(DeptVO vo, ModelMap modelmap) throws Exception {
		
		// 조회해오는 서비스를 만들어 실행한다.결과는 list에 담고.
		List<?> deptList = deptService.selectAllDeptList(vo);
		
		// 조회된결과값을 모델에 담아 JSP에 보낸다.
		modelmap.addAttribute("resultList", deptList);
		
		// 화면을 그려줄 곳으로 ..
		return "dept/deptListAll";
	}
	
	@RequestMapping(value="/deptDetail.do")
	public String selectDeptDetail(String deptno,  ModelMap modelmap) throws Exception {
		DeptVO vo = deptService.selectDeptDetail(deptno);
		System.out.println("번 호 : " + vo.getDeptno() );
		
		modelmap.addAttribute("DeptDetail", vo);
		
		return "dept/deptDetail";
	}
	
	@RequestMapping(value="/deptDelete.do")
	public String deleteDept(String deptno) throws Exception {
		
		if (deptService.deleteDept(deptno) > 0) {
			System.out.println("삭제 완료");
		} else {
			System.out.println("삭제 실패 !!!");
		}
				
		return "redirect:deptListAll.do";
	}
	
	
	@RequestMapping(value="/deptModify.do")
	public String modifyDeptSelect (String deptno, ModelMap modelmap) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		
		modelmap.addAttribute("DeptDetail", vo);
		
		return "dept/deptModify";
	}
	
	@RequestMapping(value="/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception {
		System.out.println("번 호 : " + vo.getDeptno() );
		System.out.println("이 름 : " + vo.getDname() );
		System.out.println("위 치 : " + vo.getDloc() );
		
		if (deptService.updateDept(vo) > 0) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패 !!!");
		}
		
		return "redirect:deptListAll.do";
	}	
	
}