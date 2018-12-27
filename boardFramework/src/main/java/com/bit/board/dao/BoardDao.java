package com.bit.board.dao;

import java.util.List;
import java.util.Map;
import com.bit.board.model.BoardDto;

public interface BoardDao {
  public int WriteArticle(BoardDto boardDto);
  public List<BoardDto> listArticle(Map<String, String> param);
  public BoardDto viewArticle(int seq);
}
