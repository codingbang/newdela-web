package com.bit.board.admin.dao;

import java.util.List;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.model.BoardTypeDto;
import com.bit.board.admin.model.CategoryDto;

public interface BoardAdminDao {
  
  public List<BoardListDto> getBoardMenu();
  public List<CategoryDto>getCategory();
  public void makeCategory(CategoryDto category);
  public BoardTypeDto getBoardType();
  public void makeBoard(BoardListDto boardListDto);
  
}
