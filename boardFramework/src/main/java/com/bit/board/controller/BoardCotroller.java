package com.bit.board.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.model.BoardDto;
import com.bit.board.service.BoardService;
import com.bit.common.service.CommonService;
import com.bit.member.model.MemberDto;
import com.bit.util.PageNavigation;


@Controller
@RequestMapping("/board")
public class BoardCotroller {
  
  @Autowired
  private CommonService commonService;
  @Autowired
  private BoardService boardService;
  
  @RequestMapping(value="list.bit", method=RequestMethod.GET)
  public ModelAndView list(@RequestParam Map<String, String> param) {
    ModelAndView mv = new ModelAndView();
    List<BoardDto> list = boardService.listArticle(param);
    PageNavigation navigation = commonService.makePageNavigation(param);
    navigation.setRoot("/board");
    navigation.makeNavigator();
    List<BoardListDto> menuList = commonService.getBoardMenu();
    mv.addObject("menu", menuList);
    
    mv.addObject("articlelist", list);
    mv.addObject("navigator", navigation);
    mv.setViewName("board/list");
    return mv;
  }
    
  @RequestMapping(value="write.bit", method=RequestMethod.GET)
  public String write(@RequestParam Map<String, String> param, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    return "board/write";
  }
  
  @RequestMapping(value="write.bit", method=RequestMethod.POST)
  public String write(BoardDto boardDto, HttpSession session, @RequestParam Map<String, String> param, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    
    MemberDto memberDto = (MemberDto) session.getAttribute("loginUser");
    if (memberDto != null) {
      boardDto.setMcode(memberDto.getM_code());
      
      int seq = boardService.WriteArticle(boardDto);
      
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다.!!!");
    }
    
    return "board/writeok";
  }
  
  @RequestMapping(value="view.bit", method=RequestMethod.GET)
  public String view(@RequestParam int seq, HttpSession session, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    
    
    if (memberDto != null) {
      int mcode = memberDto.getM_code();
      MemberDto member = commonService.getMember(mcode);
      BoardDto boardDto = boardService.viewArticle(seq);
      model.addAttribute("article",boardDto);
      model.addAttribute("member",member);
    }
    return "board/view";
        
  }
	

	
}
