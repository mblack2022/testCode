package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	
	public String insertDept(DeptVO vo) throws Exception;
	
	public List<?> selectAllDeptList(DeptVO vo) throws Exception;
	
	public DeptVO selectDeptDetail(String deptno) throws Exception;
	
	public int deleteDept(String deptno) throws Exception; 
	
	public int updateDept(DeptVO vo) throws Exception;
	
}
