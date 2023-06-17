<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<script
	src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>
<body>
	<div class="modal fade" id="modalRegisterFormupdate" tabindex="-1"
		aria-labelledby="myModalLabe" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">Update Product</h4>
				</div>
				<form:form class="modal-body mx-3" action="/product-update"
					method="post" enctype="multipart/form-data" modelAttribute="product">
						<c:set var="it" value="${test }"></c:set>
						<div class="form-group">
							<label data-error="wrong" data-success="right"
								for="orangeForm-name">Name</label>
							<form:input path="name" cssStyle="width: 80%; height: 25px" value="${it.get().name}"/>
							<form:hidden path="id"/>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Category</label>
							<form:select path="category" id="lang-select"
								style="width: 83%; height: 35px">
								<c:forEach var="item" items="${dm}">
									<option value="${item.id}" selected="selected">${item.tendanhmuc }</option>
								</c:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label data-error="wrong" data-success="right"
								for="orangeForm-pass">Price</label>
							<form:input path="price" cssStyle="width: 80%; height: 25px" value="${it.get().price}"/>
						</div>
						<div class="form-group">
							<label data-error="wrong" data-success="right"
								for="orangeForm-pass">Quantity</label>
							<form:input path="quantity" cssStyle="width: 80%; height: 25px" value="${it.get().quantity}"/>
						</div>
						<div class="form-group">
							<label data-error="wrong" data-success="right"
								for="orangeForm-pass">Status</label>
							<form:select path="status" id="lang-select"
								style="width: 83%; height: 35px">
								<option value="true">True</option>
								<option value="false">False</option>
							</form:select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Description</label>
							<form:textarea class="form-control" id="mota"
								aria-describedby="emailHelp" path="description"
								placeholder="Description" value="${it.get().description}"></form:textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Image</label> <input type="file"
								class="form-control" id="inputImageup"
								aria-describedby="emailHelp" name="image" value="${it.get().image}" /> <img
								style="width: 150px" src="/images/${it.get().image }/${it.get().image }" id="imgloadup">
						</div>
						<div class="modal-footer d-flex justify-content-center">
							<button class="btn btn-deep-orange" data-dismiss="modal">Cancel</button>
							<button class="btn btn-deep-orange" type="submit">Save</button>
						</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
<script>
document.querySelector("#inputImageup").addEventListener("change", function() {
	const file = this.files[0]
	if (file) {
		const reader = new FileReader();
		reader.onload = function() {
			const result = reader.result;
			document.querySelector("#imgloadup").src = result;
		}
		reader.readAsDataURL(file)
	}
	})
	
	window.addEventListener("load", function() {
	let params = new URLSearchParams(window.location.search);
	var paramID = params.get("id");
	if (paramID != null) {
		$('#modalRegisterFormupdate').modal('show');
	}
	})
	
	ClassicEditor.create( document.querySelector( '#mota' )).then( testmota => {
         document.querySelector("#mota").value = testmota;} ).catch( error => 
         {
               console.error( error );
                                } );
	</script>
</html>

