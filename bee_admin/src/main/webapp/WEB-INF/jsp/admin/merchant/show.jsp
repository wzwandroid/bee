<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<div class="row">
        <div class="col-md-12">
            <div class="widget wgreen">
                <div class="widget-content">
                    <hr>
                    <sf:form
                             modelAttribute="merInfo" role="form" method="post">
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
                                                    <sf:select path="merCity" id="merCity" cssClass="form-control"  disabled="true">
                                                        <option value="${city.paramName}">${city.paramValue}</option>
                                                    </sf:select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="merIdType">医院类别：</label>

                                                <div class="col-md-7">
                                                    <sf:select path="merIdType" id="merIdType" cssClass="form-control"  disabled="true">
                                                        <option value="${merIdType.paramName}">${merIdType.paramValue}</option>
                                                    </sf:select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="merName">商户名称：</label>

                                                <div class="col-md-7">
                                                    <sf:input id="merName" path="merName" type="text" cssClass="form-control"   disabled="true"
                                                              placeholder=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="merType">商户类型：</label>

                                                <div class="col-md-7">
                                                    <sf:select path="merType" id="merType" cssClass="form-control"  disabled="true">
                                                            <option value="${merType.paramName}" >${merType.paramValue}</option>
                                                    </sf:select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="merStat">商户状态：</label>

                                                <div class="col-md-7">
                                                    <sf:select path="merStat" id="merStat" cssClass="form-control"  disabled="true">
                                                            <option value="${merStat.paramName}">${merStat.paramValue}</option>
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
                                                <label class="col-md-5 control-label" >修改时间：</label>

                                                <div class="col-md-7">

                                                <c:if test="${not empty merInfo.editTime}">
                                                    ${jkjFn:swapDatePattern(merInfo.editTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                                                </c:if>
                                                </div>
                                                </div>

                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="linkMan">联系人：</label>

                                                <div class="col-md-7">
                                                    <sf:input path="linkMan" id="linkMan" cssClass="form-control" disabled="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="linkMobile">联系电话1：</label>

                                                <div class="col-md-7">
                                                    <sf:input path="linkMobile" id="linkMobile" cssClass="form-control" disabled="true"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-5 control-label" for="linkEmail">电邮地址：</label>

                                                <div class="col-md-7">
                                                    <sf:input path="linkEmail" id="linkEmail" cssClass="form-control" disabled="true"/>
                                                </div>
                                            </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="resv1">备注信息1：</label>

                                        <div class="col-md-7">
                                            <sf:textarea path="resv1" id="resv1" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="resv2">备注信息2：</label>

                                        <div class="col-md-7">
                                            <sf:textarea path="resv2" id="resv2" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="resv3">备注信息3：</label>

                                        <div class="col-md-7">
                                            <sf:textarea path="resv3" id="resv3" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="resv4">备注信息4：</label>

                                        <div class="col-md-7">
                                            <sf:textarea path="resv4" id="resv4" cssClass="form-control" disabled="true"/>
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
                                            <sf:input path="merDes" id="merDes" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="linkTel">联系电话2：</label>

                                        <div class="col-md-7">
                                            <sf:input path="linkTel" id="linkTel" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="merFax">传真：</label>

                                        <div class="col-md-7">
                                            <sf:input path="merFax" id="merFax" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="merAddr">商户地址：</label>

                                        <div class="col-md-7">
                                            <sf:input path="merAddr" id="merAddr" cssClass="form-control" disabled="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label" for="busiCode">企业代码：</label>

                                        <div class="col-md-7">
                                            <sf:input path="busiCode" id="busiCode" cssClass="form-control" disabled="true"/>
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