<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <c:if test="${existed}">
                    <ul class="mtree" data-nodes='${jkjFn:toJSON(roleGrant)}' data-chk-style="false"></ul>
                </c:if>
                <c:if test="${!existed}">
                    <span class="label-warning label-lg">没有授予操作权限</span>
                </c:if>
            </div>
        </div>
    </div>
</div>

