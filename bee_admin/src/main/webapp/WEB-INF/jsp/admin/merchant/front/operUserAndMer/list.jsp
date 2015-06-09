<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<!-- Page heading -->
<div class="page-head">
    <!-- Breadcrumb -->
    <div class="bread-crumb pull-left mz-breadcrumb">
        <i class="icon-home mz-home-icon"></i>
        <a href="index.html">首页</a>
        <!-- Divider -->
        <span class="divider">/</span>
        <a href="#" class="">商户门户管理</a>
        <span class="divider">/</span>
        <a href="#" class="bread-current">操作员和商户管理</a>
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
                        <form action="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/list" method="post" onsubmit="return tabSearch(this,'.mainbar')">
                            <label>
                                <span>商户名称：</span>
                                <select name="merId" id="merOperUserConfMerId">
                                    <option value="">==请选择商户名称==</option>
                                    <c:forEach items="${merchantList}" var="merchant">
                                        <option value="${merchant.merId}" <c:if test="${params['merId'] eq merchant.merId}">selected="selected"</c:if> >${merchant.merName}</option>
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
                <jkjTag:permission code="add">
                    <button id="mer-oper-user-conf-add" class="btn btn-primary" href="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/addUsers"
                            width="850" height="350" title="添加新操作员" warn="请选择商户"><i class="icon-plus"></i> 添加新操作员</button>
                  </jkjTag:permission>
                <jkjTag:permission code="delete">
                    <button class="btn btn-danger" target="moreRecoredDeleted" rel="ids"
                            href="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/deleteUsers?merId=${params['merId']}"
                            title="从删除中删除操作员" warn="请选择要删除操作员"><i class="icon-edit"></i> 从删除中删除操作员</button>
                </jkjTag:permission>
    </div>
            <div class="clearfix"></div>
        </div>
        <div class="tableScroller">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr class="mz-table-thead">
                    <th class="center">
                        <label>
                            <input class="mz-chk" type="checkbox">
                            <span class="mz-lbl"></span>
                        </label>
                    </th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>身份证号码</th>
                    <th>手机号码</th>
                    <th>健康金用户标识</th>
                    <th>默认商户号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="mzGridTbody">
                <c:if test="${params.pager.totalCount gt 0}">
                    <c:set var="rowNum" value="${(params.pager.pageNo - 1) * params.pager.pageSize}" />
                    <c:forEach items="${params.pager.result}" var="operUser">
                        <c:set var="rowNum" value="${rowNum + 1}"/>
                        <tr target="sid_operUserInfoId" rel="${operUser.id}">
                            <td class="center">
                                <label>
                                        <%--通过商户基本信息表中的id来取得对应的值 而非商户编号--%>
                                    <input name="ids" type="checkbox" class="mz-chk" value="${operUser.id}">
                                    <span class="mz-lbl"></span>
                                </label>
                            </td>
                            <td>${rowNum}</td>
                            <td>${operUser.name}</td>
                            <td>${operUser.idCard}</td>
                            <td>${operUser.mbPhone}</td>
                            <td>${operUser.jkjUserId}</td>
                            <td>${operUser.defMerId}</td>
                            <td>
                                <jkjTag:permission code="edit" dependMenuUrl="/admin/merchant/front/operUserAndMer/listInit">
                                    <button href="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/updateDefMerId/${operUser.id}/${params['merId']}?defMerId=${operUser.defMerId}"
                                            type="button" target="dialog" title="修改默认商户" class="btn btn-default btn-sm">修改默认商户</button>
                           		</jkjTag:permission>
                                <jkjTag:permission code="grant" dependMenuUrl="/admin/merchant/front/operUserAndMer/listInit">
                                    <button href="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/addUsersPerm/${operUser.id}/${params['merId']}"
                                            type="button" target="dialog" title="商户操纵员分配角色" class="btn btn-default btn-sm">分配角色</button>
                                </jkjTag:permission>
                                <jkjTag:permission code="showRole" dependMenuUrl="/admin/merchant/front/operUserAndMer/listInit">
                                    <button href="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/showUsersPerm/${operUser.id}/${params['merId']}"
                                            type="button" target="dialog" title="商户操纵员角色查看" formSubmit="false" class="btn btn-default btn-sm">查看角色</button>
                                </jkjTag:permission>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${params.pager.totalCount eq 0}">
                    <tr>
                        <td colspan="8">没有任何数据</td>
                    </tr>
                </c:if>
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
    $(function () {
        var $merOperUserConfAdd = $("#mer-oper-user-conf-add").on("click", function () {
            var title = $merOperUserConfAdd.attr('title'), href = $merOperUserConfAdd.attr("href"),
                    width = $merOperUserConfAdd.attr('width'), height = $merOperUserConfAdd.attr('height'),
                    warn = $merOperUserConfAdd.attr("warn");
            var merId = $('#merOperUserConfMerId').val(),merName = $('#merOperUserConfMerId').children("option[selected='selected']").text();
            if (!merId) {
                MZ.alertMsg.warning(warn, null);
                return;
            }
            href += "?merId=" + merId + "&merName=" + encodeURIComponent(merName);
            $.mzdialog.open(href, null, title, {
                width: width,
                height: height,
                buttons: [
                    {
                        text: '关闭',
                        close: true
                    },
                    {
                        text: '提交',
                        addClass: 'btn-primary',
                        onClick: function ($btn, $dialog) {
                            var operUserIds = $("#mer-oper-user-conf-add").data('operUserIds'),
                                    merId = $('#merOperUserConfMerId').val();
                            if(!operUserIds || operUserIds.length == 0) {
                                MZ.alertMsg.warning("请选择要添加的操作员", null);
                                return false;
                            }
                            var defaultMerId_ = $dialog.find(":checkbox[name='defaultMerId']"),defaultMerId=false;
                            if(defaultMerId_.is(':checked')) defaultMerId = true;
                            $.ajax({
                                type: 'post',
                                url: MZ.getFullPath() + '/admin/merchant/front/operUserAndMer/addUsers',
                                data: {'merId': merId, 'operUserIds': operUserIds.join(','), 'defaultMerId': defaultMerId},
                                dataType: 'json',
                                cache: false,
                                success: function (responseData) {
                                    var json = MZ.jsonEval(responseData);
                                    dialogAjaxDone(json);
                                }
                            });
                        }
                    }
                ]
            });
        });
    });
</script>
