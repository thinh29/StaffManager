<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Trang chủ | Staff Manager</title>
</head>
<body>
	<div class="st--home-wapper">
		<div class="row row--home">
			<div class="col-6 col--infor ">
				<div class="mt-3 text-right mr-20">
					<h4 class="h4--hello">Xin chào, ${account.fullName }</h4>
					<p class="text-secondary mb-1">${types.get(account.typeId-1).name }</p>
					<p class="text-muted font-size-lg">Chúc bạn một ngày làm việc hiệu quả</p>
				</div>
			</div>
			<div class="col-6 col--image">
				<svg viewBox="0 0 200 187" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" style="height:100%;">
    <mask id="mask0" mask-type="alpha" >
        <path
						d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 165.547 
        130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 129.362C2.45775 
        97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 -0.149132 97.9666 
        0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z" />
    </mask>
    <g mask="url(#mask0)">
        <path
						d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 
        165.547 130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 
        129.362C2.45775 97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 
        -0.149132 97.9666 0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z" />
        <image href="https://bootdey.com/img/Content/avatar/avatar7.png" style="height:100%;"/>
    </g>
</svg>
			</div>
		</div>
	</div>
</body>
</html>