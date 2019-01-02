package com.bit.member.dao;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MemberDto;

public interface MemberDao {
  
  int insertMembers(MemberDto membersDto);
  
  List<MemberDto> listMembers();

  int deleteMember(int m_code);
  
  MemberDto getMember(int m_code);
  
  MemberDto findByIdPassword(Map<String, Object> params);
  
}
