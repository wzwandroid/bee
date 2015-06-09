<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-12">
		<!-- Table -->
		<div class="widget">
			<div class="widget-content">
				<form method="post" class="form-horizontal required-validate"
					role="form"
					action="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/addMerUserRole/${paramMerId}"
					onsubmit="return validateForm(this,dialogAjaxDone,null,null);">
					<input type="hidden" name="operUserId" value="${operUserId}">
				
					<div class="form-group">
						<label class="col-md-5 control-label">全选所有角色: </label>
						<div class="col-sm-7">
							<div class="checkbox">
								<label> 
								<input name="CheckedAll" type="checkbox" id="chAll" value="checkbox" style="cursor: pointer;">
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-5 control-label">授予角色: </label>
						<div class="col-md-7 ">
							<c:forEach items="${merRoleList}" var="merRole">
							<label class="checkbox-inline"> 
								<input type="checkbox" class="chkbox" name="merRoleCheck"
									value="${merRole.id}"
									<c:if test='${merRole.selected }'>checked</c:if>> ${merRole.roleName }
									</label>							
							</c:forEach>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#chAll").click(function() {
		if (($("#chAll").prop("checked"))) {
			$(".chkbox").prop("checked", true);
		} else {
			$(".chkbox").prop("checked", false);
		}
	});
</script>

