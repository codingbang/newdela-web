package com.bit.member.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.bit.board.admin.model.BoardListDto;
import com.bit.common.service.CommonService;
import com.bit.member.model.MembersDto;
import com.bit.member.service.MemberService;


@Controller
@RequestMapping("/member")
public class MembersCotroller {
  
  @Autowired
  private CommonService commonService;
  
  @Autowired
  private MemberService memberService;
  
  @RequestMapping(value="join.bit", method=RequestMethod.GET)
  public String joinForm(Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    model.addAttribute("menu", list);
    return "member/join";
  }
  
  @RequestMapping(value="join.bit", method=RequestMethod.POST)
  public String join(MembersDto membersDto, Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    int cnt = memberService.insertMembers(membersDto);
    System.out.println(membersDto.getM_id());
    System.out.println(membersDto.getM_pwd());
    model.addAttribute("menu", list);
    return "board/list";
  }

	
}
