<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">

                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#rpaCollapse" data-toggle="collapse">
                                    <strong>${userEntity.userName}</strong>授予角色操作
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <form action="${pageContext.request.contextPath}/function/test/user/grantRole/add/${userEntity.id}"
                                          onsubmit="return validateCheckBoxForm(this,dialogAjaxDone,null,null,'userRoles','请选择角色')"
                                          role="form" method="post" class="required-validate">
                                        <ul class="pathItem-con clearfix">

                                            <c:forEach var="tRole" items="${allRoles}">
                                                <li class="pathItem">
                                                    <label class="checkbox">
                                                        <input type="checkbox" name="userRoles" value="${tRole.id}"
                                                               <c:if test="${tRole.selected == true}">checked</c:if>
                                                                />&nbsp;${tRole.roleName}
                                                    </label>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
