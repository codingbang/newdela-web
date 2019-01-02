package com.bit.member.service;

import java.util.Map;
import com.bit.member.model.MemberDto;

public interface MemberService {
  
  int insertMembers(MemberDto membersDto);
  String listMembers();
  MemberDto getMember(int m_code);
  int deleteMember(int m_code);
  MemberDto findByIdPassword(Map<String, Object> params);
  int checkId(String m_id);
  
}
