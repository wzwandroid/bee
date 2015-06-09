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
        <a href="#" class="bread-current">操作员管理</a>
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
                        <form action="${pageContext.request.contextPath}/admin/merchant/front/operUserInfo/list" method="post" onsubmit="return tabSearch(this,'.mainbar')">
                            <label>
                                <span>导入批次：</span>
                                <select name="importBatchId" id="importBatchId">
                                    <option value="">==请选择批次==</option>
                                    <c:forEach items="${importBatches}" var="importB">
                                        <option value="${importB['IMPORT_BATCH_ID']}" <c:if test="${params['importBatchId'] eq importB['IMPORT_BATCH_ID']}">selected="selected"</c:if> >${importB['IMPORT_BATCH_NAME']}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                <span>姓名：</span>
                                <input type="text" name="name" value="${params['name']}">
                            </label>
                            <label>
                                <span>手机号码：</span>
                                <input type="text" name="mbPhone" value="${params['mbPhone']}">
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
                <jkjTag:permission code="import">
                    <button class="btn btn-primary" href="${pageContext.request.contextPath}/admin/merchant/front/operUserInfo/add"
                            width="650" height="350" title="操作员导入" id="oper-user-info-add"><i class="icon-plus"></i> 新操作员导入</button>
                  </jkjTag:permission>
                <jkjTag:permission code="keep">
                    <button class="btn btn-info" title="同步到健康金账户系统中？" id="oper-user-info-sync"><i class="icon-edit"></i> 同步操作员</button>
                   </jkjTag:permission>
                <jkjTag:permission code="edit">
                    <button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/operUserInfo/updateStatus/{sid_operUserInfoId}"
                            width="650" height="350" title="操作员状态修改" warn="请选择操作员"><i class="icon-edit"></i> 操作员状态修改</button>
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
                    <th>状态</th>
                    <th>健康金同步状态</th>
                    <th>健康金用户标识</th>
                    <th>默认商户号</th>
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
                                    <input type="checkbox" class="mz-chk" value="${operUser.id}">
                                    <span class="mz-lbl"></span>
                                </label>
                            </td>
                            <td>${rowNum}</td>
                            <td>${operUser.name}</td>
                            <td>${operUser.idCard}</td>
                            <td>${operUser.mbPhone}</td>
                            <td>
                                <c:if test="${enableStatus.id eq operUser.status}">${enableStatus.paramValue}</c:if>
                                <c:if test="${disabledStatus.id eq operUser.status}">${disabledStatus.paramValue}</c:if>
                            </td>
                            <td>
                                <c:if test="${syncStatus_noSync.id eq operUser.syncStatus}">${syncStatus_noSync.paramValue}</c:if>
                                <c:if test="${syncStatus_syncDisabled.id eq operUser.syncStatus}">${syncStatus_syncDisabled.paramValue}</c:if>
                                <c:if test="${syncStatus_syncFailed.id eq operUser.syncStatus}">${syncStatus_syncFailed.paramValue}</c:if>
                                <c:if test="${syncStatus_syncSuccess.id eq operUser.syncStatus}">${syncStatus_syncSuccess.paramValue}</c:if>
                            </td>
                            <td>${operUser.jkjUserId}</td>
                            <td>${operUser.defMerId}</td>

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
        /**
         * 将上传的操作员同步到账户系统中
         */
        function syncJkjUsers() {
            var params = {},importBatchId=$("#importBatchId").val();
            if(!importBatchId) {
                MZ.alertMsg.warning("请选择批次号", {});
                return false;
            }
            params['importBatchId'] = importBatchId;
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/admin/merchant/front/operUserInfo/syncJkjUser",
                data: params,
                dataType: 'json',
                success: function (responseData) {
                    var json = MZ.jsonEval(responseData);
                    if(json[MZ.keys.successKey] == MZ.successValue.success) {
                        MZ.alertMsg.success(json[MZ.keys.messageKey],{});
                        tabSearch($("#importBatchId").closest("form"), ".mainbar");
                    } else {
                        MZ.alertMsg.error(json[MZ.keys.messageKey],{});
                    }
                }
            });
        }
        var $operUserInfoAdd = $("#oper-user-info-add").on("click", function () {
            var title = $operUserInfoAdd.attr('title'), href = $operUserInfoAdd.attr("href"),width = $operUserInfoAdd.attr('width'),
                    height = $operUserInfoAdd.attr('height');
            $.mzdialog.open(href, null, title, {
                width:width,
                height:height,
                onShown: function ($dialog) {
                    $('#fileupload', $dialog).btupload({
                        'uploader':'${pageContext.request.contextPath}/upload/upload',
                        'fileObjName':'file',
                        'fileTypeExts':'*.xlsx;*.xls',
                        'onUploadSuccess': function (file,data,response) {
                            var json=MZ.jsonEval(data);
                            if(json.success) {
                                var $form = $dialog.find('form');
                                var params = $form.serialize();
                                params += '&importFilename=' + json.serverPathanme;
                                if($form.valid()) {
                                    $.ajax({
                                        type:$form.attr("method"),
                                        url:$form.attr("action"),
                                        data:params,
                                        dataType:'json',
                                        cache:false,
                                        success: function (responseData) {
                                            var json = MZ.jsonEval(responseData);
                                            if(json[MZ.keys.successKey] == MZ.successValue.success) {
                                                $.mzdialog.close($dialog);
                                                var basepath = MZ.getFullPath();
                                                var url = json.forwardUrl;
                                                if(url.indexOf(basepath) < 0) {
                                                    url = basepath + url;
                                                }
                                                $('.mainbar', 'body').loadUrl(url, {}, null);
                                                if(json.data) {
                                                    MZ.alertMsg.confirm("这是第一次导入，是否需要立即同步到健康金账户中？", {
                                                        okClick: function () {
                                                            syncJkjUsers();
                                                        }
                                                    });
                                                } else {
                                                    MZ.alertMsg.success(json[MZ.keys.messageKey], null);
                                                }
                                            } else if(json[MZ.keys.successKey] == MZ.successValue.failed) {
                                                MZ.alertMsg.error(json[MZ.keys.messageKey], {});
                                            } else if(json[MZ.keys.successKey] == MZ.successValue.timeout) {

                                            } else {
                                                //ignore
                                            }
                                        }
                                    })
                                }
//                                $dialog.find('form').submit();
                            }
                        }
                    });
                },
                buttons:[
                    {
                        text:'关闭',
                        close:true
                    },
                    {
                        text:'导入并且同步到健康金系统',
                        addClass:'btn-primary',
                        onClick: function ($btn, $dialog) {
                            if(!$dialog.find('form').valid()) return false;
                            $('#fileupload', $dialog).btupload('upload');
                        }
                    }
                ]
            });
        });
        var $operUserInfoSync = $('#oper-user-info-sync').on('click', function () {
            var title = $operUserInfoSync.attr('title');
            MZ.alertMsg.confirm(title, {
                okClick: function () {
                    syncJkjUsers();
                }
            });
        });
    });
</script>
