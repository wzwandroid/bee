<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-12">
		<div class="widget wgreen">
			<div class="widget-content">
				<hr>
				<sf:form
					action="${pageContext.request.contextPath}/admin/merchant/front/permission/padAdd"  onsubmit="return validateForm(this,dialogAjaxDone,null,null)"
					modelAttribute="MerPermConfEntity" role="form" method="post"
					cssClass="required-validate">
					<div class="tab-content">
						<div class="form-horizontal">
							<div class="form-group">
								<label class="col-md-5 control-label" for="merMenuInfoId">请选择菜单：</label>
								<div class="col-md-7">
									<sf:select path="merMenuInfoId" id="merMenuInfoId" 
										cssClass="form-control required">
										<sf:option value="">...</sf:option>
										<c:forEach items="${allMenus}" var="allMenu">
											<option value="${allMenu.id}">${allMenu.name}</option>
										</c:forEach>
									</sf:select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-5 control-label" for="permCode">权限代码：</label>
								<div class="col-md-7">
									<sf:input path="permCode" id="permCode" cssClass="form-control required" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-5 control-label" for="permName">权限名称：</label>
								<div class="col-md-7">
									<sf:input path="permName" id="permName" cssClass="form-control required" />
								</div>
							</div>

						</div>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	
</script>