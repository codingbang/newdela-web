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
import com.bit.board.model.ReboardDto;
import com.bit.board.service.ReboardService;
import com.bit.common.service.CommonService;
import com.bit.member.model.MemberDto;
import com.bit.util.PageNavigation;


@Controller
@RequestMapping("/reboard")
public class ReboardCotroller {
  
  @Autowired
  private CommonService commonService;
  @Autowired
  private ReboardService reboardService;
  
  @RequestMapping(value="list.bit", method=RequestMethod.GET)
  public ModelAndView list(@RequestParam Map<String, String> param) {
    ModelAndView mv = new ModelAndView();
    List<ReboardDto> list = reboardService.listArticle(param);
    PageNavigation navigation = commonService.makePageNavigation(param);
    navigation.setRoot("/board");
    navigation.makeNavigator();
    List<BoardListDto> menuList = commonService.getBoardMenu();
    mv.addObject("menu", menuList);
    mv.addObject("articlelist", list);
    mv.addObject("navigator", navigation);
    mv.setViewName("reboard/list");
    return mv;
  }
	
  @RequestMapping(value="write.bit", method=RequestMethod.GET)
  public String write(@RequestParam Map<String, String> param, HttpSession session, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    return "reboard/write";
  }
  
  @RequestMapping(value="write.bit", method=RequestMethod.POST)
  public String write(ReboardDto reboardDto, String content, String subject, HttpSession session, @RequestParam Map<String, String> param, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    MemberDto memberDto = (MemberDto) session.getAttribute("loginUser");
    System.out.println("세션?"+memberDto.getM_code());
    if (memberDto != null) {
      reboardDto.setMcode(memberDto.getM_code());
      System.out.println(reboardDto.getMcode());
      int seq = reboardService.WriteArticle(reboardDto);
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다.!!!");
    }
    
    return "reboard/writeok";
  }
  
  @RequestMapping(value="view.bit", method=RequestMethod.GET)
  public String view(@RequestParam int seq, HttpSession session, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if (memberDto != null) {
      ReboardDto reboardDto = reboardService.viewArticle(seq);
      model.addAttribute("article",reboardDto);
    }
    return "reboard/view";
        
  }
  
  @RequestMapping(value="reply.bit", method=RequestMethod.GET)
  public String reply(@RequestParam int seq, HttpSession session, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if (memberDto != null) {
      ReboardDto reboardDto = reboardService.viewArticle(seq);
      model.addAttribute("article",reboardDto);
    }
    return "reboard/reply";
  }
  
  @RequestMapping(value="reply.bit", method=RequestMethod.POST)
  public String reply(ReboardDto reboardDto, HttpSession session, @RequestParam Map<String, String> param, Model model) {
    List<BoardListDto> menuList = commonService.getBoardMenu();
    model.addAttribute("menu", menuList);
    MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
    if (memberDto != null) {
      reboardDto.setMcode(memberDto.getM_code());
      
      int seq = reboardService.replyArticle(reboardDto);
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다.!!!");
    }
    
    return "reboard/writeok";
  }

	
}
