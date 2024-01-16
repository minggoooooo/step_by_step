<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp"%>
<%
	String UserId = (String)session.getAttribute("userId");
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> scheduleList = dao.selectClosedSchedule(UserId);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 마감된 일정</title>
<link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/MyPage2.css" rel="stylesheet">
</head>
<body>

	<div id="root">
		<div class="app">
			<div class="container">
				<!-- header.jsp 시작 -->
				<%@ include file="header.jsp"%>
				<!-- header.jsp 끝 -->
				<div id="contentWrapper">
					<div id="contentWrap">

						<div id="content">
							<div id="mypage">
								<h2 class="tit-page">마이페이지</h2>
								<div class="my_info">
								<div id="profile_i"></div>
									<h2>
										안녕하세요, <span class="userName"><%=UserId%></span>님!
									</h2>

								</div>
								<div class="page-body">
				
									<!-- //info -->
									<div class="info_box">
										<div class="mypage_menu">
											<ul>
												<h2>나의 크루활동</h2>
												<h4>가입신청현황</h4>
												<li><a href="MyPage-sub3.jsp">- 단기크루</a></li>
												<li><a href="MyPage-sub3-longCrew.jsp">- 장기크루</a></li>
												<h4>개설현황</h4>
												<li><a href="MyPage-sub4.jsp">- 단기크루</a></li>
												<li><a href="MyPage-sub4-longCrew.jsp">- 장기크루</a></li>
												<h4>활동 중인 크루</h4>
												<li><a href="MyPage-ongoing.jsp">- 단기크루</a></li>
												<li><a href="MyPage-ongoing-longCrew.jsp">- 장기크루</a></li>
												<h4>일정 관리 현황</h4>
												<li><a href="MyPage-plan-schedule.jsp">- 예정된 일정</a></li>
												<li><a href="MyPage-fin-schedule.jsp">- 마감된 일정</a></li>
											</ul>
											<ul>
												<h2>나의 정보 관리</h2>
												<h4>
													<a href="edit-MemINFO.jsp">회원정보 변경</a>
												</h4>
												<h4>
													<a href="withdrawal.jsp">회원 탈퇴</a>
												</h4>
											</ul>
										</div>


										<div class="info_cont">
											<div class="hd">
												<h3>일정 관리 현황</h3><h4>마감된 일정</h4>
											</div>
											
											<c:forEach items="<%=scheduleList%>" var="schedule">
												<form action="CourseServlet" method="post">
													<div class="tbl Row">
														<colgroup>
															<col width="100%">
														</colgroup>
														<div class="tbl-01">
															<table>
																<tr>
																	<td class="txt-H">크루명</td>
																	<td class="txt-C">${schedule.crewName}</td>
																</tr>
																<tr>
																	<td class="txt-H">크루 일정</td>
																	<td class="txt-C">${schedule.gatherDate}</td>
																</tr>
																<tr>
																	<td class="txt-H">목표 코스</td>
																	<td class="txt-C">${schedule.courseId}</td>
																</tr>
															</table>
															<input type="hidden" name="no" value="${schedule.no}">
															<input type="hidden" name="courseId" value="${schedule.courseId}">
														</div>
														<div class="tbl-02 Col-C">
															<a href="#"><div class="detail">상세보기 ></div></a>
															<!-- 사용자가 일정완료 버튼 안 눌렀으면 버튼 보이게 설정 -->
															<c:if test="${schedule.complete eq true}">
																<button type="submit" class="join_btn fin">일정완료</button>
															</c:if>
														</div>
		
													</div>
												</form>
											</c:forEach>
											

										</div>
									</div>
								</div>
							</div>
							<!-- .page-body -->
						</div>
						<!-- #mypage -->
					</div>
					<!-- #content -->
				</div>
				<%@ include file="footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>