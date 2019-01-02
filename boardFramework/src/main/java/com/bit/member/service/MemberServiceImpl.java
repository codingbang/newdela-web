package com.bit.member.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.member.dao.MemberDao;
import com.bit.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

  @Autowired
  SqlSession sqlSession;

  @Override
  public int insertMembers(MemberDto membersDto) {
    return sqlSession.getMapper(MemberDao.class).insertMembers(membersDto);
  }

  @Override
  public String listMembers() {

    List<MemberDto> list = sqlSession.getMapper(MemberDao.class).listMembers();
    JSONObject json = new JSONObject();
    JSONArray jsonArr = new JSONArray();

    for (MemberDto membersDto : list) {
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
    return sqlSession.getMapper(MemberDao.class).deleteMember(m_code);
  }

  @Override
  public MemberDto getMember(int m_code) {
    return sqlSession.getMapper(MemberDao.class).getMember(m_code);
  }
  @Override
  public MemberDto findByIdPassword(Map<String, Object> params) {
    return sqlSession.getMapper(MemberDao.class).findByIdPassword(params);
  }

  @Override
  public int checkId(String m_id) {
    int check = sqlSession.getMapper(MemberDao.class).checkId(m_id);
    return check;
  }


}
