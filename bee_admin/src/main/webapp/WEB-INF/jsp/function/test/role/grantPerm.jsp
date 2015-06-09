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
                                    <strong>${roleEntity.roleName}</strong>授予权限操作
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <form action="${pageContext.request.contextPath}/function/test/role/roleGrant/add/${roleEntity.id}"
                                          onsubmit="return validateCheckBoxForm(this,dialogAjaxDone,null,null,'rolePerms','请选择权限')"
                                          role="form" method="post" class="required-validate">
                                        <ul class="pathItem-con clearfix">

                                            <c:forEach var="merPerm" items="${allPerms}">
                                                <li class="pathItem">
                                                    <label class="checkbox">
                                                        <input type="checkbox" name="rolePerms" value="${merPerm.id}"
                                                               <c:if test="${merPerm.selected == true}">checked</c:if>
                                                                />&nbsp;${merPerm.permName}
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
