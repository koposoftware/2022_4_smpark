package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	public MemberVO selectUser(MemberVO memberVO);
	public List<MemberVO> getUserList();
	public List<Map<String,Object>> test();

}
