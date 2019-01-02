package com.bit.common.dao;

import java.util.Map;
import com.bit.member.model.MemberDto;

public interface CommonDao {
  
  int getNextSeq();
  void updateHit(int seq);
  int getNewArticleCount(int bcode);
  int getTotalArticleCount(Map<String, String> map);
  MemberDto getMember(int mcode);

}
