<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<script
	src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>
<body>
	<div class="modal fade" id="modalRegisterForm" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">Create Product</h4>
				</div>
				<form:form class="modal-body mx-3" action="/product-create" method="post"
					enctype="multipart/form-data" modelAttribute="product">
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-name">Name</label>
						<form:input path="name" cssStyle="width: 80%; height: 25px" value=""/>
						
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Category</label>
						<form:select path="category" id="lang-select"
							style="width: 83%; height: 35px">
							<c:forEach var="item" items="${dm}">
								<option value="${item.id}">${item.getTendanhmuc() }</option>
							</c:forEach>
						</form:select>
					</div>
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-pass">Price</label>
						<form:input path="price" cssStyle="width: 80%; height: 25px" />
						
					</div>
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-pass">Quantity</label>
						<form:input path="quantity" cssStyle="width: 80%; height: 25px" />
						
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Description</label>
						<form:textarea class="form-control" id="motacreate"
							aria-describedby="emailHelp" path="description"
							placeholder="Description"></form:textarea>
							
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Image</label> 
						<input type="file"
							class="form-control" id="inputImage" aria-describedby="emailHelp"
							name="image" required /> 
							<img style="width: 150px" src=""id="imgload">
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
document.querySelector("#inputImage").addEventListener("change", function() {
	const file = this.files[0]
	if (file) {
		const reader = new FileReader();
		reader.onload = function() {
			const result = reader.result;
			document.querySelector("#imgload").src = result;
		}
		reader.readAsDataURL(file)
	}
	})
	</script>
<script>
                        ClassicEditor
                                .create( document.querySelector( '#motacreate' ) )
                                .then( testmota => {
                                	document.querySelector("#motacreate").value = testmota;
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                </script>
</html>

