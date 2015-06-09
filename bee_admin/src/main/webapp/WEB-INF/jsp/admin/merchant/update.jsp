<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<%--<div class="modal-header">--%>
    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
    <%--<h3>商户信息修改</h3>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<div class="row">
<div class="col-md-12">
<div class="widget wgreen">
<div class="widget-content">
<hr>
<sf:form action="${pageContext.request.contextPath}/admin/merchant/update/${merInfo.id}" onsubmit="return validateForm(this,dialogAjaxDone)"
         modelAttribute="merInfo" role="form" method="post" cssClass="required-validate">

    <sf:hidden path="id"/>
    <sf:hidden path="merId"/>
    <sf:hidden path="merProvince"/>
    <sf:hidden path="merCity"/>
    <sf:hidden path="merIdType"/>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#add-main" data-toggle="tab">商户信息</a></li>
        <li class=""><a href="#add-addition" data-toggle="tab">商户附属信息</a></li>
    </ul>

    <div class="tab-content">
        <!-- 商户基本信息 merInfo-->
        <div class="tab-pane fade in active" id="add-main">
            <hr>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merId">商户编号：</label>

                    <div class="col-md-7">
                        <sf:input id="merId" path="merId" type="text" cssClass="form-control"   disabled="true"
                                  placeholder=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merProvince">省区：</label>

                    <div class="col-md-7">
                        <sf:select path="merProvince" id="merProvince" cssClass="form-control" disabled="true">
                            <option value="${province.paramName}">${province.paramValue}</option>
                        </sf:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merCity">市区：</label>

                    <div class="col-md-7">
                        <sf:select path="merCity" id="merCity" cssClass="form-control" disabled="true">
                            <option value="${city.paramName}">${city.paramValue}</option>
                        </sf:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merIdType">医院类别：</label>

                    <div class="col-md-7">
                        <sf:select path="merIdType" id="merIdType" cssClass="form-control" disabled="true">
                            <option value="${merIdType.paramName}">${merIdType.paramValue}</option>
                        </sf:select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-5 control-label" for="merName">商户名称：</label>

                    <div class="col-md-7">
                        <sf:input id="merName" path="merName" type="text" cssClass="form-control required"
                                  placeholder=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merType">商户类型：</label>

                    <div class="col-md-7">
                        <sf:select path="merType" id="merType" cssClass="form-control required">
                            <sf:option value="">...</sf:option>
                            <c:forEach var="merType" items="${merTypes}">
                                <option value="${merType.paramName}" <c:if
                                        test="${merInfo.merIdType eq merType.paramName}"> selected </c:if>>${merType.paramValue}</option>
                            </c:forEach>

                        </sf:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merStat">商户状态：</label>

                    <div class="col-md-7">
                        <sf:select path="merStat" id="merStat" cssClass="form-control">
                            <sf:option value="">...</sf:option>
                            <c:forEach var="merStat" items="${merStats}">
                                <c:if test="${merStat.paramName eq '0001' || merStat.paramName eq '0002' || merStat.paramName eq '1001'}">
                                    <option value="${merStat.paramName}" <c:if
                                            test="${merInfo.merStat eq merStat.paramName}"> selected </c:if>>${merStat.paramValue}</option>
                                </c:if>
                            </c:forEach>
                        </sf:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label">开户时间</label>

                    <div class="col-md-7">
                        <c:if test="${not empty merInfo.regTime}">
                            ${jkjFn:swapDatePattern(merInfo.regTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}

                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label">修改时间：</label>

                    <div class="col-md-7">

                        <c:if test="${not empty merInfo.editTime}">
                            ${jkjFn:swapDatePattern(merInfo.editTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                        </c:if>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-5 control-label" for="linkMan">联系人：</label>

                    <div class="col-md-7">
                        <sf:input path="linkMan" id="linkMan" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="linkMobile">联系电话1：</label>

                    <div class="col-md-7">
                        <sf:input path="linkMobile" id="linkMobile" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-5 control-label" for="linkEmail">电邮地址：</label>

                    <div class="col-md-7">
                        <sf:input path="linkEmail" id="linkEmail" cssClass="form-control email"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-5 control-label" for="resv1">备注信息1：</label>

                    <div class="col-md-7">
                        <sf:textarea path="resv1" id="resv1" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="resv2">备注信息2：</label>

                    <div class="col-md-7">
                        <sf:textarea path="resv2" id="resv2" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="resv3">备注信息3：</label>

                    <div class="col-md-7">
                        <sf:textarea path="resv3" id="resv3" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="resv4">备注信息4：</label>

                    <div class="col-md-7">
                        <sf:textarea path="resv4" id="resv4" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- 商户附属信息 merAttrInfo-->
        <div class="tab-pane fade" id="add-addition">
            <hr>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merDes">商户描述：</label>

                    <div class="col-md-7">
                        <sf:input path="merDes" id="merDes" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="linkTel">联系电话2：</label>

                    <div class="col-md-7">
                        <sf:input path="linkTel" id="linkTel" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merFax">传真：</label>

                    <div class="col-md-7">
                        <sf:input path="merFax" id="merFax" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label" for="merAddr">商户地址：</label>

                    <div class="col-md-7">
                        <sf:input path="merAddr" id="merAddr" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-5 control-label" for="busiCode">企业代码：</label>

                    <div class="col-md-7">
                        <sf:input path="busiCode" id="busiCode" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</sf:form>
</div>
</div>
</div>
</div>
<%--</div>--%>
<%--<div class="modal-footer">--%>
    <%--<button type="button" data-dismiss="modal" class="btn">关闭</button>--%>
    <%--<button type="submit" class="btn btn-primary" ajaxSubmit="true">保存</button>--%>
<%--</div>--%>
