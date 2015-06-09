<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <!-- Table -->
        <div class="widget">
            <div class="widget-content">
                <div class="panel-group mz-pager-search">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion-searcha" href="#dlg_mer_addUser">条件搜索</h4>
                        </div>
                        <div class="panel-collapse collapse in" id="dlg_mer_addUser">
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/admin/merchant/front/operUserAndMer/addUsers"
                                      method="get" onsubmit="return dialogSearch(this);">
                                    <label>
                                        <span>批次名称：</span>
                                        <select name="importBatchId" id="merOperUserConfMerId">
                                            <option value="">==批次名称==</option>
                                            <c:forEach items="${importBatches}" var="ib">
                                                <option value="${ib.IMPORT_BATCH_ID}" <c:if test="${params['importBatchId'] eq ib.IMPORT_BATCH_ID}">selected="selected"</c:if> >${ib.IMPORT_BATCH_NAME}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <div class="buttonActive">
                                        <button type="submit" class="btn btn-default">搜索</button>
                                    </div>
                                    <input type="hidden" name="pageSize" value="${pager.pageSize}">
                                    <input type="hidden" name="merId" value="${params['merId']}">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover" id="dlg-mer-oper-user-conf">
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
                <div class="widget-foot">
                    <div class="mz-pages" totalCount="${params['pager'].totalCount}"  pageSize="${params['pager'].pageSize}"
                         pageNo="${params['pager'].pageNo}" pageNumShown="10" targetType="dialog"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-5 control-label">当前选中商户：</label>
                        <div class="col-md-7">
                            <p class="form-control-static">${merName}</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-5 control-label">设置默认商户：</label>
                        <div class="col-md-7">
                            <input type="checkbox" name="defaultMerId">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var $merOperUserConfAdd = $("#mer-oper-user-conf-add");
        var operUserIds = $merOperUserConfAdd.data('operUserIds');
        var trCheckboxes = $('#dlg-mer-oper-user-conf>tbody>tr>td.center>label>:checkbox');
        var thCheckbox = $('#dlg-mer-oper-user-conf>thead>tr>th.center>label>:checkbox');
        if(!operUserIds)operUserIds = [];
        thCheckbox.each(function () {
            var $this = $(this);
            $this.on("click", function () {
                var operUserIds = $merOperUserConfAdd.data('operUserIds');
                if(!operUserIds) operUserIds = [];
                if ($this.is(":checked")) {
                    trCheckboxes.each(function () {
                        var $chk = $(this);
                        if(!$chk.is(":checked")) {
                            $chk.prop("checked", true);
                            operUserIds.push($chk.val());
                        }
                    });
                    $merOperUserConfAdd.data('operUserIds', operUserIds);
                } else {
                    trCheckboxes.each(function () {
                        var $chk_ = $(this);
                        $chk_.prop("checked", false);
                        for (var i = 0, len = operUserIds.length; i < len; i++) {
                            if ($chk_.val() == operUserIds[i]) {
                                operUserIds.splice(i, 1);
                                break;
                            }
                        }
                    });
                    $merOperUserConfAdd.data('operUserIds', operUserIds);
                }
            });
        });
        var _cnt=0;
        trCheckboxes.each(function () {
            var $this = $(this), val = $this.val();
            if (operUserIds) {
                var i = 0, len = operUserIds.length;
                for (; i < len; i++) {
                    if (val == operUserIds[i]) {
                        $this.prop("checked", true);
                        _cnt += 1;
                        break;
                    }
                }
            }
            $this.on('click', function () {
                var operUserIds = $merOperUserConfAdd.data('operUserIds'),
                        $trChk = $(this),val=$trChk.val();
                if(!operUserIds) operUserIds = [];
                if ($trChk.is(":checked")) {
                    operUserIds.push(val);
                } else {
                    for (var i = 0, len = operUserIds.length; i < len; i++) {
                        if (val == operUserIds[i]) {
                            operUserIds.splice(i, 1);
                            break;
                        }
                    }
                }
                $merOperUserConfAdd.data('operUserIds', operUserIds);
            });
        });
        if(_cnt != 0 && _cnt == trCheckboxes.length) thCheckbox.prop("checked", true);
    });
</script>