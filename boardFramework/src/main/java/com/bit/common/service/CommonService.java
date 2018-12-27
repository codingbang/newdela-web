package com.bit.common.service;

import java.util.List;
import java.util.Map;
import com.bit.board.admin.model.BoardListDto;
import com.bit.util.PageNavigation;

public interface CommonService {
  
  public List<BoardListDto> getBoardMenu();
  PageNavigation makePageNavigation(Map<String, String> param);

}
