<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    // 검색버튼 눌렸을 때 함수 실행
    $(".btn_search").click(function(e){
        e.preventDefault();
        // ajax
        $.ajax({
            // zip_codeList controller 진입 url
            url : "zip_codeList",
            // zip_codeForm을 serialize 해줍니다.
            data : $("#searchForm").serialize(),
            type : "POST",
            // dataType 은 json형태로 보냅니다.
            dataType : "json",
            success : function(result){
                $("#zip_codeList").empty();
                var html = "";
                if(result.errorCode != null && result.errorCode != ""){
                    html += "<tr>";
                    html += "    <td colspan='2'>";
                    html +=            result.errorMessage;
                    html += "    </td>";
                    html += "</tr>";
                }
                else{
                    // 검색결과를 list에 담는다.
                    var list = result.list;
                    
                    for(var i = 0; i < list.length; i++){
                        html += "<tr>";
                        html += "    <td>";
                        // 우편번호
                        var zipcode = list[i].zipcode;
                        // 주소
                        var address = list[i].address;
 
                        html +=         list[i].zipcode;
                        html += "    </td>";
                        html += "    <td>";
                        html +=     '<a href="#" onclick="put(\'' + list[i].address + '\',\'' + zipcode + '\')">' + address + '</a>';
                        html += "    </td>";
                        html += "</tr>";
                    }
                }
                // 완성된 html(우편번호 list)를 zip_codeList밑에 append
                $("#zip_codeList").append(html);
            }
        });
    });
});
 
/* // 원하는 우편번호 선택시 함수 실행
function put(address,zipcode){
    var address = address;
    var zipcode = zipcode;

    $("#zip_code").val(zipcode);
    $("#address1").val(address);
} */
 
</script>

</head>
<body style="">
	<div>
		<div>
			<div>
				<h2>우편번호 검색</h2>
				<form action="/search" id="searchForm" method="GET">
					<fieldset>
						<legend>우편번호 검색 입력폼</legend>
						<div>
							<label>검색할 도로명/지번주소를 입력</label>
							<div>
								<input type="text" name="query" style="width: 472px;">
								<button type="button" class="btn_search">검색</button>
							</div>
						</div>
					</fieldset>
				</form>
				<div id="postCodeSuggestLayer" class="suggest_search">
					<div class="suggestBox box_sub" style="display: none;">
						<div class="baseBox bg"></div>
					</div>
				</div>

			</div>
			
			<div>
				<table id="zip_codeList"></table>
			
			</div>
			<!-- <div class="popup_body">
				<div class="info_body">
					<h2 class="tit_tip">tip</h2>
					<p class="desc_tip">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
					<p class="desc_tip">도로명 + 건물번호</p>
					<span class="txt_example">예) 판교역로 235,&nbsp;&nbsp;제주 첨단로 242</span>
					<p class="desc_tip2">지역명(동/리) + 번지</p>
					<span class="txt_example">예) 삼평동 681,&nbsp;&nbsp;제주 영평동 2181</span>
					<p class="desc_tip2">지역명(동/리) + 건물명(아파트명)</p>
					<span class="txt_example">예) 분당 주공,&nbsp;&nbsp;연수동 주공3차</span>
					<p class="desc_tip2">사서함명 + 번호</p>
					<span class="txt_example">예) 분당우체국사서함 1~100</span>
				</div>
			</div> -->
		</div>
	</div>

</body>

</html>