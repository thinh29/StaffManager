<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Sửa Thông báo(${Noti.title}) | Quản trị viên</title>
</head>
<body>
	<!-- Begin Page Content -->
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
                            </a>                        </div>
                        
                    </div>

                    <!-- Content Row -->
                    <hr>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <form action="/admin/notifications" method="post" id="noti-form-edit" onsubmit="lazySubmit(event)">
                                    	<input type="hidden" name="type" value="edit">
                                    	<input type="hidden" name="id" value="${Noti.id}">
                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                              <label>Tiêu đề thông báo</label>
                                              <input type="text" class="form-control" name="title" value="${Noti.title}" id="title">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Loại thông báo</label>
                                                <select id="level" name="level" class="form-control">
                                                <c:forEach var="lv" items="${listLevel}" varStatus="loop"> 
                                                <option value="${lv.id}">${lv.name}</option>
                                                </c:forEach>
                                                  </select>
                                              </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Người nhận</label>
                                            <select onchange="validateSelectBox(this)" class="form-control" id='noti-select' data-style='noti-form' multiple data-live-search="true" data-live-search-placeholder="Search" tabindex="-98">
                                                <!--  <option>Chọn tất cả</option> -->
                                                <c:forEach var="acc" items="${listAcc}" varStatus="loop"> 
                                                <option value="${acc.idAcc}">${acc.fullNameStaff} - ${positionstaff.get(acc.idPosition-1).name}</option>
                                                </c:forEach>
                                            </select>
                                                <input type="hidden" value="" id="idac" name="idac" />
                                                <input type="hidden" value="" id="length" name="length" />
                                        </div>
                                        <div class="form-group ">
                                            <label>Nội dung thông báo</label>
                                            <textarea id="t-content" name="content">${Noti.content}</textarea>
                                          </div>
						                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                      </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Lịch sử cập nhật</h6>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                              <label>Người tạo</label>
                                              <input type="text" class="form-control" value="${createBy.fullName}"  disabled>
                                            </div>
                                            
                                            <div class="form-group col-md-4">
                                                <label>Ngày tạo</label>
                                                  <fmt:formatDate value="${Noti.createAt}" var="crAt"
																pattern="dd/MM/yyyy HH:mm" />
                                                <input type="text" class="form-control" value="${crAt}"  disabled>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                              <label>Người cập nhật</label>
                                              <input type="text" class="form-control" value="${updateBy.fullName}"  disabled>
                                            </div>
                                            
                                            <div class="form-group col-md-4">
                                                <label>Ngày cập nhật</label>
                                                 <fmt:formatDate value="${Noti.updateAt}" var="upAt"
																pattern="dd/MM/yyyy HH:mm" />
                                                <input type="text" class="form-control" value="${upAt}"  disabled>
                                            </div>
                                        </div>
                                      </form>
                                </div>
                            </div>
                        </div>
                    </div>
	</div>
	<script>
	function validateSelectBox(obj)
    {
        // Lấy danh sách các options
        var options = obj.children;
        var result = [];
        for (var i = 0; i < options.length; i++){
            if (options[i].selected){
                result[i] = options[i].value;
            }
        }
        $('#idac').val(result);
        $('#length').val(result.length);

    }
	function lazySubmit(e) {
		e.preventDefault();	
		var x = document.getElementById('prj-lzloading');
		x.classList.add("d-flex");	
		var form = document.getElementById("noti-form-edit");	
		setTimeout(() => {
			form.submit();
			x.classList.remove("d-flex");	
		}, 2000);			
	}
    window.addEventListener("load", function(){
    	tinymce.init({
    		  selector: 'textarea#t-content',
    		  height: 500,
    		  menubar: false,
    		  plugins: [
    		    'advlist autolink lists link image charmap print preview anchor',
    		    'searchreplace visualblocks code fullscreen',
    		    'insertdatetime media table paste code help wordcount'
    		  ],
    		  toolbar: 'undo redo | formatselect | ' +
    		  'bold italic backcolor | alignleft aligncenter ' +
    		  'alignright alignjustify | bullist numlist outdent indent | ' +
    		  'removeformat | help',
    		  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
    		});
		$('#noti-select').selectpicker();
		$("#yeucau").click(function(){
			Swal.fire({
				  title: 'Cập nhật thông báo ?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Cập nhật !'
				}).then((result) => {
				  if (result.isConfirmed) {
					  lazySubmit(event);
				  }
				})
		});

	});
	</script>
</body>
</html>