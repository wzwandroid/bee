<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjFn" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="jkjTag" uri="http://admin.demo.com/permission/jkjTag" %>

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
        <a href="#" class="bread-current">权限管理</a>
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
                                <form action="${pageContext.request.contextPath}/function/test/perm/list" method="post" onsubmit="return listSearch(this,'tab');">

                                <label>
                                    <span>权限名：</span>
                                    <input type="text" name="permName" value="${params['permName']}">
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
                        <jkjTag:permission code="add" dependMenuUrl="/function/test/perm/list">
                            <%--menuurl 虽然能取到 但是如果点击搜索后（搜索为Ajax）就龋不到了--%>
                        <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/function/test/perm/add"
                                width="850" height="350" title="新增权限"><i class="icon-plus"></i> 新增</button>
                        </jkjTag:permission>

<jkjTag:permission code="update" dependMenuUrl="/function/test/perm/list">
                        <button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/function/test/perm/update/{sid_permId}"
                                width="850" height="350" title="修改权限" warn="请选择权限" rel=""><i class="icon-edit"></i> 修改</button>
                        </jkjTag:permission>
                        <jkjTag:permission code="show" dependMenuUrl="/function/test/perm/list">
                        <button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/function/test/perm/show/{sid_permId}"
                                width="850" height="350" title="查看权限" warn="请选择权限" formSubmit="false"><i class="icon-edit"></i> 详细查看</button>
                        </jkjTag:permission>
                        <jkjTag:permission code="delete">
                            <%--<button class="btn btn-danger" target="oneRecordDeleted" href="${pageContext.request.contextPath}/admin/permission/deleteIds?ids={sid_permissionId}"--%>
                                    <%--title="确定要删除？" warn="请选择要删除的应用"><i class="icon-remove"></i> 删除</button>--%>
                            <button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/function/test/perm/deleteIds"
                                    title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>
                        </jkjTag:permission>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div >
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr class="mz-table-thead">
                            <th class="center" style="width: 10px;">
                                <label>
                                    <input class="mz-chk" type="checkbox" >
                                    <span class="mz-lbl"></span>
                                </label>
                            </th>
                            <th  >#</th>
                            <th >权限名</th>
                            <th >权限代码</th>
                            <th >所属菜单</th>
                            <th  >状态</th>
                            <th  >创建时间</th>
                        </tr>
                        </thead>
                        <tbody class="mzGridTbody">
                        <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
                        <c:forEach items="${params['pager'].result}" var="permItem">
                            <c:set var="rowNum" value="${rowNum + 1}"/>
                            <tr target="sid_permId" rel="${permItem.id}">
                                <td class="center">
                                    <label>
                                        <input type="checkbox" class="mz-chk" value="${permItem.id}" name="ids">
                                        <span class="mz-lbl"></span>
                                    </label>
                                </td>
                                <td>${rowNum}</td>
                                <td>${permItem.permName}</td>
                                <td>${permItem.permCode}</td>
                                <td>${permItem.menuName}</td>
                                <td>${permItem.status}</td>
                                <td>
                                    <c:if test="${permItem.createTime != null}">
                                        ${jkjFn:swapDatePattern(permItem.createTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                                    </c:if>
                                </td>
                            </tr>
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
