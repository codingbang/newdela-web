package com.bit.board.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.service.BoardAdminService;


@Controller
@RequestMapping("/")
public class BoardMainCotroller {
  
  @Autowired
  private BoardAdminService boardAdminService;
  
  @RequestMapping("boardmain.bit")
  public String boardmenu(Map<String, Object> model) {
    List<BoardListDto> list = boardAdminService.getBoardMenu();
    model.put("menu", list);
    return "common/public";
  }

	
}
