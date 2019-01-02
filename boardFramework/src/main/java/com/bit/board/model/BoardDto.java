package com.bit.board.model;

public class BoardDto {
  
  private int seq;
  private String subject;
  private String content;
  private int hit;
  private String logtime;
  private int bcode;
  private int mcode;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getHit() {
    return hit;
  }
  public void setHit(int hit) {
    this.hit = hit;
  }
  public String getLogtime() {
    return logtime;
  }
  public void setLogtime(String logtime) {
    this.logtime = logtime;
  }
  public int getBcode() {
    return bcode;
  }
  public void setBcode(int bcode) {
    this.bcode = bcode;
  }
  public int getMcode() {
    return mcode;
  }
  public void setMcode(int mcode) {
    this.mcode = mcode;
  }
  
  
  
}
