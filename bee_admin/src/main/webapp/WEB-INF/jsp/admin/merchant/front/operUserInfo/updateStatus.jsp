<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
<div class="col-md-12">
    <div class="widget wgreen">
        <div class="widget-content">
            <hr>
            <form action="${pageContext.request.contextPath}/admin/merchant/front/operUserInfo/updateStatus" onsubmit="return validateForm(this,dialogAjaxDone,null,null)"
                     role="form" method="post" class="required-validate">
                <input type="hidden" name="id" value="${operUserInfoEntity.id}">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="name">操作员姓名：</label>
                                <div class="col-md-7">
                                    <input id="name" class="form-control" type="text" value="${operUserInfoEntity.name}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="mbPhone">操作员手机号：</label>
                                <div class="col-md-7">
                                    <input id="mbPhone" class="form-control required" type="text" value="${operUserInfoEntity.mbPhone}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="status">操作员状态：</label>
                                <div class="col-md-7">
                                    <select name="status" class="form-control" id="status">
                                        <option value="${enableStatus.id}" <c:if test="${enableStatus.id eq operUserInfoEntity.status}">selected="selected"</c:if>>${enableStatus.paramValue}</option>
                                        <option value="${disabledStatus.id}" <c:if test="${disabledStatus.id eq operUserInfoEntity.status}">selected="selected"</c:if>>${disabledStatus.paramValue}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="syncStatus">健康金同步状态：</label>
                                <div class="col-md-7">
                                    <c:if test="${syncStatus_syncSuccess.id eq operUserInfoEntity.syncStatus}">
                                        <input type="text" class="form-control" id="syncStatus" disabled value="${syncStatus_syncSuccess.paramValue}">
                                    </c:if>
                                    <c:if test="${syncStatus_syncSuccess.id ne operUserInfoEntity.syncStatus}">
                                        <select id="syncStatus" name="syncStatus" class="form-control">
                                            <option value="${syncStatus_noSync.id}" <c:if test="${syncStatus_noSync.id eq operUserInfoEntity.syncStatus}">selected="selected"</c:if>>${syncStatus_noSync.paramValue}</option>
                                            <option value="${syncStatus_syncFailed.id}" <c:if test="${syncStatus_syncFailed.id eq operUserInfoEntity.syncStatus}">selected="selected"</c:if>>${syncStatus_syncFailed.paramValue}</option>
                                            <option value="${syncStatus_syncDisabled.id}" <c:if test="${syncStatus_syncDisabled.id eq operUserInfoEntity.syncStatus}">selected="selected"</c:if>>${syncStatus_syncDisabled.paramValue}</option>
                                        </select>tt
                                    </c:if>
                                </div>
                            </div>
                        </div>
            </form>
        </div>
    </div>
</div>
</div>