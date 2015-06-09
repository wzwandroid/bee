<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap"%>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn"%>
<div class="row">
	<div class="col-md-12">
		<div class="widget wgreen">
			<div class="widget-content">
				<hr>
				<sf:form modelAttribute="merPermConf" role="form" method="post">
					<div class="tab-content">
						<div class="form-horizontal">
							<div class="form-group">
								<label class="col-md-5 control-label" for="merMenuInfoId">请选择菜单：</label>
								<div class="col-md-7">
									<sf:select path="merMenuInfoId" id="merMenuInfoId" disabled="true"
									cssClass="form-control">
									<sf:option value="">...</sf:option>
									<c:forEach var="merMenu" items="${allMenus}">
										<option value="${merMenu.name}" 
											<c:if
                                        test="${merPermConf.merMenuInfoId eq merMenu.id}"> selected </c:if>>${merMenu.name}</option>
									</c:forEach>
								</sf:select>
								</div>
							</div>
								<div class="form-group">
								<label class="col-md-5 control-label" for="permCode">权限代码：</label>
								<div class="col-md-7">
									<sf:input id="permCode" path="permCode" type="text"
										cssClass="form-control" disabled="true" placeholder="" />
								</div>
							</div>
								<div class="form-group">
								<label class="col-md-5 control-label" for="permName">权限名称：</label>
								<div class="col-md-7">
									<sf:input id="permName" path="permName" type="text"
										cssClass="form-control" disabled="true" placeholder="" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-5 control-label" for="terType">终端版本：</label>
								<div class="col-md-7">
									<sf:input id="terType" path="terType" type="text" value="${webterType }"
										cssClass="form-control" disabled="true" placeholder="" />
								</div>
							</div>
						</div>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
</div>