<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>

                <form action="${pageContext.request.contextPath}/function/test/menu/update/${menuEntity.id}" onsubmit="return validateForm(this,dialogAjaxDone)"
                      menu="form" method="post" class="required-validate">

                    <!-- 菜单基本信息 TUser-->
                    <div class="form-horizontal">

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="parentId">上级菜单：</label>
                                <div class="col-md-7">
                                    <select name="parentId" id="parentId" class="form-control required" >
                                        <option value="0">顶级菜单</option>
                                        <c:if test="${not empty allParentMenus}">
                                            <c:forEach var="parentMenu" items="${allParentMenus}">
                                                <option value="${parentMenu.id}">${parentMenu.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="name">菜单名称：</label>

                                <div class="col-md-7">
                                    <input id="name" name="name" type="text" class="form-control"  value="${menuEntity.name}"
                                           placeholder=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="href">请求地址：</label>
                            <div class="col-md-7">
                                <input id="href" name="href" type="text" class="form-control required"   value="${menuEntity.href}"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="sort">排序：</label>
                            <div class="col-md-7">
                                <input id="sort" name="sort" type="text" class="form-control"  value="${menuEntity.sort}"
                                       placeholder=""/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
