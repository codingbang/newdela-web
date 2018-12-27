package com.bit.board.service;

import java.util.List;
import java.util.Map;
import com.bit.board.model.ReboardDto;

public interface ReboardService {
  
  public int WriteArticle(ReboardDto reboardDto);
  public List<ReboardDto> listArticle(Map<String, String> param);
  public ReboardDto viewArticle(int seq);
  public ReboardDto getArticle(int seq);
  public int replyArticle(ReboardDto reboardDto);
  
  public void modifyArticle(ReboardDto reboardDto);
  public void deleteArticle(int seq);

}
