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
        <a href="#" class="bread-current">角色管理</a>
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
                    <%--<div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion-searcha" href="#accordion-search-1">条件搜索</h4>
                        </div>
                        <div class="panel-collapse collapse in" id="accordion-search-1">
                            <div class="panel-body">

                            </div>
                        </div>
                    </div>--%>
                    <form action="${pageContext.request.contextPath}/admin/merchant/front/role/list" method="post" onsubmit="return listSearch(this,'tab');">
                        <input type="hidden" name="pageSize" value="${pager.pageSize}">
                    </form>
                </div>
                <div class="mz-toolbar">
                    <div class="btn-group">
                        <%--<jkjTag:permission code="add">--%>
                            <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/role/add"
                                    width="850" height="350" title="新增角色"><i class="icon-plus"></i> 新增</button>
                        <%--</jkjTag:permission>--%>
                        <%--<jkjTag:permission code="edit">--%>
                            <%--<button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/role/update/{sid_roleId}"--%>
                                    <%--width="850" height="350" title="修改角色" warn="请选择角色" rel=""><i class="icon-edit"></i> 修改</button>--%>
                        <%--</jkjTag:permission>--%>
                        <%--<jkjTag:permission code="show">--%>
                            <%--<button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/role/{sid_roleId}"--%>
                                    <%--width="750" height="450" title="查看角色" warn="请选择角色" formSubmit="false">--%>
                                <%--<i class="icon-edit"></i> 详细查看</button>--%>
                        <%--</jkjTag:permission>--%>
                        <%--<jkjTag:permission code="delete">--%>
                            <%--<button class="btn btn-danger" target="oneRecordDeleted" href="${pageContext.request.contextPath}/admin/merchant/front/role/deleteIds?ids={sid_roleId}"--%>
                                    <%--title="确定要删除？" warn="请选择要删除的应用"><i class="icon-remove"></i> 删除</button>--%>
                            <%--&lt;%&ndash;<button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/admin/merchant/front/role/deleteIds"&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>&ndash;%&gt;--%>
                        <%--</jkjTag:permission>--%>
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
                            <th >角色代码</th>
                            <th  >角色名称</th>
                            <th  >创建时间</th>
                            <th  >状态</th>
                            <th  >操作</th>
                        </tr>
                        </thead>
                        <tbody class="mzGridTbody">
                        <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
                        <c:forEach items="${params['pager'].result}" var="roleConf">
                            <c:set var="rowNum" value="${rowNum + 1}"/>
                            <tr target="sid_roleId" rel="${roleConf.id}">
                                <td class="center">
                                    <label>
                                            <%--通过商户基本信息表中的id来取得对应的值 而非商户编号--%>
                                        <input type="checkbox" class="mz-chk" value="${roleConf.id}" name="ids">
                                        <span class="mz-lbl"></span>
                                    </label>
                                </td>
                                <td>${rowNum}</td>
                                <td>${roleConf.roleCode}</td>
                                <td>${roleConf.roleName}</td>
                                <td>
                                    <c:if test="${roleConf.createTime != null}">
                                        ${jkjFn:swapDatePattern(roleConf.createTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${roleConf.status == enableStatus.id}">有效</c:if>
                                    <c:if test="${roleConf.status eq disabledStatus.id}">无效</c:if>
                                </td>
                                <td>
                                    <%--<jkjTag:permission code="grant">--%>
                                    <a class="btn btn-default" target="dialog" width="850" height="400" title="授权"
                                       href="${pageContext.request.contextPath}/admin/merchant/front/role/roleGrantHtml/${roleConf.id}">授权</a>
                                    <%--</jkjTag:permission>--%>
                                    <%--<jkjTag:permission code="grantView">--%>
                                    <a class="btn btn-default" target="dialog" width="850" height="400" title="查看已授予权限"
                                       href="${pageContext.request.contextPath}/admin/merchant/front/role/roleGrantView/${roleConf.id}" formSubmit="false">查看已授予权限</a>
                                    <%--</jkjTag:permission>--%>
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