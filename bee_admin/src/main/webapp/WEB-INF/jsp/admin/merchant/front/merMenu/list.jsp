<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="jkjTag" uri="http://jiankangjin.com/jstl/jkjFn" %>--%>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bs3-treegrid/css/jquery.treegrid.css">
<!-- Page heading -->
<div class="page-head">
    <!-- Breadcrumb -->
    <div class="bread-crumb pull-left mz-breadcrumb">
        <i class="icon-home mz-home-icon"></i>
        <a href="index.html">首页</a>
        <!-- Divider -->
        <span class="divider">/</span>
        <a href="#" class="">系统管理</a>
        <span class="divider">/</span>
        <a href="#" class="bread-current">商户菜单管理</a>
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
                    <form action="${pageContext.request.contextPath}/admin/merchant/front/menu/list"
                          onsubmit="return listSearch(this,'tab')">
                        <label>
                            <span>菜单类型：</span>
                            <select name="type">
                                <option value="">请选择菜单类型</option>
                                <c:forEach items="${menuTypes}" var="mt">
                                    <option value="${mt.key}" <c:if test="${mt.key eq params.type}">selected="selected" </c:if>>${mt.value}</option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>
                            <label>菜单名称：</label>
                            <input type="text" name="name" value="${params.name}">
                        </label>
                        <label>
                            <span>终端类型：</span>
                            <select name="terType" onchange="changeTerType(this)">
                                <option value="">请选择菜终端类型</option>
                                <c:forEach items="${terTypes}" var="terType" >
                                    <option value="${terType.id}" <c:if test="${terType.id eq params.terType}">selected="selected" </c:if>>${terType.paramValue}</option>
                                </c:forEach>
                            </select>
                        </label>
                        <div class="buttonActive">
                            <button type="submit" class="btn btn-default">搜索</button>
                        </div>
                        <input type="hidden" name="pageSize" value="${pager.pageSize}">
                    </form>
                </div>
            </div>
        </div>
    </div>
        <div class="mz-toolbar">
            <div class="btn-group">
                <%--<jkjTag:permission code="add" dependMenuUrl="/admin/merchant/front/menu/listInit">--%>
                    <button id="webAdd" class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/menu/add"
                            width="750" height="450" title="新增商户菜单web版"><i class="icon-plus"></i> 新增商户菜单web版</button>
                <%--</jkjTag:permission>--%>
                <%--<jkjTag:permission code="addPad" dependMenuUrl="/admin/merchant/front/menu/listInit">--%>
                    <%--<button style="display: none" id="padAdd" class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/menu/addPad"--%>
                            <%--width="750" height="450" title="新增商户菜单pad版"><i class="icon-plus"></i> 新增商户菜单pad版</button>--%>
                <%--</jkjTag:permission>--%>
                <%--<jkjTag:permission code="edit" dependMenuUrl="/admin/merchant/front/menu/listInit">--%>
                    <%--<button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/menu/update/{sid_id}"--%>
                            <%--width="750" height="450" title="修改商户菜单" warn="请选择要修改菜单"><i class="icon-edit"></i> 修改商户菜单</button>--%>
                <%--</jkjTag:permission>--%>
                <%--<jkjTag:permission code="show" dependMenuUrl="/admin/merchant/front/menu/listInit">--%>
                    <%--<button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/menu/show/{sid_id}"--%>
                            <%--width="750" height="450" title="查看商户菜单信息" warn="请选择要查看菜单" formSubmit="false"><i class="icon-edit"></i> 查看商户菜单信息</button>--%>
                <%--</jkjTag:permission>--%>
                <%--&lt;%&ndash;<jkjTag:permission code="deleteMore">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<button class="btn btn-danger" target="oneRecordDeleted" href="${pageContext.request.contextPath}/system/local/menu/deleteIds?ids={sid_id}"&ndash;%&gt;--%>
                            <%--&lt;%&ndash;title="确定要删除" warn="请选择要删除的菜单项"><i class="icon-remove"></i> 删除</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</jkjTag:permission>&ndash;%&gt;--%>
                    <%--<jkjTag:permission code="delete" dependMenuUrl="/admin/merchant/front/menu/listInit">--%>
                    <%--<button class="btn btn-danger" target="oneRecordDeleted" href="${pageContext.request.contextPath}/admin/merchant/front/menu/deleteIds?ids={sid_id}"--%>
                            <%--title="确定要删除？" warn="请选择要删除的应用"><i class="icon-remove"></i> 删除</button>--%>
                    <%--&lt;%&ndash;<button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/admin/merchant/front/menu/deleteIds"&ndash;%&gt;--%>
                            <%--&lt;%&ndash;title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>&ndash;%&gt;--%>
                        <%--</jkjTag:permission>--%>


            </div>
            <div class="clearfix"></div>
        </div>

        <div>
            <table class="table table-striped table-bordered table-hover treegrid">
                <thead>
                    <tr class="mz-table-thead">
                        <th style="width: 200px;">菜单名称</th>
                        <th style="width: 250px;">请求地址</th>
                        <th style="width: 250px;">菜单类型</th>
                        <th style="width: 200px;">菜单父类</th>
                        <th style="width: 50px;">图标</th>
                        <th style="width: 80px">菜单序号</th>
                        <th >操&nbsp;&nbsp;作</th>
                    </tr>
                </thead>
                <tbody class="mzGridTbody">
                <c:set value="0" var="parentIndex"/>
                <c:forEach var="oneMenu" items="${list}" varStatus="">
                    <c:if test="${oneMenu.lvl eq lvlOne.id}">
                        <c:set value="${parentIndex+1}" var="parentIndex"/>
                        <c:set value="${parentIndex}" var="oneIndex"/>
                        <tr target="sid_id" rel="${oneMenu.id}" class="treegrid-${parentIndex}">
                            <td>${oneMenu.name}</td>
                            <td>${oneMenu.href}</td>
                            <td>
                                <c:forEach items="${menuTypes}" var="mt">
                                    <c:if test="${oneMenu.type eq mt.key}">${mt.value}</c:if>
                                </c:forEach>
                            </td>
                            <td>${oneMenu.parentName}</td>
                            <td>${oneMenu.iconClassName}</td>
                            <td>${oneMenu.sort}</td>
                            <td>
                                <c:if test="${not empty oneMenu.href}">
                                    <a href="${pageContext.request.contextPath}/admin/merchant/front/menu/showPermission/${oneMenu.id}"
                                            class="btn btn-default" target="dialog" target="dialog" width="800" height="450" formSubmit="false"
                                            title="查看菜单权限">查看菜单权限</a>
                                </c:if>
                            </td>
                        </tr>
                        <c:forEach items="${list}" var="secondMenu">
                            <c:if test="${secondMenu.lvl eq lvlSecond.id and secondMenu.pId eq oneMenu.id}">
                                <c:set value="${parentIndex+1}" var="parentIndex"/>
                                <c:set value="${parentIndex}" var="secondIndex"/>
                                <tr target="sid_id" rel="${secondMenu.id}" class="treegrid-${parentIndex} treegrid-parent-${oneIndex}">
                                    <td>${secondMenu.name}</td>
                                    <td>${secondMenu.href}</td>
                                    <td>
                                        <c:forEach items="${menuTypes}" var="mt">
                                            <c:if test="${secondMenu.type eq mt.key}">${mt.value}</c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${secondMenu.parentName}</td>
                                    <td>${secondMenu.iconClassName}</td>
                                    <td>${secondMenu.sort}</td>
                                    <td>
                                        <c:if test="${not empty secondMenu.href}">
                                            <a href="${pageContext.request.contextPath}/admin/merchant/front/menu/showPermission/${secondMenu.id}"
                                               class="btn btn-default" target="dialog" target="dialog" width="800" height="450" formSubmit="false"
                                               title="查看菜单权限">查看菜单权限</a>
                                        </c:if>
                                    </td>
                                </tr>
                                <c:forEach items="${list}" var="thirdMenu">
                                    <c:if test="${thirdMenu.pId eq secondMenu.id and thirdMenu.lvl eq lvlThird.id}">
                                        <c:set value="${parentIndex+1}" var="parentIndex"/>
                                        <tr target="sid_id" rel="${thirdMenu.id}" class="treegrid-${parentIndex} treegrid-parent-${secondIndex}">
                                            <td>${thirdMenu.name}</td>
                                            <td>${thirdMenu.href}</td>
                                            <td>
                                                <c:forEach items="${menuTypes}" var="mt">
                                                <c:if test="${thirdMenu.type eq mt.key}">${mt.value}</c:if>
                                                </c:forEach></td>
                                            <td>${thirdMenu.parentName}</td>
                                            <td>${thirdMenu.iconClassName}</td>
                                            <td>${thirdMenu.sort}</td>
                                            <td>
                                                <c:if test="${not empty thirdMenu.href}">
                                                    <button href="${pageContext.request.contextPath}/admin/merchant/front/menu/showPermission/${thirdMenu.id}"
                                                       class="btn btn-default" target="dialog" width="800" height="450" formSubmit="false"
                                                       title="查看菜单权限">查看菜单权限</button>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
                <%--<%--<c:forEach items="${list}" var="map">--%>
                    <%--<c:set value="${map['parent']}" var="menu"/>--%>
                    <%--<tr target="sid_id" rel="${menu.id}" class="treegrid-${parentIndex}">--%>
                        <%--<td>${menu.name}</td>--%>
                        <%--<td>${menu.href}</td>--%>
                        <%--<td>${menu.parentName}</td>--%>
                        <%--<td>--%>
                            <%--<c:if test="${menu.collapse eq collapse.id}">${collapse.paramValue}</c:if>--%>
                            <%--<c:if test="${menu.collapse eq expand.id}">${expand.paramValue}</c:if>--%>
                        <%--</td>--%>
                        <%--<td>${menu.iconClassName}</td>--%>
                        <%--<td>${menu.sort}</td>--%>
                        <%--<td>&nbsp;</td>--%>
                    <%--</tr>--%>
                    <%--<c:forEach items="${map['children']}" var="subMenu" varStatus="status">--%>
                        <%--<tr target="sid_id" rel="${subMenu.id}" class="treegrid-${parentIndex+status.index+1} treegrid-parent-${parentIndex}">--%>
                            <%--<td>${subMenu.name}</td>--%>
                            <%--<td>${subMenu.href}</td>--%>
                            <%--<td>${subMenu.parentName}</td>--%>
                            <%--<td>--%>
                                <%--<c:if test="${subMenu.collapse eq collapse.id}">${collapse.paramValue}</c:if>--%>
                                <%--<c:if test="${subMenu.collapse eq expand.id}">${expand.paramValue}</c:if>--%>
                            <%--</td>--%>
                            <%--<td>${subMenu.iconClassName}</td>--%>
                            <%--<td>${subMenu.sort}</td>--%>
                            <%--<td>--%>
                                <%--<div class="btn-group">--%>
                                    <%--<%--<jkjTag:permission code="rowview-operate">--%>
                                        <%--<c:if test="${menu.id ne 0}">--%>
                                            <%--<a href="${pageContext.request.contextPath}/system/local/menu/showPermission/${subMenu.id}"--%>
                                               <%--target="dialog" class="btn btn-sm btn-default" width="700" height="400"--%>
                                               <%--title="菜单包含的权限查看" formSubmit="false"><i class="icon-edit"></i>查看操作权限 </a>--%>
                                        <%--</c:if>--%>
                                    <%--<%--</jkjTag:permission>--%>
                                <%--</div>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                    <%--<c:set value="${parentIndex+map['children'].size()+1}" var="parentIndex"/>--%>
                <%--</c:forEach>--%>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
<!-- Matter ends -->
<script src="${pageContext.request.contextPath}/resources/bs3-treegrid/js/jquery.treegrid.js"></script>
    <script type="text/javascript">
            function changeTerType(terType){
                if(terType != ""){
                    if   (terType.value==${padVersion.id})   {
                        $("#webAdd").hide();
                        $("#padAdd").show();
                    }else{
                        $("#padAdd").hide();
                        $("#webAdd").show();
                    }
                }
            }
    $(function () {
        $('.treegrid').treegrid();
    });
</script>