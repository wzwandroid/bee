<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-12">
		<!-- Table -->
		<div class="widget">
			<div class="widget-content">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-md-5 control-label">授予角色:</label>
						<div class="col-md-7">
							<c:forEach items="${merRoleList}" var="merRole">
								<label class="checkbox-inline"> <input type="checkbox" disabled <c:if test='${merRole.selected }'>checked</c:if>> ${merRole.roleName }
								</label>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>