<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjFn" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="jkjTag" uri="http://admin.demo.com/permission/jkjTag" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bs3-treegrid/css/jquery.treegrid.css">

<!-- Page heading -->
<div class="page-head">
    <!-- Breadcrumb -->
    <div class="bread-crumb pull-left mz-breadcrumb">
        <i class="icon-home mz-home-icon"></i>
        <a href="index.html">首页</a>
        <!-- Divider -->
        <span class="divider">/</span>
        <a href="#" class="">功能测试</a>
        <span class="divider">/</span>
        <a href="#" class="bread-current">菜单管理</a>
    </div>
    <div class="clearfix"></div>
</div>
<!-- Page heading ends -->
<!-- Matter -->
<div class="matter">
    <div class="container">
        <!-- Table -->
        <div class="widget">
            <div class="widget-content">
                <div class="panel-group mz-pager-search" id="accordion-search">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion-searcha" href="#accordion-search-1">条件搜索</h4>
                        </div>
                        <div class="panel-collapse collapse in" id="accordion-search-1">
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/function/test/menu/list" method="post" onsubmit="return listSearch(this,'tab');">

                                    <label>
                                        <span>一级菜单：</span>
                                        <select name="parentId">
                                            <option value="">==请选择==</option>
                                            <c:forEach items="${menuItems}" var="menu">
                                                <option value="${menu.id}" <c:if test="${menu.id eq parentId}">selected="selected"</c:if>>${menu.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>

                                    <div class="buttonActive">

                                        <button type="submit" class="btn btn-default">搜索</button>
                                    </div>
                                    <%--<input type="hidden" name="pageSize" value="${pager.pageSize}">--%>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="mz-toolbar">
                    <div class="btn-group">
                        <jkjTag:permission code="add" dependMenuUrl="/function/test/menu/list">                        <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/function/test/menu/add"
                                width="850" height="350" title="新增菜单"><i class="icon-plus"></i> 新增</button>
                        </jkjTag:permission>
                        <jkjTag:permission code="update" dependMenuUrl="/function/test/menu/list">
                        <button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/function/test/menu/update/{sid_menuId}"
                                width="850" height="350" title="修改菜单" warn="请选择菜单" rel=""><i class="icon-edit"></i> 修改</button>
                        </jkjTag:permission>
                        <jkjTag:permission code="show" dependMenuUrl="/function/test/menu/list">
                        <button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/function/test/menu/show/{sid_menuId}"
                                width="850" height="350" title="查看菜单" warn="请选择菜单" formSubmit="false"><i class="icon-edit"></i> 详细查看</button>
                        </jkjTag:permission>
                        <jkjTag:permission code="delete" dependMenuUrl="/function/test/menu/list">
                            <%--<button class="btn btn-danger" target="oneRecordDeleted" href="${pageContext.request.contextPath}/admin/permission/deleteIds?ids={sid_permissionId}"--%>
                                    <%--title="确定要删除？" warn="请选择要删除的应用"><i class="icon-remove"></i> 删除</button>--%>
                            <button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/function/test/menu/deleteIds"
                                    title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>
                        </jkjTag:permission>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div >
                    <table class="table table-striped table-bordered table-hover treegrid">
                        <thead>
                        <tr class="mz-table-thead">
                            <%--<th class="center" style="width: 10px;">--%>
                                <%--<label>--%>
                                    <%--<input class="mz-chk" type="checkbox" >--%>
                                    <%--<span class="mz-lbl"></span>--%>
                                <%--</label>--%>
                            <%--</th>--%>
                            <th style="width: 200px;">菜单名称</th>
                            <th style="width: 250px;">请求地址</th>
                            <th style="width: 200px;">菜单父类</th>

                            <th style="width: 80px">菜单序号</th>
                            <th >操&nbsp;&nbsp;作</th>
                        </tr>
                        </thead>
                        <tbody class="mzGridTbody">
                        <c:set value="1" var="parentIndex"/>
                        <c:forEach items="${list}" var="map">
                            <c:set value="${map['parent']}" var="menu"/>
                            <tr target="sid_menuId" rel="${menu.id}" class="treegrid-${parentIndex}">
                                <td>${menu.name}</td>
                                <td>${menu.href}</td>
                                <td>${menu.parentName}</td>


                                <td>${menu.sort}</td>
                                <td>&nbsp;</td>
                            </tr>
                            <c:forEach items="${map['children']}" var="subMenu" varStatus="status">
                                <tr target="sid_menuId" rel="${subMenu.id}" class="treegrid-${parentIndex+status.index+1} treegrid-parent-${parentIndex}">
                                    <td>${subMenu.name}</td>
                                    <td>${subMenu.href}</td>
                                    <td>${subMenu.parentName}</td>
                                    <td>${subMenu.sort}</td>
                                    <td>
                                        <div class="btn-group">
                                                <%--<jkjTag:permission code="rowview-operate">--%>
                                            <c:if test="${menu.id ne 0}">
                                                <a href="${pageContext.request.contextPath}/function/test/menu/showPermission/${subMenu.id}"
                                                   target="dialog" class="btn btn-sm btn-default" width="700" height="400"
                                                   title="菜单包含的权限查看" formSubmit="false"><i class="icon-edit"></i>查看操作权限 </a>
                                            </c:if>
                                                <%--</jkjTag:permission>--%>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:set value="${parentIndex+map['children'].size()+1}" var="parentIndex"/>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>

                    <div class="widget-foot">
                        <div class="mz-pages" totalCount="${params['pager'].totalCount}"  pageSize="${params['pager'].pageSize}" pageNo="${params['pager'].pageNo}" pageNumShown="10"></div>
                    </div>
            </div>
        </div>
    </div>
</div>
<!-- Matter ends -->
<script src="${pageContext.request.contextPath}/resources/bs3-treegrid/js/jquery.treegrid.js"></script>
<script>
    $(function () {
        $('.treegrid').treegrid();
    });
</script>
