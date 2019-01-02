<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		  height: 300,
		  width: 1030,
		  minHeight: null,
		  maxHeight: null,
		  focus: true
		});
});
function writeArticle(){
	if(document.writeForm.subject.value == ""){
		alert("제목을 입력하세요");
		return;
	}else if(document.writeForm.content.value == ""){
		alert("내용을 입력하세요");
		return;
	}else{
		document.writeForm.action = "${root}/reboard/write.bit";
		document.writeForm.submit();
	}
}
</script>
<style>
.line {
    height: 2px;
    width: 100%;
    background-color: black;
}

</style>
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
			<h5>
				<img src="${root}/img/board/icon_arrow_04.gif" width="4"
				height="11" border="0" align="absmiddle" vspace="4"><b>글쓰기</b>
			</h5>
		</div>
		<div class="line"></div>
		
		<div>
			<form id="writeForm" name="writeForm" method="post" action="" style="margin: 0px">
				<div id="attach_file_hdn"></div>
				<input type="hidden" name="bcode" value="${bcode }">
				<input type="hidden" name="pg" value="1">
				<input type="hidden" name="key" value="">
				<input type="hidden" name="word" value="">
				
				<table border="0" cellpadding="5" cellspacing="0" width="630" style="table-layout: fixed">
					<tr valign="top">
						<td width="95" nowrap style="padding-left: 8px; padding-top: 13px; font-size: 11pt;">
							<img src="${root}/img/board/e_dot.gif" width="4" height="4" border="0" align="absmiddle">
							<b>제목</b>
						</td>
						<td colspan="5">
							<input name="subject" id="subject" type="text" size="76" maxlength="150" class="inp_02 form-control" style="width: 300px; height: 35px; margin-top: 10px;" value="">
							<img src="${root}/img/board/i_info.gif" width="12" height="11" border="0" align="absmiddle" vspace="8" style="margin: 3 3 0 6">
							<font class="stext">최대 한글 75자,영문 150자</font><br>
					</tr>
					<tr>
						<td width="620" nowrap style="padding-left: 8px; padding-top: 14px; font-size: 11pt;"
							colspan="5"><img src="${root}/img/board/e_dot.gif" width="4"
							height="4" border="0" align="absmiddle"> <b>글내용</b> 
							<textarea id="summernote" name="content" class="inp_02" cols="67" rows="25" scrollbars="no"></textarea>
						</td>
					</tr>
				</table>
				
				<div align="center">
					<a href="javascript:writeArticle();">
						<img  src="${root}/img/board/btn_register.gif" width="42" height="21" border="0" name="register" value="" alt="등록">
					</a> 
					<a href="javascript:history.back();">
						<img src="${root}/img/board/b_cancel.gif" width="42" height="21" border="0" name="cencel" value="" alt="취소">
					</a>
				</div>
				
				
			</form>
		</div>
		
	</div>
	<div class="col-md-2"></div>
</div>


</body>
</html>