<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>관리자 블랙리스트 관리</title>
<style>
.empty {
	margin-top: 30px;
}

/* search 영역 */
#searchDiv {
	vertical-align: text-bottom;
}

#searchMember {
	margin: 0;
	display: inline;
	width: 30%;
}

.magnifier {
	width: 30px;
	height: 30px;
}

.fastbtn {
	background-color: rgb(8, 0, 83);
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 30px;
}

.fastclosebtn {
	background-color: rgb(171, 171, 171);
	color: white;
	border: 3px solid rgb(171, 171, 171);
	border-radius: 30px;
}

#searchBtn {
	position: relative;
	display: inline-block;
	padding: 0.25em 0.75em 0.25em 0.75em;
	outline: 0;
	bottom: 1.5px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-12" id="serchDiv">
				<input type="text" class="form-control" id="searchMember"
					name="mem_id" placeholder="회원 아이디 검색">
				<button type="button" class="fastbtn" id="searchBtn">
					<img src="/resources/images/magnifier.png" class="magnifier">
				</button>
			</div>
		</div>
		<div class="empty"></div>
		<table class="table">
			<thead class="table-light">
				<tr>
					<th>카테고리</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>신고유저 닉네임</th>
					<th>신고내역 보기</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${reportList.size() == 0}">
						<tr>
							<td colspan="5">등록된 신고내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${reportList}" var="dto">
							<tr>
								<td>${dto.mem_std_key}</td>
								<td>${dto.mem_id}</td>
								<td>${dto.mem_nick}</td>
								<td>${dto.report_nick}</td>
								<td><button type="button" class="fastbtn"
										id="reportContent" data-bs-toggle="modal"
										data-bs-target="#reportModal${dto.report_seq}">신고내용</button></td>
							</tr>
							<!-- Modal -->
							<div class="modal fade" id="reportModal${dto.report_seq}"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">신고내용</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">${dto.report_reason}</div>
										<div class="modal-footer" id="modal-footer">
											<button type="button" class="fastclosebtn"
												data-bs-dismiss="modal">닫기</button>
											<button type="button" class="fastbtn blackBtn"
												value="${dto.mem_seq}">블랙리스트 추가</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="empty"></div>
		<nav>
			<ul class="pagination justify-content-center" id="pagingUl">
				<c:if test="${naviMap.needPrev eq true}">
					<li class="page-item"><a class="page-link"
						href="/admin/toBlacklist?curPage=${naviMap.startNavi-1}"><span
							aria-hidden="true">&laquo;</span> </a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${naviMap.startNavi}"
					end="${naviMap.endNavi}" step="1">
					<li class="page-item"><a class="page-link"
						href="/admin/toBlacklist?curPage=${pageNum}">${pageNum}</a></li>
				</c:forEach>
				<c:if test="${naviMap.needNext eq true}">
					<li class="page-item"><a class="page-link"
						href="/admin/toBlacklist?curPage=${naviMap.endNavi+1}"><span
							aria-hidden="true">&raquo;</span> </a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		$("#searchBtn").on("click", function() {
			if($("#searchMember").val() === "") {
				alert("회원 아이디를 입력해주세요.");
				$("#searchMember").focus();
				return;
			} 
			let mem_id = $("#searchMember").val();
			let curPage = 1;
			$.ajax({
				url: "/admin/searchMember"
				,data: {mem_id : mem_id, curPage : 1}
				,dataType: "json"
				,success: function(data){
					ajaxFunction(data);
					let input = $("<input>").attr({
						id : "getMem_id",
						class : "d-none",
						value : data.mem_id
					});
					input.appendTo("tbody");
				}, error: function(e){
					console.log(e);
				}
			})
		})
		
		$(document).on("click", ".link", function(){
			let curPage = this.getAttribute('data-value');
			let mem_id = $("#getMem_id").val();
			
			$.ajax({
				url: "/admin/searchMember"
				,data: {mem_id : mem_id, curPage : curPage}
				,dataType: "json"
				,success : function(data){
					ajaxFunction(data);
					let input = $("<input>").attr({
						id : "getMem_id",
						class : "d-none",
						value : data.mem_id
					});
					input.appendTo("tbody");
				}, error : function(e){
					console.log(e);
				}
			})
		})
		
		let blackBtn = document.getElementsByClassName("blackBtn");
		for(let btn of blackBtn){
			btn.onclick = function(e){
				let mem_seq = this.value;
				let answer = confirm("블랙리스트에 추가하시겠습니까?");
				if(answer){
					location.href = "/admin/addBleck?mem_seq="+mem_seq;
				} else {
					return;
				}
				
			}
		}
		
		let ajaxFunction = function(data){
			$("tbody").empty();
			if(data.list.length == 0) {
				let tr = $("<tr>");
				let td = $("<td colspan='5'>").html("등록된 신고내역이 없습니다.");
				tr.append(td);
				tr.appendTo($("tbody"));
			} else {
				for(let dto of data.list){
					let tr = $("<tr>");
					let td1 = $("<td>").html(dto.mem_std_key);
					let td2 = $("<td>").html(dto.mem_id);
					let td3 = $("<td>").html(dto.mem_nick);
					let td4 = $("<td>").html(dto.report_nick);
					let td5 = $("<td>")
					let ContentBtn = $("<button>").attr({
						type : "button",
						class : "fastbtn",
						id : "reportContent",
						"data-bs-toggle" : "modal",
						"data-bs-target" : "#reportModal"+dto.report_seq
					}).html("신고내용");
					
					let div1 = $("<div>").attr({
						class : "modal fade",
						id : "reportModal"+dto.report_seq,
						"data-bs-backdrop" : "static",
						"data-bs-keyboard" : "false",
						"tabindex" : "-1",
						"aria-labelledby" : "staticBackdropLabel",
						"aria-hidden"  : true,
					})
					let div2 = $("<div>").attr({class : "modal-dialog"});
					let div3 = $("<div>").attr({class : "modal-content"});
					let div4 = $("<div>").attr({class : "modal-header"});
					let div4H = $("<h5>").attr({
						class : "modal-title",
						id : "staticBackdropLabel"
					}).html("신고내용");
					let div4Btn = $("<button>").attr({
						type : "button",
						class : "btn-close",
						"data-bs-dismiss" : "modal",
						"aria-label" : "Close"
					});
					div4.append(div4H, div4Btn);
					
					let div5 = $("<div>").attr({class : "modal-body"}).html(dto.report_reason);
					let div6 = $("<div>").attr({
						class : "modal-footer",
						id : "modal-footer"
					});
					let div6btn1 = $("<button>").attr({
						type : "button",
						class : "btn btn-secondary",
						"data-bs-dismiss" : "modal"
					}).html("닫기");
					let div6btn2 = $("<button>").attr({
						type : "button",
						class : "btn btn-primary blackBtn",
						value : dto.mem_seq
					}).html("블랙리스트 추가");
					div6.append(div6btn1, div6btn2);
					div3.append(div4, div5, div6);
					div2.append(div3);
					div1.append(div2);
					
					td5.append(ContentBtn);
					tr.append(td1, td2, td3, td4, td5);
					tr.appendTo($("tbody"));
					div1.appendTo($("tbody"));
				}
				$("#pagingUl").empty();
				if(data.naviMap.needPrev){
					let prevLi = $("<li>").attr({class : "page-item"});
					let prevA = $("<a>").attr({
						class : "page-link link",
						"data-value" : data.naviMap.startNavi-1,
					})
					let prevSpan = $("<span>").attr({ "aria-hidden" : "true"}).html("&laquo;");
					prevA.append(prevSpan);
					prevLi.append(prevA);
					prevLi.appendTo($("#pagingUl"));
				}
				for(let i=data.naviMap.startNavi; i<=data.naviMap.endNavi; i++){
					let numLi = $("<li>").attr({class : "page-item"});
					let numA = $("<a>").attr({
						class : "page-link link",
						"data-value" : i,
					});
					numA.html(i);
					numLi.append(numA);
					numLi.appendTo($("#pagingUl"));
				}
				if(data.naviMap.needNext){
					let nextLi = $("<li>").attr({class : "page-item"});
					let nextA = $("<a>").attr({
						class : "page-link link",
						"data-value" : data.naviMap.endNavi+1,
					})
					let nextSpan = $("<span>").attr({ "aria-hidden" : "true"}).html("&raquo;");
					nextA.append(nextSpan);
					nextLi.append(nextA);
					nextLi.appendTo($("#pagingUl"));
				}
			}
		}
	</script>
</body>
</html>