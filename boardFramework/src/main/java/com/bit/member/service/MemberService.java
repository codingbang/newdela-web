package com.bit.member.service;

import java.util.Map;
import com.bit.member.model.MembersDto;

public interface MemberService {
  
  int insertMembers(MembersDto membersDto);
  String listMembers();

  MembersDto findByIdPassword(Map<String, Object> params);
  
}
