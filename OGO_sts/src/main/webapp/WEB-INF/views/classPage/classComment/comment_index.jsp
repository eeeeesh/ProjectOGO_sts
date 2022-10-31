<%@page import="com.dto.comment.ClassCommentPageDTO"%>
<%@page import="com.dto.member.MemberDTO"%>
<%@page import="com.dto.comment.ClassCommentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
 	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Jua&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@900&family=Sunflower:wght@300&display=swap" rel="stylesheet">
	<link rel='stylesheet' href='css/classComment/comment.css'>
<!-- 값없을 시 제외 -->
<%
	MemberDTO mDTO= (MemberDTO)session.getAttribute("login"); 
	String userId=null;
	if(mDTO!=null){ //로그인 되어있는 경우
		userId = mDTO.getUserId();
	}
%>
<script type="text/javascript">
	 $(function() {
		 
		 $("textarea").on("click", function() {
			 $("textarea").text("");
		})
		 /* create button */
			$("#createComment").on("click", function() {
				if ('<%=userId%>'=='null') {
					alert("로그인 후 작성해주세요");
					event.preventDefault();
				}else{
					var commentText= $("#commentText").val();
					console.log(commentText);
					//event.preventDefault();
					$("#cmt_form").attr("action","loginCheck/commentCreate");
				}
				
			})
		
		/* update button */
		$(".updateComment").on("click", function() {
			alert("후기 수정");
			event.preventDefault();
		})
		/* delete button */
		$(".deleteComment").on("click", function() {
			var cmt_userid=$(this).attr("data-userId").trim();
			console.log(cmt_userid)
			if ('<%=userId%>'=='null') {
				alert("로그인 후 작성해주세요");
				event.preventDefault();
			}else if(cmt_userid !='<%=userId%>'){
				alert("본인의 수강후기만 삭제할 수 있습니다");
			}else{
				console.log($(this).attr("data-cmtNum"));
				var cmtNum= $(this).attr("data-cmtNum");
				event.preventDefault();
				//ajax 
				$.ajax({
					type: "get",
					url: "loginCheck/commentDelete", 
					dataType: "text",
					async: false,
					data: { //서버에 넘겨줄 데이터
						cmtNum : cmtNum
					},
					success: function(data, status, xhr) {
						console.log("success");
						console.log(data);
						if (data=="삭제 성공") {
							$("#cmt_"+cmtNum).remove();
							alert("후기를 삭제했습니다");
						}
					},
					error: function(xhr, status, e) {
						console.log("error");
						console.log(e, status);
					}
				})//ajax end 
			}
			
		})
		
		
	}) //end funtion 
 
 <% String mesg = (String) session.getAttribute("mesg"); 
 	if(mesg != null){
 %>
	alert("<%= mesg %>");
<%} session.removeAttribute("mesg"); %> 
</script>
<div>수강생 후기</div> <!--header--><br>
<hr>
<br>
<c:forEach var="cmtList" items="${cmtDTO}">
  <div class="comment" id="cmt_${cmtList.getComment_no()}">
  	userId:
	<span class="comment_userId">
		${cmtList.getUserid()}
	</span>&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="comment_notice" >
		${cmtList.getComment_notice()}
	</span>&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="comment_date">
		${cmtList.getComment_date()}
	</span>&nbsp;
	<!-- 로그인한 유저와 후기 작성 유저의 아이디가 일치할 경우에만 보이도록 설정하기 -->
<%-- <c:if test="${cmtList.getUserid()} eq '<%=userId %>'"> --%>
	<span class="comment_update">
		<button type="submit" class="btn btn-secondary updateComment" >수정</button>
	</span>&nbsp;
	<span class="comment_delete">
		<button type="submit" class="btn btn-secondary deleteComment" 
		data-cmtNum="${cmtList.getComment_no()}" 
		data-userId="${cmtList.getUserid()}">삭제</button>
		
	</span>

  </div>
</c:forEach>
<br>
  <form action="" id="cmt_form" method="post" >
	<div id="commentArea">
		<textarea id="commentText" name="commentText" rows="2" cols="100">후기를 작성해주세요</textarea>
		<button type="submit" class="btn btn-secondary" id="createComment">작성</button>
		<!-- <div class="d-grid gap-2 col-6 mx-auto">
	  	   <button type="submit" class="btn btn-secondary" id="createComment">작성</button>
		</div -->>
	</div>
	
  </form>
  
 