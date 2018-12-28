package com.bit.member.dao;

import java.util.List;
import com.bit.member.model.MembersDto;

public interface MemberDao {
  
  int insertMembers(MembersDto membersDto);
  
  List<MembersDto> listMembers();

}
