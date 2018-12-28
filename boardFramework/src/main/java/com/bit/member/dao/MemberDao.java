package com.bit.member.dao;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MembersDto;

public interface MemberDao {
  
  int insertMembers(MembersDto membersDto);
  
  List<MembersDto> listMembers();

  int deleteMember(int m_code);
  
  MembersDto getMember(int m_code);
  
  MembersDto findByIdPassword(Map<String, Object> params);
  
}
