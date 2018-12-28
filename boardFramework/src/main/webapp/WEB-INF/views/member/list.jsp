<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<style>
.memberListTBody tr td {
	font-size: 11pt;
}

</style>
<body>

<!-- Container ======================================================================================= -->
<div class="container">
	<div class="row">
        <div class="col-lg-12">
            <!-- ★★★ Tab Panel -->
            <div id="communityList" class="tab-content">
                <!-- ★★★ 가입 커뮤니티 -->
                <div class="tab-pane fade active in" id="joined">
                    <div class="page-header">
                        <h2 id="container">회원목록</h2>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form class="form-search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="회원명 또는 ID">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-primary">검색</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>

 										<div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center">번호</th>
                                <th class="text-center">ID</th>
                                <th class="text-center">회원명</th>
                                <th class="text-center">전화번호</th>
                                <th class="text-center">가입일</th>
                                <th class="text-center">관리</th>
                            </tr>
                            </thead>
                            <tbody class="memberListTBody">
                            <!--<tr><td colspan="5" class="text-center">가입한 회원이 없습니다.</td></tr>-->
                            <tr>
                                <td class="text-center">1</td>
                                <td>gglim</td>
                                <td><a href="./view.html">임경균</a></td>
                                <td>010-0000-0000</td>
                                <td>2004/02/18</td>
                                <td align="center">
                                	<input type="button" class="btn btn-danger btn-sm DeleteBtn" value="탈퇴">
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">1</td>
                                <td>gglim</td>
                                <td><a href="./view.html">임경균</a></td>
                                <td>010-0000-0000</td>
                                <td>2004/02/18</td>
                                <td align="center">
                                	<input type="button" class="btn btn-danger btn-sm DeleteBtn" value="탈퇴">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>