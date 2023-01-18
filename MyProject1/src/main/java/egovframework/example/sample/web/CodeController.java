package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
import egovframework.example.sample.service.DeptVO;

@Controller
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/codeWrite.do")
	public String codeWrite () {
		return "codes/codeWrite";
	}

	@RequestMapping(value="/codeWriteSave.do")
	public String codeWriteSave(CodeVO vo) throws Exception {
		
		if (codeService.insertCode(vo) == null )
			System.out.println("코드 저장 성공 [" + vo.getCodenm() + "]") ;
		else
			System.out.println("코드 저장 실패 !!!");
		
		return "redirect:codeListAll.do";
	}
	
	@RequestMapping(value="/codeListAll.do")
	public String codeListAll (CodeVO vo, ModelMap modelmap) throws Exception {
		int total = codeService.selectCodeCount(vo);
		
		List<?> codeList = codeService.selectCodeList();
		
		modelmap.addAttribute("resultCnt",total);
		modelmap.addAttribute("resultList",codeList);
		return "codes/codeListAll";
	}
	
	@RequestMapping(value="/codeDelete.do")
	public String codeDelete (int codeno) throws Exception{
		if (codeService.deleteCode(codeno) > 0) 
			System.out.println("코드 삭제 성공 [" + codeno + "]") ;
		else
			System.out.println("코드 삭제 실패 !!!");
		
		return "redirect:codeListAll.do";
	}
	
	@RequestMapping(value="/codeModify.do")
	public String codeModify (int codeno, ModelMap modelmap) throws Exception{
		CodeVO vo = codeService.selectCode(codeno);
		modelmap.addAttribute("codevo", vo);
		
		return "codes/codeModify";
	}
	
	@RequestMapping(value="codeModifySave.do")
	public String codeModifySave (CodeVO vo) throws Exception {
		System.out.println("코드 수정 [" + vo.getCodeno() + "]") ;
		if (codeService.updateCode(vo) > 0) 
			System.out.println("코드 수정 성공 [" + vo.getCodeno() + "]") ;
		else
			System.out.println("코드 수정 실패 !!!");		
		return "redirect:codeListAll.do";
	}
	
}