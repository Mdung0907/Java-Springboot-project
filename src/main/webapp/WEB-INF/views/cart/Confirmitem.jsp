<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<script
	src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>
<body>
	<div class="modal fade" id="modalRegisterConfirm" tabindex="-1"
		aria-labelledby="myModalLabe" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">Confirm Item</h4>
				</div>
				<form:form class="modal-body mx-3" action="/confirm-item"
					method="post">
					<input type="hidden" name="id" value="${param.id}"/>
						<div class="modal-footer d-flex justify-content-center">
							<button class="btn btn-deep-orange" data-dismiss="modal">Cancel</button>
							<button class="btn btn-deep-orange" type="submit" style="color:red">Confirm</button>
						</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
<script>
	window.addEventListener("load", function() {
	let params = new URLSearchParams(window.location.search);
	var paramID = params.get("id");
	if (paramID != null) {
		$('#modalRegisterConfirm').modal('show');
	}
	})
	</script>
</html>

