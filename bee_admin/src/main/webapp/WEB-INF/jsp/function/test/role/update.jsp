<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>

                <form action="${pageContext.request.contextPath}/function/test/role/update/${roleEntity.id}" onsubmit="return validateForm(this,dialogAjaxDone)"
                      role="form" method="post" class="required-validate">

                    <!-- 角色基本信息 TUser-->
                    <div class="form-horizontal">

                        <div class="form-group">
                            <label class="col-md-5 control-label" for="roleName">角色名：</label>

                            <div class="col-md-7">
                                <input id="roleName" name="roleName" type="text" class="form-control" value="${roleEntity.roleName}"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="roleCode">角色代码：</label>
                            <div class="col-md-7">
                                <input id="roleCode" name="roleCode" type="text" class="form-control required" value="${roleEntity.roleCode}"
                                       placeholder=""/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
