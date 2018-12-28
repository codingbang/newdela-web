package com.bit.board.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.service.BoardAdminService;
import com.bit.member.model.MemberDto;


@Controller
@RequestMapping("/")
public class BoardMainCotroller {
  
  @Autowired
  private BoardAdminService boardAdminService;
  
  @RequestMapping("boardmain.bit")
  public String boardmenu(Map<String, Object> model, HttpSession session) {
    List<BoardListDto> list = boardAdminService.getBoardMenu();
    model.put("menu", list);
    MemberDto memberDto = new MemberDto();
    memberDto.setId("testtest");
    memberDto.setName("이종현");
    memberDto.setEmail("test@test.com");
    session.setAttribute("userInfo", memberDto);
    return "main";
  }

	
}
