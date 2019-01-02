<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>

<script>
$(document).ready(function() {
	
	$(document).on("click", "#searchPostBtn", function(){
		$('#myModal').modal('show');
	});
	
	$(document).on("click", ".addressSelect", function(){
		var postcode = $(this).attr("id");
		var addr1 = $(this).attr("addr");
		console.log(postcode);
		console.log(addr1);
		$("#m_postcode").val(postcode);
		$("#m_address1").val(addr1);
		$("#myModal").modal("hide");
	});
	
	
	//모달창에서의 주소 검색버튼 클릭이벤트
	$(".btn_search").click(function(){
		$('#currentPage').val("1");
		$.ajax({
			url : "postcodelist",
			data : $("#postSearchForm").serialize(),
			type : "POST",
			dataType : "json",
			success : function(data){
				makePostList(data);
			}
		});
	});
	
	$(document).on("click", "#firstpage", function(){
		$('#currentPage').val("1");
		$.ajax({
			url : "postcodelist",
			data : $("#postSearchForm").serialize(),
			type : "POST",
			dataType : "json",
			success : function(data){
				makePostList(data);
			}
		});
	});
	
	$(document).on("click", ".mvpage", function(){
		$('#currentPage').val($(this).attr("move-page-no"));
		$.ajax({
			url : "postcodelist",
			data : $("#postSearchForm").serialize(),
			type : "POST",
			dataType : "json",
			success : function(data){
				makePostList(data);
			}
		});

	});
	
	
	//파싱한 우편목록 html생성
	function makePostList(data) {
		$("#postTbody").empty();
		var strHtml = '';
		
		if(data.errorCode != null && data.errorCode != ""){
			strHtml += '<tr>';
			strHtml += '    <td colspan="2">';
			strHtml +=            data.errorMessage;
			strHtml += '    </td>';
			strHtml += '</tr>';
		} else {
			var postlist = data.postlist;
			var length = postlist.length;
			
			for (var i = 0; i < length; i++) {
				strHtml += '<tr>';
				strHtml += '	<td>'+ postlist[i].zipcode +'</td>';
				strHtml += '	<td><a id="'+ postlist[i].zipcode + '"class="addressSelect" addr="'+postlist[i].address+'">'+ postlist[i].address +'</a></td>';
				strHtml += '</tr>';
			}
			
			var totalCount = data.totalCount; //전체 데이터 개수
			var totalPage = data.totalPage; //전체 페이지 개수
			var countPerPage = data.countPerPage; //페이지당 몇개씩 10
			var currentPage = data.currentPage; //현재 페이지
			var startPage = data.startPage; //시작페이지
			var endPage = data.endPage; //끝페이지
			
			
			strHtml += '<tr align="center"><td colspan="2">';
			strHtml += '<nav>';
			strHtml += '	<ul class="pagination">';

			if (startPage > 1) {
				strHtml += '		<li><a class="mvpage" move-page-no="'+ 1 +'"><span>&laquo;</span></a></li>';
			}

			if (currentPage > 1) {
				strHtml += '		<li><a class="mvpage" move-page-no="'+ (currentPage-1) +'"><span>&lsaquo;</span></a></li>';
			}



			for (var j = startPage; j <= endPage; j++) {

			    if (j == currentPage) {
			    	strHtml += '		<li class="active"><a class="mvpage" move-page-no="'+ j +'">'+ j +'<span class="sr-only"></span></a></li>';
			    } else {
			    	strHtml += '		<li><a class="mvpage" move-page-no="'+ j +'">'+ j +'<span class="sr-only"></span></a></li>';
			    }
			}


			if (currentPage < totalPage) {
				strHtml += '		<li><a class="mvpage" move-page-no="'+ (currentPage+1) +'"><span>&rsaquo;</span></a></li>';
			}

			if (endPage < totalPage) {
				strHtml += '		<li><a class="mvpage" move-page-no="'+ (totalPage) +'"><span>&raquo;</span></a></li>';
			}

			
			strHtml += '	</ul>';
			strHtml += '</nav>';
			strHtml += '</td></tr>';
		}
		
		
		$("#postTbody").append(strHtml);
	}//end makePostList
	
	$("#m_id").blur(function(){
	  var m_id = $('#m_id').val();
	  $.ajax({
	    url : '${root}/member/idCheck?m_id='+ m_id,
		type: 'get',
		success: function(data){
		  console.log(data);
		  
		  if(data == 1){
		    $("#id_check").text("사용중 아이디입니다! ");
		    $("#id_check").css("color", "red");
					    
		  } else{
		    if(m_id=""){
		      $("#id_check").text("아이디를 입력해주세요! ");
		      $("#id_check").css("color", "red");
		    } else{
		      $("#id_check").text("입력 가능한 아이디입니다! ");
		      $("#id_check").css("color", "blue");
		    }
		    
		  }
		  
		}

	  })
	});
	
	//가입하기 버튼
	$("#joinBtn").click(function() {
		$.fn.serializeObject = function()
		{
		   var o = {};
		   var a = this.serializeArray();
		   $.each(a, function() {
		       if (o[this.name]) {
		           if (!o[this.name].push) {
		               o[this.name] = [o[this.name]];
		           }
		           o[this.name].push(this.value || '');
		       } else {
		           o[this.name] = this.value || '';
		       }
		   });
		   return o;
		};
		var parameter = JSON.stringify($("#joinForm").serializeObject());
		
		var password1 = $("#m_pwd").val();
		var password2 = $("#m_pwd2").val();

		if (password1 != password2) {
			alert("password가 일치하지 않습니다.");
			$("#password1").focus();
			e.preventDefault();
		}
		
		$.ajax({
			url : '${root}/member',
			type : 'POST',
			contentType : 'application/json;charset=UTF-8',
			dataType : 'json',
			data : parameter,
			success : function(data) {
				if(data.isSuccess == 'true') {
					location.href = "${root}/member/listform";
					//$(location).attr('href', 'member/list');
				}
			}
		});
	});
	

	
});

</script>
<body>


<!-- Container ======================================================================================= -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-header">
                <h2 id="container">회원 가입하기</h2>
            </div>

            <div class="well">
                <p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
                <form id="joinForm" class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">아이디</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디">
                            </div>
                            <div id="id_check" align="center"></div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">이름</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">이메일</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_email" name="m_email" placeholder="이메일">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">비밀번호</label>

                            <div class="col-lg-11">
                                <input type="password" class="form-control" id="m_pwd" name="m_pwd" placeholder="비밀번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">비밀번호 확인</label>

                            <div class="col-lg-11">
                                <input type="password" class="form-control" id="m_pwd2" placeholder="비밀번호 확인">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">생년월일</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_birth" name="m_birth" placeholder="생년월일 (입력 예: 2000-12-01)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">성별</label>

                            <div class="col-lg-11">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="1" id="m_gender" name="m_gender" checked="">
                                        남자
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" name="m_gender" value="2">
                                        여자
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">전화번호</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_tel" name="m_tel" placeholder="전화번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">우편번호</label>
                            <div class="col-lg-3">
                                <input type="text" class="form-control" id="m_postcode" name="m_postcode" readonly="readonly" placeholder="우편번호">
                            </div>
                            <div class="col-lg-2">
                                <input type="button" class="form-control btn btn-success" id="searchPostBtn" value="주소찾기">
                            </div>
                            <div class="col-lg-7">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">주소</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_address1" name="m_address1" placeholder="주소" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">상세주소</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_address2" name="m_address2" placeholder="주소">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-11 col-lg-offset-1">
                                <input id="joinBtn" type="button" class="btn btn-primary" value="확인">
                                <a href="/" class="btn btn-large btn-default">취소</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

    </div>

</div>




<div id="myModal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h5 class="modal-title">주소찾기</h5>
	      	</div>
			<div class="modal-body">
				<div>
					<h4>우편번호 검색</h4>
					<form action="/search" id="postSearchForm" method="GET">
						<fieldset>
							<div>
								<label>검색할 도로명/지번주소를 입력</label>
								<div>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="query" name="query" style="width: 472px;">
										<input type="hidden" id="currentPage" name="currentPage" value="">
									</div>
									<div class="col-lg-2">
										<button type="button" class="btn btn-success btn_search">검색</button>
									</div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				
				<div>
					<table class="table">
						<thead>
							<tr>
								<th>우편번호</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody id="postTbody">
							<tr>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        		<button type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>