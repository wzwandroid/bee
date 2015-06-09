<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjFn" uri="http:/api.demo.com/jstl/swap" %>
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
                            <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion-searcha" href="#accordion-search-1">
                                条件搜索&nbsp;
                            </h4>
                        </div>'
                        <div class="panel-collapse collapse in" id="accordion-search-1">
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/admin/system/list" method="post" onsubmit="return tabSearch(this,'.mainbar')">
                                    <label>
                                        <span>菜单名称：</span>
                                        <input type="text" name="name" value="${params['name']}">
                                    </label>
                                    <label>
                                        <span>菜单父类：</span>
                                        <input type="text" name="parentName" value="${params['parentName']}">
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
                        <%--<jkjTag:permission code="add">--%>
                        <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/admin/system/add"
                                width="850" height="350" title="新增菜单项目"><i class="icon-plus"></i> 新增</button>
                        <%--</jkjTag:permission>--%>
                        <%--<jkjTag:permission code="edit">--%>
                        <button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/admin/system/update/{sid_menuId}"
                                width="850" height="350" title="修改菜单项目" warn="请选择菜单" rel=""><i class="icon-edit"></i> 修改</button>
                        <%--</jkjTag:permission>--%>
                        <%--<jkjTag:permission code="show">--%>
                        <%--<button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/admin/system/{sid_menuId}"--%>
                                <%--width="850" height="350" title="查看菜单项目" warn="请选择菜单" formSubmit="false"><i class="icon-edit"></i> 详细查看</button>--%>
                        <%--</jkjTag:permission>--%>
                        <%--<jkjTag:permission code="deleteMore">--%>
                            <%--<button class="btn btn-danger" target="oneRecordDeleted" href="${pageContext.request.contextPath}/admin/system/deleteIds?ids={sid_menuId}"--%>
                                    <%--title="确定要删除？" warn="请选择要删除的应用"><i class="icon-remove"></i> 删除</button>--%>
                            <%--<button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/admin/system/deleteIds"--%>
                                    <%--title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>--%>
                        <%--</jkjTag:permission>--%>

                            <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/admin/system/testModalPager"
                                    width="850" height="350" title="前端菜单页面 随意"><i class="icon-plus"></i> 测试弹出框分页</button>
                        <%--此处的按钮可以通过 按钮 不在button中定义href等 自己调用自己的open--%>
                            <%--<button class="btn btn-primary" id="testButton"><i class="icon-plus"></i>测试button的自己调用</button>--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <%--<div class="tableScroller">--%>
                <div>
                    <table class="table table-striped table-bordered table-hover" >
                        <thead>
                        <tr class="mz-table-thead">
                            <th class="center" style="width: 20px;">
                                <label>
                                    <input class="mz-chk" type="checkbox">
                                    <span class="mz-lbl"></span>
                                </label>
                            </th>
                            <th  style="width: 20px;">#</th>
                            <th  style="width:220px;">菜单名称</th>
                            <th  style="width:220px;">请求地址</th>
                            <th  style="width:220px;">菜单父类</th>
                            <th  style="width:80px;">折叠</th>
                            <th  style="width:120px;">图标</th>
                            <th  style="width:200px;">创建时间</th>
                            <th  >操作</th>

                        </tr>
                        </thead>
                        <tbody class="mzGridTbody">
                        <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
                        <c:forEach items="${params['pager'].result}" var="menuItem">
                            <c:set var="rowNum" value="${rowNum + 1}"/>
                            <tr target="sid_menuId" rel="${menuItem.id}">
                                <td class="center">
                                    <label>
                                            <%--通过商户基本信息表中的id来取得对应的值 而非商户编号--%>
                                        <input type="checkbox" class="mz-chk" value="${menuItem.id}" name="ids">
                                        <span class="mz-lbl"></span>
                                    </label>
                                </td>
                                <td>${rowNum}</td>
                                <td>${menuItem.name}</td>
                                <td>${menuItem.href}</td>
                                <td>
                                        ${menuItem.parentName}
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${menuItem.collapse == 0}">展开</c:when>
                                        <c:when test="${menuItem.collapse == 1}">折叠</c:when>
                                    </c:choose>

                                </td>
                                <td>${menuItem.iconClassName}</td>
                                <td>
                                    <c:if test="${menuItem.createTime != null}">
                                        ${jkjFn:swapDatePattern(menuItem.createTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${not empty menuItem.href}">
                                        <%--<jkjTag:permission code="rowview-operate">--%>
                                        <a href="${pageContext.request.contextPath}/admin/system/showPermission/${menuItem.id}" target="dialog"
                                           title="菜单包含的权限查看" class="btn btn-sm btn-default" width="850" height="350">
                                            <i class="icon-edit"></i>查看操作权限 </a>
                                        <%--</jkjTag:permission>--%>
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

<script>
    function showModalAttr(targetId,modalAttrId,showValue){

        var target = $("#"+targetId).val();
        if(target == showValue){
            $("#"+modalAttrId).attr("style","");
        }else{
            $("#"+modalAttrId).attr("style","display:none");
        }
    }


    function showHref(parentId,herfId,notShowValue){
        var parentId = $("#"+parentId).val();
        if(parentId != notShowValue){
            $("#"+herfId).attr("style","");
        }else{
            $("#"+herfId).attr("style","display:none");
        }
    }
</script>