package com.bit.member.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bit.board.admin.model.BoardListDto;
import com.bit.common.service.CommonService;
import com.bit.member.model.MembersDto;
import com.bit.member.model.PostDto;
import com.bit.member.service.MemberService;
import com.google.gson.Gson;


@Controller
public class MembersCotroller {

  @Autowired
  private CommonService commonService;

  @Autowired
  private MemberService memberService;
  
  
  @RequestMapping(value="member", method=RequestMethod.GET)
  public String JoinForm(Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    model.addAttribute("menu", list);
    return "member/join";
  }
  
  @RequestMapping(value="member", method=RequestMethod.POST, headers= {"Content-type=application/json"} )
  public @ResponseBody Map<String, String> joinAction(@RequestBody MembersDto membersDto,  Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    model.addAttribute("menu", list);
    int cnt = memberService.insertMembers(membersDto);
    
    Map<String, String> map = new HashMap<String, String>();
    map.put("isSuccess", "true");
    return map;
  }
  
  @RequestMapping(value="/member/listform", method=RequestMethod.GET)
  public String memberListForm(Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    model.addAttribute("menu", list);
    return "member/list";
  }
  
  @RequestMapping(value="/member/list", method=RequestMethod.GET)
  public @ResponseBody String getMemberList(Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    model.addAttribute("menu", list);
    String memberslist = memberService.listMembers();
    return memberslist;
  }
  

  @RequestMapping(value="/member/viewForm", method=RequestMethod.GET)
  public String getMemberView(int m_code, Model model) {
    List<BoardListDto> list = commonService.getBoardMenu();
    model.addAttribute("menu", list);
    MembersDto membersDto =  memberService.getMember(m_code);
    model.addAttribute("member",membersDto);
    return "member/view";
  }
  

  @RequestMapping(value="/member/{m_code}", method=RequestMethod.DELETE)
  public @ResponseBody String deleteMember(@PathVariable(value="m_code")int m_code) {
    memberService.deleteMember(m_code);
	String memberslist = memberService.listMembers();
    return memberslist;
  }

 

  public static final String ZIPCODE_API_KEY = "3a167b364799b7ff01545215585606";
  public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi";
  
  @RequestMapping(value = "postcodelist", method = RequestMethod.POST, produces = "text/planin;charset=UTF-8")
  public @ResponseBody String postCodeList(@RequestParam Map<String, String> param) throws Exception {
    
      Map<String, Object> paramMap = new HashMap<String, Object>();
      StringBuilder queryUrl = new StringBuilder();
      String query = param.get("query");
      int currentPage = Integer.parseInt(param.get("currentPage"));

      queryUrl.append(ZIPCODE_API_URL);
      queryUrl.append("?regkey=");
      queryUrl.append(ZIPCODE_API_KEY);
      queryUrl.append("&target=");
      queryUrl.append("postNew");
      queryUrl.append("&query=");
      queryUrl.append(URLEncoder.encode(query.replaceAll(" ", ""), "EUC-KR"));
      queryUrl.append("&countPerPage=");
      queryUrl.append("10");
      queryUrl.append("&currentPage=");
      queryUrl.append(currentPage);
      
      Document document = Jsoup.connect(queryUrl.toString()).get();
      String errorCode = document.select("error_code").text();
      
      int totalCount;
      int totalPage;
      int countPerPage;
      
      if(null == errorCode || "".equals(errorCode)) {
          Elements pageInfoElement = document.select("pageinfo");
          
          totalCount = Integer.parseInt(pageInfoElement.select("totalCount"). text());
          totalPage = Integer.parseInt(pageInfoElement.select("totalPage").text())-1;
          countPerPage = Integer.parseInt(pageInfoElement.select("countPerPage").text());

    
          if (totalCount % countPerPage > 0) {
              totalPage++;
          }

          if (totalPage < currentPage) {
              currentPage = totalPage;
          }

          int startPage = ((currentPage - 1) / countPerPage) * countPerPage + 1;
          int endPage = startPage + countPerPage - 1;
          
          if (endPage > totalPage) {
              endPage = totalPage;
          }
          
          
          Elements itemElements = document.select("item");
          List<PostDto> list = new ArrayList<PostDto>();
          PostDto postDto = null;
          
          for(Element element : itemElements){
              postDto = new PostDto();
              postDto.setZipcode(element.select("postcd").text());
              postDto.setAddress(element.select("address").text());
              list.add(postDto);
          }
          paramMap.put("postlist", list);
          paramMap.put("totalCount", totalCount);
          paramMap.put("totalPage", totalPage);
          paramMap.put("countPerPage", countPerPage);
          paramMap.put("currentPage", currentPage);
          paramMap.put("startPage", startPage);
          paramMap.put("endPage", endPage);
      }else{
          String errorMessage = document.select("message").text();
          paramMap.put("errorCode", errorCode);
          paramMap.put("errorMessage", errorMessage);
      }
      
      
      // Gson형태로 paramMap 리턴
      return (new Gson()).toJson(paramMap);

  }



  @RequestMapping(value = "/member/loginForm")
  public String loginForm() {

    return "member/loginForm";
  }



  @RequestMapping(value = "/member/login", method = RequestMethod.POST)
  public String login(String m_id, String m_pwd, HttpSession session) {
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("m_id", m_id);
    params.put("m_pwd", m_pwd);
    MembersDto membersDto = memberService.findByIdPassword(params);

    if (membersDto != null) {
      session.setAttribute("loginUser", membersDto);
      return "member/list";
    } else {
      session.invalidate();
      return "redirect:loginForm";
    }
  }

}
