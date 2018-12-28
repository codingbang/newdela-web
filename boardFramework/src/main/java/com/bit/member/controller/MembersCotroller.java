package com.bit.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
  
  @RequestMapping(value="/member/list", method=RequestMethod.GET)
  public String MemberListForm() {
    return "member/list";
  }
  
  
  
  /* //우편번호 API Parsing TEST
  @RequestMapping(value = "postSearch.bit", method = RequestMethod.GET)
  public String post() {

      return "member/postSearch";
  }
  
  @RequestMapping(value = "searchPopup", method = RequestMethod.GET)
  public String searchPopup() {

      return "member/searchPopup";
  }
  

  public static final String ZIPCODE_API_KEY = "3a167b364799b7ff01545215585606";
  public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi";
  
  @RequestMapping(value = "zip_codeList", method = RequestMethod.POST, produces = "text/planin;charset=UTF-8")
  public @ResponseBody String zip_codeList(@RequestParam("query") String query) throws Exception {
      Map<String, Object> paramMap = new HashMap<String, Object>();
      StringBuilder queryUrl = new StringBuilder();
      queryUrl.append(ZIPCODE_API_URL);
      queryUrl.append("?regkey=");
      queryUrl.append(ZIPCODE_API_KEY);
      queryUrl.append("&target=");
      queryUrl.append("postNew");
      queryUrl.append("&query=");
      queryUrl.append(query.replaceAll(" ", ""));
      System.out.println(queryUrl);
      // document 선언
      Document document = Jsoup.connect(queryUrl.toString()).get();
      System.out.println(document);
      // errorCode 선언
      String errorCode = document.select("error_code").text();
      
      if(null == errorCode || "".equals(errorCode))
      {
          Elements elements = document.select("item");
          List<PostDto> list = new ArrayList<PostDto>();
          PostDto postDto = null;
          
          for(Element element : elements){
              postDto = new PostDto();
              postDto.setZipcode(element.select("postcd").text());
              postDto.setAddress(element.select("address").text());
              list.add(postDto);
          }
          // list 결과 put
          paramMap.put("postlist", list);
      }else{
          String errorMessage = document.select("message").text();
          paramMap.put("errorCode", errorCode);
          paramMap.put("errorMessage", errorMessage);
      }
      System.out.println((new Gson()).toJson(paramMap));
      // Gson형태로 paramMap 리턴
      return (new Gson()).toJson(paramMap);

  }*/

	
}
