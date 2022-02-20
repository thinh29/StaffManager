<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Thông báo(số thông báo chưa đọc) | Quản trị viên</title>
</head>
<body>
 <div class="container-fluid">
<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">${Noti.title}</h1>   
                         <div class="d-sm-inline-block ">  	
                            <a href="/admin/notifications" class="btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-arrow-alt-circle-down fa-sm text-white-50"></i> Danh sách thông báo
                            </a>
                            
                            
                        </div>   
                    </div>

                    <!-- Content Row -->
                    <form action="/admin/notifications" id="noti-form-delete" method="post" >
                    	<input type="hidden" name="type" value="del">
                    	<input type="hidden" name="id" value="1">
                    </form>
                    <div class="alert alert-primary" role="alert">
						<b><i class='fas fa-user'></i> Người gửi : </b>${createAcc.fullName}<br>
						<b><i class='fas fa-calendar'></i> Ngày gửi : </b>
						 <fmt:formatDate value="${Noti.createAt}" var="crAt"
																pattern="dd/MM/yyyy HH:mm" />
						${crAt}
					</div>
                    
                    <hr>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card shadow mb-4">
                                <!-- Card Body -->
                                <div class="card-body">
                                   ${Noti.content}

                                </div>
                            </div>
                        </div>
                    </div>

                   
                    <!-- Content Row -->
                
                </div>
                <script>
                function lazySubmit(e) {
            		e.preventDefault();	
            		var x = document.getElementById('prj-lzloading');
            		x.classList.add("d-flex");	
            		var form = document.getElementById("noti-form-delete");	
            		setTimeout(() => {
            			form.submit();
            			x.classList.remove("d-flex");	
            		}, 2000);			
            	}
        		document.addEventListener("DOMContentLoaded", function(){
                $(".noti-delete").click(function(e){
        			Swal.fire({
        				  title: 'Xoá thông báo ?',
        				  icon: 'warning',
        				  showCancelButton: true,
        				  confirmButtonColor: '#3085d6',
        				  cancelButtonColor: '#d33',
        				  confirmButtonText: 'Xoá !'
        				}).then((result) => {
        				  if (result.isConfirmed) {
        					  lazySubmit(event);
        					  $("#"+e.target.id).submit();
        				  }
        				})
        			});
        		});
                </script>
</body>
</html>