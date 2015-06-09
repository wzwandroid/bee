<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<div class="row">
	<div class="col-md-12">
		<div class="widget wgreen">
			<div class="widget-content">
				<hr>
				<sf:form action="${pageContext.request.contextPath}/admin/merchant/front/permission/update" onsubmit="return validateForm(this,dialogAjaxDone)"
						 modelAttribute="merPermConf" role="form" method="post" cssClass="required-validate">
					<input type="hidden" name="id" value="${merPermConf.id}">
					<div class="form-horizontal">
						<div class="form-group">
							<label class="col-md-5 control-label" for="merMenuInfoId">请选择菜单：</label>
							<div class="col-md-7">
								<sf:select path="merMenuInfoId" id="merMenuInfoId"
									cssClass="form-control required">
									<sf:option value="">...</sf:option>
									<c:forEach var="merMenu" items="${allMenus}">
										<option value="${merMenu.id}"
											<c:if
                                        test="${merPermConf.merMenuInfoId eq merMenu.id}"> selected </c:if>>${merMenu.name}</option>
									</c:forEach>
								</sf:select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-5 control-label" for="permCode">权限代码：</label>
							<div class="col-md-7">
								<input name="permCode" type="text" id="permCode"
									class="form-control required" value="${merPermConf.permCode}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-5 control-label" for="permName">权限名称：</label>
							<div class="col-md-7">
								<input name="permName" type="text" id="permName"
									class="form-control required" value="${merPermConf.permName}"/>
							</div>
						</div>

					</div>
				</sf:form>
			</div>
		</div>
	</div>
</div>