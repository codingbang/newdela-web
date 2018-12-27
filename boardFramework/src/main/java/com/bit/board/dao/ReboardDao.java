package com.bit.board.dao;

import java.util.List;
import java.util.Map;
import com.bit.board.model.ReboardDto;

public interface ReboardDao {
  
  public int WriteArticle(ReboardDto reboardDto);
  public List<ReboardDto> listArticle(Map<String, String> param);
  public ReboardDto viewArticle(int seq);
  void updateStep(ReboardDto reboardDto);
  public int replyArticle(ReboardDto reboardDto);
  void updateReply(int pseq);
  
  public void modifyArticle(ReboardDto reboardDto);
  public void deleteArticle(int seq);

}
