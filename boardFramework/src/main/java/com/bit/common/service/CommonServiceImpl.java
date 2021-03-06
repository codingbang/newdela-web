package com.bit.common.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.board.admin.dao.BoardAdminDao;
import com.bit.board.admin.model.BoardListDto;
import com.bit.common.dao.CommonDao;
import com.bit.member.model.MemberDto;
import com.bit.util.BoardConstance;
import com.bit.util.PageNavigation;

@Service
public class CommonServiceImpl implements CommonService {
  
  @Autowired
  SqlSession sqlSession;
  
  @Override
  public PageNavigation makePageNavigation(Map<String, String> param) {
    int pg = Integer.parseInt(param.get("pg"));
    int pageSize = BoardConstance.PAGE_COUNT;
    int listSize = BoardConstance.LIST_COUNT;
    
    PageNavigation navigation = new PageNavigation();
    int newArticleCount = sqlSession.getMapper(CommonDao.class).getNewArticleCount(Integer.parseInt(param.get("bcode")));
    navigation.setNewArticleCount(newArticleCount);
    int totalArticleCount = sqlSession.getMapper(CommonDao.class).getTotalArticleCount(param);
    navigation.setTotalArticleCount(totalArticleCount);
    int totalPageCount = (totalArticleCount-1)/listSize +1;
    navigation.setTotalPageCount(totalPageCount);
    navigation.setPageNo(pg);    
    navigation.setNowFirst(pg <= pageSize);
    navigation.setNowEnd((totalPageCount-1) / pageSize * pageSize < pg);
    
    return navigation;
  }
  
  @Override
  public List<BoardListDto> getBoardMenu() {
    return sqlSession.getMapper(BoardAdminDao.class).getBoardMenu();
  }
  
  @Override
  public MemberDto getMember(int mcode) {
    return sqlSession.getMapper(CommonDao.class).getMember(mcode);
  }

}
