package com.bit.member.dao;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MembersDto;

public interface MemberDao {
  
  int insertMembers(MembersDto membersDto);
  
  List<MembersDto> listMembers();

  MembersDto findByIdPassword(Map<String, Object> params);
}
