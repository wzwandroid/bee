<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
<div class="col-md-12">
    <div class="widget wgreen">
        <div class="widget-content">
<hr>

            <form action="${pageContext.request.contextPath}/admin/permission/add" onsubmit="return validateForm(this,dialogAjaxDone)"
                      role="form" method="post" class="required-validate">

                    <!-- 商户基本信息 merInfo-->
                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-md-5 control-label" for="parentMenu">一级菜单：</label>

                                <div class="col-md-7">
                                    <select name="parentMenu" id="parentMenu" onchange="getSubMenus('parentMenu','subMenu')"
                                               class="form-control required">
                                        <option value="">......</option>
                                        <c:forEach var="parentMenu" items="${allParentMenus}">
                                            <option value="${parentMenu.id}">${parentMenu.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div  id="subMenuDiv">
                                    <label class="col-md-5 control-label" for="subMenu">二级菜单：</label>

                                    <div class="col-md-7">
                                        <select name="menuItemConfId" id="subMenu" class="form-control required">
                                            <option value="">......&nbsp;</option>
                                            <%--<c:forEach var="city" items="${cities}">--%>
                                            <%--<option value="${city.paramName}">${city.paramValue}</option>--%>
                                            <%--</c:forEach>--%>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="lvl">深度：</label>

                                <div class="col-md-7">
                                    <input id="lvl" name="lvl" type="text" class="form-control"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="code">权限代码：</label>
                                <div class="col-md-7">
                                    <input id="code" name="code" type="text" class="form-control required"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="name">权限名称：</label>
                                <div class="col-md-7">
                                    <input id="name" name="name" type="text" class="form-control required"
                                           placeholder=""/>
                                </div>
                            </div>

                        </div>


            </form>
        </div>
    </div>
</div>
</div>
