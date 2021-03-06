<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>

                <form action="${pageContext.request.contextPath}/function/test/perm/update/${permEntity.id}" onsubmit="return validateForm(this,dialogAjaxDone)"
                      perm="form" method="post" class="required-validate">

                    <!-- 权限基本信息 TUser-->
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="menuId">请选择菜单：</label>
                            <div class="col-md-7">
                                <select name="menuId" id="menuId"
                                           cssClass="form-control required">
                                    <option value="">...</option>
                                    <c:forEach var="menuItem" items="${allMenus}">
                                        <option value="${menuItem.id}"
                                                <c:if
                                                        test="${permEntity.menuId eq menuItem.id}"> selected </c:if>>${menuItem.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="permName">权限名：</label>

                            <div class="col-md-7">
                                <input id="permName" name="permName" type="text" class="form-control" value="${permEntity.permName}"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="permCode">权限代码：</label>
                            <div class="col-md-7">
                                <input id="permCode" name="permCode" type="text" class="form-control required" value="${permEntity.permCode}"
                                       placeholder=""/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
