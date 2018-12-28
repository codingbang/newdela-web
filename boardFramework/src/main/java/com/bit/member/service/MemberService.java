package com.bit.member.service;

import java.util.Map;
import com.bit.member.model.MembersDto;

public interface MemberService {
  
  int insertMembers(MembersDto membersDto);
  String listMembers();
  MembersDto getMember(int m_code);
  int deleteMember(int m_code);
  MembersDto findByIdPassword(Map<String, Object> params);
  
}
