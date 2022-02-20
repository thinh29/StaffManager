<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<style>
/*! CSS Used from: https://preview.tabler.io/dist/css/tabler.min.css?1638906463 */
*,::after,::before{box-sizing:border-box;}
body{margin:0;font-family:var(--tblr-body-font-family);font-size:var(--tblr-body-font-size);font-weight:var(--tblr-body-font-weight);line-height:var(--tblr-body-line-height);color:var(--tblr-body-color);text-align:var(--tblr-body-text-align);background-color:var(--tblr-body-bg);-webkit-text-size-adjust:100%;-webkit-tap-highlight-color:transparent;}
p{margin-top:0;margin-bottom:1rem;}
a{color:#206bc4;text-decoration:none;}
a:hover{color:#1a569d;text-decoration:underline;}
img,svg{vertical-align:middle;}
::-moz-focus-inner{padding:0;border-style:none;}
.btn{display:inline-block;font-weight:500;line-height:1.4285714;color:#1e293b;text-align:center;vertical-align:middle;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-color:transparent;border:1px solid transparent;padding:.4375rem 1rem;font-size:.875rem;border-radius:4px;transition:color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;}
@media (prefers-reduced-motion:reduce){
.btn{transition:none;}
}
.btn:hover{color:#1e293b;text-decoration:none;}
.btn:focus{outline:0;box-shadow:0 0 0 .25rem rgba(32,107,196,.25);}
.btn:disabled{pointer-events:none;opacity:.65;}
.d-flex{display:flex!important;}
.border-top-wide{border-top:2px solid rgba(98,105,118,.16)!important;}
.border-primary{border-color:#206bc4!important;}
.flex-column{flex-direction:column!important;}
.py-4{padding-top:2rem!important;padding-bottom:2rem!important;}
.text-muted{--tblr-text-opacity:1;color:#626976!important;}
body{overflow-y:scroll;letter-spacing:0;touch-action:manipulation;text-rendering:optimizeLegibility;font-feature-settings:"liga" 0;position:relative;min-height:100%;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;}
@media print{
body{background:0 0;}
}
::-webkit-scrollbar{width:6px;height:6px;-webkit-transition:background .3s;transition:background .3s;}
@media (prefers-reduced-motion:reduce){
::-webkit-scrollbar{-webkit-transition:none;transition:none;}
}
::-webkit-scrollbar-thumb{border-radius:5px;background:rgba(var(--tblr-body-color-rgb),.16);}
::-webkit-scrollbar-track{background:rgba(var(--tblr-body-color-rgb),.06);}
:hover::-webkit-scrollbar-thumb{background:rgba(var(--tblr-body-color-rgb),.32);}
::-webkit-scrollbar-corner{background:0 0;}
.page{display:flex;flex-direction:column;position:relative;min-height:100vh;}
.page-center{justify-content:center;}
.btn{--tblr-btn-color-text-rgb:var(--tblr-body-color-rgb);display:inline-flex;align-items:center;justify-content:center;border-color:var(--tblr-border-color);white-space:nowrap;background-color:var(--tblr-btn-color,var(--tblr-card-bg));color:var(--tblr-btn-color-text);}
.btn:hover{color:var(--tblr-btn-color-text);border-color:rgba(var(--tblr-btn-color-text-rgb),.48);}
.btn:focus:not([disabled]):not(.disabled){border-color:var(--tblr-btn-color,#206bc4);}
.btn:disabled{cursor:not-allowed;}
.btn .icon{width:1.25rem;height:1.25rem;min-width:1.25rem;margin:0 .5rem 0 -.25rem;vertical-align:bottom;color:inherit;}
.btn-primary{border-color:rgba(98,105,118,.24);}
.btn-primary:hover{color:var(--tblr-btn-color-text);background:var(--tblr-btn-color-interactive);border-color:var(--tblr-btn-color);}
.btn-primary{--tblr-btn-color:#206bc4;--tblr-btn-color-interactive:#1d60b0;--tblr-btn-color-text:#f8fafc;}
.empty{display:flex;flex-direction:column;align-items:center;justify-content:center;height:100%;padding:1rem;text-align:center;}
@media (min-width:768px){
.empty{padding:3rem;}
}
.empty-img{margin:0 0 2rem;line-height:1;}
.empty-img img{height:8rem;width:auto;}
.empty-title{font-size:1.25rem;line-height:1.4;font-weight:600;}
.empty-subtitle,.empty-title{margin:0 0 .5rem;}
.empty-action{margin-top:1.5rem;}
.container-tight{width:100%;padding-right:var(--tblr-gutter-x,1.5rem);padding-left:var(--tblr-gutter-x,1.5rem);margin-right:auto;margin-left:auto;max-width:30rem;}
.icon{width:1.25rem;height:1.25rem;font-size:1.25rem;vertical-align:bottom;stroke-width:1.5;}
.icon:hover{text-decoration:none;}
a{-webkit-text-decoration-skip:ink;text-decoration-skip-ink:auto;}
img{max-width:100%;}
::-moz-selection{color:#fff;background-color:#307fdd;}
::selection{color:#fff;background-color:#307fdd;}
</style>
<link
	href="/template/library/bootstrap/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="border-top-wide border-primary d-flex flex-column theme-light">
    <div class="page page-center">
      <div class="container-tight py-4">
        <div class="empty">
          <div class="empty-img"><img src="https://i.imgur.com/guZphAZ.png" height="128" alt="">
          </div>
          <p class="empty-title">Opp! Đã có lỗi xảy ra</p>
          <p class="empty-subtitle text-muted">
          	Vui lòng quay thử lại hoặc quay về trang chủ tại đây!
          </p>
          <div class="empty-action">
            <a href="/" class="btn btn-primary">
              <!-- Download SVG icon from http://tabler-icons.io/i/arrow-left -->
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="5" y1="12" x2="19" y2="12"></line><line x1="5" y1="12" x2="11" y2="18"></line><line x1="5" y1="12" x2="11" y2="6"></line></svg>
              Take me home
            </a>
          </div>
        </div>
      </div>
    </div>    
  
</body>
</html>