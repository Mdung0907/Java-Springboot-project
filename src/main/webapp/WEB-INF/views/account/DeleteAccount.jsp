<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<script
	src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>
<body>
	<div class="modal fade" id="modalRegisterFormdelete" tabindex="-1"
		aria-labelledby="myModalLabe" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">Delete Account</h4>
				</div>
				<form:form class="modal-body mx-3" action="/account-delete"
					method="post">
					<input type="hidden" name="iddelete" value="${param.iddelete}"/>
						<div class="modal-footer d-flex justify-content-center">
							<button class="btn btn-deep-orange" data-dismiss="modal">Cancel</button>
							<button class="btn btn-deep-orange" type="submit" style="color:red">Delete</button>
						</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
<script>
	window.addEventListener("load", function() {
	let params = new URLSearchParams(window.location.search);
	var paramID = params.get("iddelete");
	if (paramID != null) {
		$('#modalRegisterFormdelete').modal('show');
	}
	})
	</script>
</html>

