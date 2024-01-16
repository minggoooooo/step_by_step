<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title></title>
<link href="resources/css/login3.css" rel="stylesheet">
<link href="resources/css/MyPage2.css" rel="stylesheet">
<link href="resources/css/courseRegister.css" rel="stylesheet">
</head>
<body>

	<!-- login.jsp 구조 -->
	<div id="root">
		<div class="app">
			<div class="container">
				<!-- header.jsp 시작 -->
				<!-- <div class="banner"></div>
				 <div class="header"></div> -->
				<%@ include file="header.jsp"%>
				<!-- header.jsp 끝 -->

				<div class="mid">
					<div class="mid-inner"></div>
				</div>


				<div class="p_login">
					<div class="wrap-log-con">
						<div class="i_close">
							<a href="#"> <img
								src="https://m.bunjang.co.kr/pc-static/resource/ee442d3dd827628bc5fe.png"
								width="24" height="24">
							</a>
						</div>
						<div class="log-con">
							<h1>코스 등록하기</h1>
						</div>
						<div class="tbl Row">
							<colgroup>
								<col width="100%">
							</colgroup>
							<form action="UploadServlet" method="post" enctype="multipart/form-data">
								<div class="tbl-01">
									<table>
										<tr>
											<td class="txt-H" style="width: 15%">장소</td>
											<td  style="width: 85%">
												<div class="log-sec">
													<input type="text" class="login-h2" name="location"
														placeholder="장소를 입력하세요">
												</div>
											</td>
										</tr>
										<tr>
											<td class="txt-H">거리</td>
											<td>
												<div class="log-sec">
													<input type="text" class="login-h2" name="length"
														placeholder="거리를 입력하세요 (km기준)">
												</div>
											</td>
										</tr>
										<tr>
											<td class="txt-H">예상시간</td>
											<td>
												<div class="log-sec">
													<input type="text" class="login-h2" name="expect_time"
														placeholder="예상시간을 입력하세요 ex)2시간 30분">
												</div>
											</td>
										</tr>
										<tr>
											<td class="txt-H">난이도</td>
											<td>
												<div class="log-sec">
													<input type="text" class="login-h2" name="difficulty	"
														placeholder="난이도를 입력하세요 ex)중">
												</div>
											</td>
										</tr>
										<tr>
											<td class="txt-H">목표코스</td>
											<td>
												<div class="log-sec">
													<input type="text" class="login-h2"
														placeholder="현재는 gpx 파일만 등록 가능합니다" readonly>
												</div>
											</td>
										</tr>
										<tr>
											<td class="txt-H">코스 File</td>
											<td>
												<div class="log-sec">
													 <input type="file" name="file_id"  accept=".gpx" class="login-h2" > 
												</div>
											</td>
										</tr>
									</table>
									<input type="submit" value="등록하기" class="log-btn">
								</div>
							</form>
						</div>
					</div>

					<!-- footer.jsp 시작 -->
					<!--  <div class="footer"></div> -->
					<!-- footer.jsp 끝 -->

				</div>
			</div>
		</div>
	</div>
</body>

</html>
