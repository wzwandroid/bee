<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>
                <form action="${pageContext.request.contextPath}/admin/permission/update/${permissionConf.id}" onsubmit="return validateForm(this,dialogAjaxDone)"
                      role="form" method="post" class="required-validate">
                    <input type="hidden" name="id" value="${permissionConf.id}"/>
                    <!-- 权限基本信息 permissionConf-->
                    <div class="form-horizontal">

                        <%--<div class="form-group">--%>
                            <%--<label class="col-md-5 control-label"  ><font color="red"><em>必须存在二级菜单才能添加权限</em></font></label>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="parentMenu">一级菜单：</label>

                            <div class="col-md-7">
                                <select name="parentMenu" id="parentMenu" onchange="getSubMenus('parentMenu','subMenu')"
                                        class="form-control required">
                                    <option value="">......</option>
                                    <c:forEach var="parentMenu" items="${allParentMenus}">
                                        <option value="${parentMenu.id}" <c:if test="${parentMenu.id eq menuItemConf.parentId}">selected</c:if>>${parentMenu.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <c:if test="${not empty allSubMenus}">
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="subMenu">二级菜单：</label>

                                <div class="col-md-7">
                                    <select name="menuItemConfId" id="subMenu" class="form-control required">
                                        <option value="">......&nbsp;</option>
                                            <c:forEach var="menu" items="${allSubMenus}">
                                            <option value="${menu.id}" <c:if test="${menu.id eq menuItemConf.id}">selected</c:if> >${menu.name}</option>
                                            </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <label class="col-md-5 control-label" for="lvl">深度：</label>

                            <div class="col-md-7">
                                <input id="lvl" name="lvl" type="text" class="form-control required" value="${permissionConf.lvl}"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="code">权限代码：</label>
                            <div class="col-md-7">
                                <input id="code" name="code" type="text" class="form-control required"  value="${permissionConf.code}"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="name">权限名称：</label>
                            <div class="col-md-7">
                                <input id="name" name="name" type="text" class="form-control required"  value="${permissionConf.name}"
                                       placeholder=""/>
                            </div>
                        </div>

                    </div>


                </form>
            </div>
        </div>
    </div>
</div>
