package com.bit.member.service;

import com.bit.member.model.MembersDto;

public interface MemberService {
  
  int insertMembers(MembersDto membersDto);
  String listMembers();
  int deleteMember(int m_code);
}
