<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<style>
.line {
    height: 0.3px;
    width: 100%;
    background-color: gray;
}
.line2 {
    height: 1px;
    width: 100%;
    background-color: gray;
}

</style>
<c:if test="${article == null }">
<script>
alert("글이 삭제되었거나 잘못된 URL접근입니다.")
document.location.href="${root}/index.jsp";
</script>

</c:if>
<c:if test="${article != null }">
	<script type="text/javascript">
		$(document).ready(function() {
			control = "${root}/reboard";
			initVars();
			getMemoList();

			$(".writeBtn").click(function() {
				$("#commonForm").attr("method", "get").attr("action", writepath).submit();
			});

			$(".replyBtn").click(function() {
				$('#seq').val("${article.seq}");
				$("#commonForm").attr("method", "get").attr("action", replypath).submit();
			});

			$(".newpage").click(function() {
				$("#pg").val(1);
				$("#key").val("");
				$("#word").val("");
				$("#commonForm").attr("method", "get").attr("action", listpath).submit();
			});

			$(".mvpage").click(function() {
				$("#commonForm").attr("method", "get").attr("action", listpath).submit();
			});

			/* ========댓글======== */
      
			//댓글 작성 이벤트
			$("#memoBtn").click(function() {
				var seq = "${article.seq}";
				var mcontent = $("#mcontent").val();
				$("#mcontent").val("");
				var parameter = JSON.stringify({
					'seq' : seq,
					'mcontent' : mcontent
				});
				if (mcontent.trim().length != 0) {
					$.ajax({
						url : '${root}/memo',
						type : 'POST',
						contentType : 'application/json;charset=UTF-8',
						dataType : 'json',
						data : parameter,
						success : function(data) {
							makeList(data);
						}

					});
				}
			});
			
			//댓글 수정폼 표시 이벤트
			$(document).on("click",".viewMemoModifyBtn",function(){
				var mseq = $(this).parent().attr("memo-mseq");
	      $("#div"+mseq).css("display", "");
      });
			
			//댓글 수정폼 표시 취소 이벤트
			$(document).on("click",".memoCancelBtn",function(){
        $(this).parent("div").css("display", "none");
      });
			
			//댓글 최종 수정버튼 이벤트
			$(document).on("click",".memoModifyBtn",function(){
        $(this).parent().css("display", "none");
        var mseq = $(this).attr("memo-mseq");
        var seq = '${article.seq}';
        var mcontent = $("#mcontent" + mseq).val();
        alert(mcontent);
        var parameter = JSON.stringify({
	            'seq' : seq,
	            'mseq' : mseq,
	            'mcontent' : mcontent
            });
        if (mcontent.trim().length != 0) {
    	   $.ajax({
             url : '${root}/memo',
             type : 'PUT',
             contentType : 'application/json;charset=UTF-8',
             data : parameter,
             dataType : 'json',
             success : function(data) {
               makeList(data);
             }
          });
		
    	   }
      });
			
			//댓글 삭제 버튼 클릭이벤트
			$(document).on("click",".memoDeleteBtn",function(){
				if (confirm("삭제하시겠습니까?")) {
					var mseq = $(this).parent().attr("memo-mseq");
					$.ajax({
             url : '${root}/memo/${article.seq}/'+mseq,
             type : 'DELETE',
             contentType : 'application/json;charset=UTF-8',
             dataType : 'json',
             success : function(data) {
            	 makeList(data);
             }
          });
				}
      });
			
			//댓글 리스트 비동기로 불러오기
			function getMemoList() {
				$.ajax({
           url : '${root}/memo/${article.seq}',
           type : 'GET',
           contentType : 'application/json;charset=UTF-8',
           dataType : 'json',
           success : function(data) {
             makeList(data);
           }
        });
			}

			
			
			
			//String을 이용한 댓글 리스트 동적 HTML 생성
			function makeList(memos) {
				$("#memoview").empty();
				var mlist = memos.memolist;
			  var output = '';
			  var len = mlist.length;
			
			  output += '<div class="row">';
			  output += '	<div class="col-md-2"><b>작성자</b></div>';
			  output += '	<div class="col-md-5"><b>댓글내용</b></div>';
			  output += '	<div class="col-md-3"><b>작성일</b></div>';
			  output += '</div>';
			  output += '<div class="row line2"></div>';
			  for (var i = 0; i < len; i++) {
				  
				output += '<div class="row">';
				output += '	<div class="col-md-2">'+ mlist[i].name +'</div>';
				output += '	<div class="col-md-5">'+ mlist[i].mcontent +'</div>';
				output += '	<div class="col-md-3">'+ mlist[i].mtime +'</div>';
				
				if (mlist[i].id == '${userInfo.m_id}') {
					output += '	<div class="col-md-2" memo-mseq="'+ mlist[i].mseq +'">';
					output += '		<label class="viewMemoModifyBtn">수정</label>';
					output += '		<label class="memoDeleteBtn">삭제</label>';
					output += ' </div>';
					output += '</div>';
					
					output += '<div class="row">';
					output += '	<div id="div' + mlist[i].mseq + '" style="display: none;">';
					output += '		<textarea id="mcontent' + mlist[i].mseq + '" memo-mseq="'+ mlist[i].mseq +'" style="resize: none;" rows="3" cols="150">' + mlist[i].mcontent + '</textarea>';
					output += '		<input type="button" value="수정" class="memoModifyBtn">';
					output += '		<input type="button" value="취소" class="memoCancelBtn">';
					output += '	</div>';
					output += '</div>';
				}
				output += '<div class="row line2"></div>';
				 
			}
			 $("#memoview").append(output);
			}
			
		});
	</script>
	<!-- title -->
	
	
	
	
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div>
			<h3><img src="${root}/img/board/m_icon_board.gif" width="9"
				height="9" border="0" align="absmiddle" style="margin-top: -2px">
			<b>자유게시판</b> &nbsp;</h3>
			<h5><font style="font-size: 8pt">
			</font>&nbsp; 자유로운 글을
			올리는 공간입니다</h5><br>
		</div>
		
		
		<div>
			<span>
				<img class="writeBtn" src="${root}/img/board/btn_write_01.gif" width="64" height="22" border="0" align="absmiddle" alt="글쓰기">
				<img class="replyBtn" src="${root}/img/board/btn_reply.gif" width="40" height="22" border="0" align="absmiddle" alt="답글">
				<c:if test="${userInfo.m_id == article.m_id }">
			  		<img class="modifyBtn" src="${root}/img/board/btn_modify.gif" border="0" align="absmiddle" alt="글수정">
	      			<img class="deleteBtn" src="${root}/img/board/btn_delete.gif" border="0" align="absmiddle" alt="글삭제">
				</c:if>
			</span>
			<span style="padding-left: 70%">
				<label class="newpage">최신목록</label><font color="#c5c5c5">|</font>
				<label class="mvpage">목록</label><font color="#c5c5c5">|</font>
				
				<a href="javascript:goBbsRead();">
					<img src="${root}/img/board/icon_up.gif" border="0" align="absmiddle"hspace="3">윗글
				</a>
				<font color="#c5c5c5">|</font> 
				<a href="javascript:goBbsRead();">아랫글
					<img src="${root}/img/board/icon_down.gif" border="0" align="absmiddle" hspace="3">
				</a>
			</span>
			
		</div>
		
		<div>
			<table class="table" border="0" cellpadding="5" cellspacing="0" width="100%">
				<tr>
					<td class="bg_board_title_02" colspan="2" height="2"
						style="overflow: hidden; padding: 0px"></td>
				</tr>
				<tr height="28">
					<td class="bg_board_title" colspan="2" style="padding-left: 14px">
					<b><font class="text"> ${article.subject } </font></b></td>
				</tr>
				<tr>
					<td class="bg_board_title_02" colspan="2" height="1"
						style="overflow: hidden; padding: 0px"></td>
				</tr>
				<tr height="26">
					<td width="100%" style="padding-left: 14px"><font class="stext">번호
					:</font> <font class="text_commentnum">${article.seq }</font> &nbsp; <font
						class="stext">글쓴이 :</font> <a href="javascript:;"
						onClick="showSideView();" class="link_board_02">${article.m_name }</a><br>
					</td>
					<td style="padding-right: 14px" nowrap class="stext">조회 : <font
						class="text_commentnum">${article.hit }</font> &nbsp; 스크랩 : <font
						class="text_commentnum">0</font> &nbsp; 날짜 : <font
						class="text_commentnum">${article.logtime }</font></td>
				</tr>
				<tr>
					<td class="bg_board_title_02" colspan="2" height="1"
						style="overflow: hidden; padding: 0px"></td>
				</tr>
				
				<tr valign="top">
					<td bgcolor="#ffffff" width="100%" class="text"
						style="padding-bottom: 8px; line-height: 1.3" id="clix_content">
			
			
			
					<P>${article.content }</P>
			
			
			
					</td>
					<td nowrap valign="top" align="right" style="padding-left: 0px">
			
					</td>
				</tr>
			</table>
		</div>
		<div class="line"></div>
		
		<div>
			<span>
				<img class="writeBtn" src="${root}/img/board/btn_write_01.gif" width="64" height="22" border="0" align="absmiddle" alt="글쓰기">
				<img class="replyBtn" src="${root}/img/board/btn_reply.gif" width="40" height="22" border="0" align="absmiddle" alt="답글">
			</span>
			<span style="padding-left: 70%">
				<label class="newpage">최신목록</label><font color="#c5c5c5">|</font>
				<label class="mvpage">목록</label><font color="#c5c5c5">|</font>
				
				<a href="javascript:goBbsRead();">
					<img src="${root}/img/board/icon_up.gif" border="0" align="absmiddle"hspace="3">윗글
				</a>
				<font color="#c5c5c5">|</font> 
				<a href="javascript:goBbsRead();">아랫글
					<img src="${root}/img/board/icon_down.gif" border="0" align="absmiddle" hspace="3">
				</a>
			</span>
		</div>
		
		<div>
			<textarea id="mcontent" class="form-control" style="resize: none;" rows="3"  placeholder="댓글입력..."></textarea>
       		<input type="button" class="btn btn-primary" id="memoBtn" value="댓글작성">
		</div>
		
		<div id="memoview" style="padding-top: 10px;">
			<div class="row">
				<div class="col-md-2">작성자</div>
				<div class="col-md-5">내용</div>
				<div class="col-md-3">작성일</div>
				<div class="col-md-2">수정삭제</div>
			</div>
			<div class="row">
				<div id="div' + mlist[i].mseq + '" style="display: none;">
					<textarea style="resize: none;" rows="3" cols="215">기존내용</textarea>';
					<input type="button" value="수정" class="memoModifyBtn">';
					<input type="button" value="취소" class="memoCancelBtn">';
				</div>
			</div>

			<div class="line2"></div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>


</c:if>

</body>
</html>