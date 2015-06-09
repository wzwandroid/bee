<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <!-- Table -->
        <div class="widget">
            <div class="widget-content">
                <form method="post" class="form-horizontal required-validate" role="form"
                      action="${pageContext.request.contextPath}//admin/merchant/front/operUserAndMer/updateDefMerId/${paramMerId}"
                      onsubmit="return validateForm(this,dialogAjaxDone,null,null);">
                    <div class="form-group">
                        <label class="col-md-5 control-label">选中默认商户：</label>
                        <div class="col-md-7">
                            <input type="hidden" name="operUserId" value="${operUserId}">
                            <select class="form-control" name="defMerId">
                                <option value="">无默认商户</option><
                                <c:forEach items="${merList}" var="mer">
                                    <c:if test="${mer.merId eq defMerId}"><option value="${mer.merId}" selected>${mer.merName}</option></c:if>
                                    <c:if test="${mer.merId ne defMerId}"><option value="${mer.merId}">${mer.merName}</option> </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>