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
        <a href="#" class="">通用权限管理</a>
        <span class="divider">/</span>
        <a href="#" class="bread-current">商户信息管理</a>
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
                        <form action="${pageContext.request.contextPath}/admin/merchant/list" method="post" onsubmit="return tabSearch(this,'.mainbar')">
                            <label>
                                <span>省区：</span>
                                <select name="merProvince" id="merProvinceSearch" linkage="linkage"
                                        data-next-select="#merCitySearch" data-select-url="${pageContext.request.contextPath}/admin/merchant/getMerCities?pid={value}">
                                    <option value="">......</option>
                                    <c:forEach var="province" items="${provinces}">
                                        <option value="${province.paramName}" <c:if test="${params['merProvince'] eq province.paramName}"> selected </c:if> >
                                        ${province.paramValue}</option>
                                    </c:forEach>
                                </select>
                            </label>

                            <label>
                                <span>市区：</span>
                                <select name="merCity" id="merCitySearch">
                                    <option value="">......</option>
                                    <c:forEach var="city" items="${cities}">
                                        <option value="${city.paramName}" <c:if test="${params['merCity'] eq city.paramName}"> selected </c:if>>${city.paramValue}</option>
                                    </c:forEach>
                                </select>
                            </label>

                            <label>
                                <span>医院类别：</span>
                                <select name="merIdType" id="merIdType">
                                    <option value="">......</option>
                                    <c:forEach var="merIdType" items="${merIdlTypes}">
                                        <option value="${merIdType.paramName}" <c:if test="${params['merIdType'] eq merIdType.paramName}"> selected </c:if>>${merIdType.paramValue}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                <span>商户姓名：</span>
                                <input type="text" name="merName" value="${params['merName']}">
                            </label>

                            <label>
                                <span>商户类型：</span>
                                <select name="merType" id="merType">
                                    <option value="">......</option>
                                    <c:forEach var="merType" items="${merTypes}">
                                        <option value="${merType.paramName}" <c:if test="${params['merType'] eq merType.paramName}"> selected </c:if>>${merType.paramValue}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                <span>商户状态：</span>
                                <select name="merStat" id="merStat">
                                    <option value="">......</option>
                                    <c:forEach var="merStat" items="${merStats}">
                                        <option value="${merStat.paramName}" <c:if test="${params['merStat'] eq merStat.paramName}"> selected </c:if>>${merStat.paramValue}</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                <span>开户时间：</span>
                                <input size="16" type="text" id="regTimeStart" name="regTimeStart" value="${params['regTimeStart']}"
                                       readonly class="date" data-date-format="yyyy-mm-dd"
                                       minView="2" onShow="regTimeStartFn"/> </label>
                            <label>
                                <span>至 &nbsp;&nbsp;</span>
                                <input size="16" type="text" name="regTimeEnd" value="${params['regTimeEnd']}"
                                       readonly class="date"  minView="2" id="regTimeEnd"
                                       data-date-format="yyyy-mm-dd"/>
                            </label>
                            <label>
                                <span>商户编号：</span>
                                <input type="text" name="merId" value="${params['merId']}">
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
                <jkjTag:permission code="add" dependMenuUrl="/admin/merchant/listInit">
                    <button class="btn btn-primary" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/add"
                            width="850" height="350" title="商户信息新增"><i class="icon-plus"></i> 新增</button>
                </jkjTag:permission>
                <jkjTag:permission code="edit" dependMenuUrl="/admin/merchant/listInit">
                    <button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/update/{sid_merId}"
                            width="850" height="350" title="商户信息修改" warn="请选择商户" rel=""><i class="icon-edit"></i> 修改</button>
                </jkjTag:permission>
                <jkjTag:permission code="show" dependMenuUrl="/admin/merchant/listInit">
                    <button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/{sid_merId}"
                            width="850" height="350" title="商户信息查看" warn="请选择商户" formSubmit="false"><i class="icon-edit"></i> 详细查看</button>
                </jkjTag:permission>
                <%--<jkjTag:permission code="deleteMore">--%>
                    <%--<button class="btn btn-danger mz-delete"  rel="selectedTodo" href="${pageContext.request.contextPath}/admin/merchant/deleteIds"--%>
                            <%--delIds="ids" title="确定要删除？"><i class="icon-remove"></i> 删除</button>--%>
                <%--</jkjTag:permission>--%>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="tableScroller">
            <table class="table table-striped table-bordered table-hover" style="width: 1600px;">
                <thead>
                <tr class="mz-table-thead">
                    <th class="center" style="width: 10px;">
                        <label>
                            <input class="mz-chk" type="checkbox">
                            <span class="mz-lbl"></span>
                        </label>
                    </th>
                    <th  style="width: 10px;">#</th>
                    <th  style="width: 80px;">商户编号</th>
                    <th  style="width: 80px;">商户名称</th>
                    <th  style="width: 80px;">商户类型</th>
                    <th  style="width: 80px;">开户时间</th>
                    <th  style="width: 80px;">商户描述</th>
                    <th  style="width: 80px;">联系人</th>
                    <th  style="width: 80px;">联系电话1</th>
                    <th  style="width: 80px;">联系电话2</th>
                    <th  style="width: 80px;">传真</th>
                    <th  style="width: 80px;">商户地址</th>
                    <th  style="width: 80px;">电邮地址</th>
                    <th  style="width: 80px;">企业代码</th>
                    <th  style="width: 80px;">商户状态</th>
                    <th  style="width: 80px;">备注信息1</th>
                    <th  style="width: 80px;">备注信息2</th>
                    <th  style="width: 80px;">备注信息3</th>
                </tr>
                </thead>
                <tbody class="mzGridTbody">
                <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
                <c:forEach items="${params['pager'].result}" var="merchant">
                    <c:set var="rowNum" value="${rowNum + 1}"/>
                    <tr target="sid_merId" rel="${merchant.id}">
                        <td class="center">
                            <label>
                                    <%--通过商户基本信息表中的id来取得对应的值 而非商户编号--%>
                                <input type="checkbox" class="mz-chk" value="${merchant.id}">
                                <span class="mz-lbl"></span>
                            </label>
                        </td>
                        <td>${rowNum}</td>
                        <td>${merchant.merId}</td>
                        <td>${merchant.merName}</td>
                        <td>
                            <c:forEach var="merType" items="${merTypes}">
                                <c:if test="${merchant.merType eq merType.paramName}"> ${merType.paramValue} </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:if test="${merchant.regTime != null}">
                                ${jkjFn:swapDatePattern(merchant.regTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                            </c:if>
                        </td>
                        <td>${merchant.merDes}</td>
                        <td>${merchant.linkMan}</td>
                        <td>${merchant.linkMobile}</td>
                        <td>${merchant.linkTel}</td>
                        <td>${merchant.merFax}</td>
                        <td>${merchant.merAddr}</td>
                        <td>${merchant.linkEmail}</td>
                        <td>${merchant.busiCode}</td>

                        <td>
                                <%--${merchant.merStat}--%>
                            <div  class="dropdown">
                             	<a id="dropdownMenu1" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="icon-edit"></i><span id="merStatSpan${merchant.merId}">

                                <c:forEach var="merStat" items="${merStats}">
                                    <c:if test="${merchant.merStat eq merStat.paramName}"> ${merStat.paramValue} </c:if>
                                </c:forEach>

                            </span>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <c:forEach var="merStat" items="${merStats}">
                                    <c:if test="${merStat.paramName eq '0001' || merStat.paramName eq '0002' || merStat.paramName eq '1001'}">
                                        <li id="${merchant.merId}${merStat.paramName}" class="merStatClass${merchant.merId}" <c:if test="${merchant.merStat eq merStat.paramName}">style="display: none"</c:if> ><a href="#" onclick="changeMerStat('${merStat.paramName}','${merchant.merId}')">${merStat.paramValue}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            </div>
                        </td>
                        <td>${merchant.resv1}</td>
                        <td>${merchant.resv2}</td>
                        <td>${merchant.resv3}</td>

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
<script type="text/javascript">
    function regTimeStartFn (ev) {
        var regTimeEndTime = $('#regTimeEnd').val();
        $(ev.target).datetimepicker('setEndDate', regTimeEndTime);
    }

    function changeMerStat(desMerStatus,merId){
        MZ.alertMsg.confirm("确定要更改商户状态吗", {
            okClick: function () {
                var desMerStatsName = $("#"+merId+desMerStatus).children("a").text();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "${pageContext.request.contextPath}/admin/merchant/changeMerStat",
                    data: {
                        'merStatus': desMerStatus,
                        'merId': merId
                    },
                    success: function (data) {
                        if (data.statusCode == "200") {
                            MZ.alertMsg.error("操作成功");
                            $("#merStatSpan" + merId).text(desMerStatsName);
                            $(".merStatClass"+merId).attr("style", "");
                            $("#" + merId + desMerStatus).attr("style", "display:none");
                        }else  if (data.statusCode == "300") {
                            MZ.alertMsg.error("操作失败，请联系管理员");
                        }else{
                            MZ.alertMsg.error("请联系管理员");
                        }
                    }
                });
            }
        });
    }
</script>