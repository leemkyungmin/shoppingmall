<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1,user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<title>[약관] 개인정보 제3자 제공 동의 (필수)</title>
	<style>
		@charset utf-8;
		html,body,div,p,h1,h2,ul,ol,li,th,td {
			border:0;
			font-size:100%;
			margin:0;
			padding:0;
		}
		.container{
			margin: 18px 15px 0;
		}
		.container.en{
			font-family: Tahoma;
		}
		.container.ko{
			font-family: '돋움';
		}
		table {
			width:100%;
			border-collapse:collapse;
			border-spacing:0;
			table-layout: fixed;
			word-break: break-all;
		}
		table caption {
			overflow:hidden;
			width:1px;
			height:1px;
			font-size:0;
			line-height:0;
			text-indent: -9999px;
		}
		ol,ul {
			list-style:none;
		}
		a {
			text-decoration:none;
		}
		.articles{
			font-size:13px;
			color: #333;
		}
		.article {
			margin-bottom:26px;
		}
		.article-title {
			text-align:left;
			color:#333;
			font-size:15px;
			margin-bottom: 20px;
			font-weight:600;
		}
		.article-statement {
			font-size: 13px;
			line-height:20px;
		}
		.chapter {
			margin-top: 26px;
		}
		.chapter-title {
			text-align:left;
			font:bold 15px '돋움';
			color: #333;
			margin-bottom:18px;
		}
		.paragraphs {
			margin-left:16px;
			margin-bottom:10px;
		}
		.subparagraphs {
			padding-left:16px;
		}
		.paragraph,.subparagraph {
			font-size:13px;
			line-height:20px;
			padding-left:5px;
		}
		.paragraph-number,.subparagraph-number {
			margin-left:-15px;
			margin-right:6px;
		}
		.subparagraphs.basic-number .double-figures {
			padding-left:5px;
		}
		.subparagraphs.basic-number .double-figures .subparagraph-number {
			margin-right:2px;
			margin-left:-22px;
		}
		.subparagraphs.basic-number .subparagraph-number {
			margin-left:-20px;
		}
		.paragraphs.circle-number {
			margin-left:23px;
		}
		.paragraphs.circle-number .paragraph-number {
			margin-left:-23px;
		}
		.term-remark {
			color:red;
		}
		.term-attached-table {
			border:1px solid #9a9a9a;
			border-right:0;
			border-bottom:0;
		}
		.term-attached-table th{
			/* min-width:auto; */
			background:#ececec;
			border:1px solid #9a9a9a;
			border-top:0;
			border-left:0;
			text-align:center;
			font-size:12px;
			font-weight:bold;
			line-height:22px;
			color:#666;
		}
		.term-attached-table td {
			border:1px solid #9a9a9a;
			background-color:#fff;
			border-top:0;
			border-left:0;
			text-align:left;
			font-size:12px;
			line-height:22px;
			color:#666;
			padding:8px;
		}
		.term-title {
			color:#333;
			font-size:17px;
			font-weight:600;
		}
		.term-statement{
			font-size:13px;
			padding:18px 0 0;
		}
		.chapters {
		}
		.term-attached-table + .article-statement{
			margin-top:18px;
		}
		.term-external{
			text-decoration:underline;
			color:#333;
		}
		.term-external:active{
			color:#0000B2
		}
		/* 20190625 법무팀요청 : 볼드 처리 및 기존 폰트 사이즈 보다 20% 크게 */
		.point-policy {
			font-size: 16px; /* 13px + (13px * 0.2) = 15.6px */
			font-weight: bold;
		}
		.term-attached-table .point-policy {font-size: 15px;} /* 12px + (12px * 0.2) = 14.4px */
	</style>
</head>
<body>
<div class="container ko">
	<div class="chapters">
		<div class="chapter">
			<h1 class="chapter-title">개인정보 제3자 제공 동의 (필수)</h1>

			<div class="articles">
				<div class="article">
					<p class="article-statement">
						11번가 이용과 관련하여 본인은 동의내용을 숙지하였으며, 이에 따라 본인의 개인정보를 계정 연동 및 서비스 이용을 위한 이용자 식별, 연령 및 본인여부 확인을 목적으로 SK텔레콤 주식회사와 11번가 주식회사 간 제공하는 것에 동의합니다.
					</p>
				</div>
				<div class="article">
					<table class="term-attached-table">
						<caption>SK텔레콤㈜이 11번가㈜에게 제공하는 개인정보 제3자 제공 동의 항목</caption>
						<colgroup>
							<col style="width: 20%;">
							<col style="width: 30%;">
							<col style="width: 20%;">
							<col style="width: 30%;">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">제공 하는 자</th>
							<td colspan="3">SK텔레콤㈜</td>
						</tr>
						<tr>
							<th scope="row">제공 받는 자</th>
							<td colspan="3"><strong class="point-policy">11번가㈜</strong></td>
						</tr>
						<tr>
							<th scope="row">제공 목적</th>
							<td colspan="3">
								<strong class="point-policy">계정 연동 및 11번가 서비스 이용을 위한 이용자 식별, 연령 및 본인여부 확인</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">제공 항목</th>
							<td>
								이름, T아이디, 휴대폰번호(이동전화번호), 이메일 주소<br><br>
								※ 회원정보 최신화를 위해 11번가 로그인, T아이디 홈페이지에서 개인정보 수정 시에도 위 정보를 제공받아 11번가 회원정보를 갱신합니다.
							</td>
							<th scope="row">보유기간</th>
							<td>
								<strong class="point-policy">11번가 서비스 이용 기간</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">제공 항목</th>
							<td>
								성별, 생년월일, CI(연계정보)
							</td>
							<th scope="row">보유기간</th>
							<td>
								<strong class="point-policy">
									연령 및 본인여부 확인 과정에서 제공할 경우에만 저장하며, 반복적인 회원탈퇴 및 재가입 방지를 위해 탈퇴 후 1개월(셀러는 2개월) 동안 보관
								</strong>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="article">
					<table class="term-attached-table">
						<caption>11번가㈜이 SK텔레콤㈜에게 제공하는 개인정보 제3자 제공 동의 항목</caption>
						<colgroup>
							<col style="width: 20%;">
							<col>
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">제공 하는 자</th>
							<td>11번가㈜</td>
						</tr>
						<tr>
							<th scope="row">제공 받는 자</th>
							<td><strong class="point-policy">SK텔레콤㈜</strong></td>
						</tr>
						<tr>
							<th scope="row">제공 목적</th>
							<td>
								<strong class="point-policy">계정 연동 및 T아이디 서비스 이용을 위한 이용자 식별 및 본인여부 확인</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">제공 항목</th>
							<td>
								11번가 고객 중 T아이디로 11번가를 이용하는 11번가 고객의 아이디, CI(연계정보)*<br>
								* 기존 11번가 TEXT-ID를 보유한 고객만 해당
							</td>
						</tr>
						<tr>
							<th scope="row">보유기간</th>
							<td>
								<strong class="point-policy">11번가 서비스 이용기간</strong>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="article">
					<p class="article-statement">
						본 동의는 T아이디로 11번가를 이용하기 위해 필요한 동의로서, 동의하지 않으실 경우 T아이디로 11번가를 이용하실 수 없습니다.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>