package com.bit.member.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.board.dao.MemoDao;
import com.bit.board.model.MemoDto;
import com.bit.member.dao.MemberDao;
import com.bit.member.model.MembersDto;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Autowired
  SqlSession sqlSession;
  
  @Override
  public int insertMembers(MembersDto membersDto) {
    return sqlSession.getMapper(MemberDao.class).insertMembers(membersDto);
  }
  
  @Override
  public String listMembers() {
    
    List<MembersDto> list = sqlSession.getMapper(MemberDao.class).listMembers();
    JSONObject json = new JSONObject();
    JSONArray jsonArr = new JSONArray();
    
    for (MembersDto membersDto : list) {
      JSONObject member = new JSONObject();
      member.put("m_code", membersDto.getM_code());
      member.put("m_id", membersDto.getM_id());
      member.put("m_name", membersDto.getM_name());
      member.put("m_tel", membersDto.getM_tel());
      member.put("m_regdate", membersDto.getM_regdate());
      
      jsonArr.put(member);
    }
    json.put("memberslist", jsonArr);
    return json.toString();
  }

	@Override
	public int deleteMember(int m_code) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberDao.class).deleteMember(m_code);
	}
	  
  @Override
  public MembersDto findByIdPassword(Map<String, Object> params) {
    return sqlSession.getMapper(MemberDao.class).findByIdPassword(params);
  }

}
