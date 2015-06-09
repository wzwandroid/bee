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
        <a href="#" class="">功能测试</a>
        <span class="divider">/</span>
        <a href="#" class="bread-current">下载文件管理</a>
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
                        <span>文件名称：</span>
                        <input type="text" name="name" value="${params['name']}">
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


                <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/function/test/download/add"
                width="850" height="350" title="新增"><i class="icon-plus"></i> 新增</button>

                    <button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/function/test/download/deleteIds"
                    title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>

                </div>
                <div class="clearfix"></div>
                </div>
                <div class="tableScroller">
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
                            <th  style="width:220px;">原始文件名</th>
                            <th  style="width:220px;">新文件名</th>
                            <th  style="width:220px;">文件类型</th>
                            <th  style="width:220px;">文件大小</th>
                            <th  style="width:220px;">下载次数</th>
                            <th  style="width:220px;">预览次数</th>
                            <th  style="width:220px;">操作</th>

                        </tr>
                        </thead>
                        <tbody class="mzGridTbody">
                        <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
                        <c:forEach items="${params['pager'].result}" var="fileItem">
                            <c:set var="rowNum" value="${rowNum + 1}"/>
                            <tr target="sid_fileId" rel="${fileItem.id}">
                                <td class="center">
                                    <label>
                                            <%--通过商户基本信息表中的id来取得对应的值 而非商户编号--%>
                                        <input type="checkbox" class="mz-chk" value="${fileItem.id}" name="ids">
                                        <span class="mz-lbl"></span>
                                    </label>
                                </td>
                                <td>${rowNum}</td>
                                <td>${fileItem.oldName}</td>
                                <td>${fileItem.newName}</td>
                                <td>${fileItem.suffix}</td>
                                <td>${fileItem.fileSize}</td>
                                <td>${fileItem.dlnCnt}</td>
                                <td>${fileItem.viewCnt}</td>



                                <td>
                                    <a target="_blank" href="${pageContext.request.contextPath}/function/test/download/confirm?fileId=${fileItem.id}">[ 下载 ]</a>

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