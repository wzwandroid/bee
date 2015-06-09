<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
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
        <th>权限代码值</th>
        <th>权限名称</th>
        <th>所属菜单</th>
        <th>菜单请求地址</th>
    </tr>
    </thead>
    <tbody class="mzGridTbody">
    <c:if test="${not empty merPermConfEntities}">
        <c:forEach items="${merPermConfEntities}" var="permission" varStatus="status">
            <tr target="sid_id">
                <td class="center">
                    <label>
                        <input type="checkbox" class="mz-chk" value="${permission.id}">
                        <span class="mz-lbl"></span>
                    </label>
                </td>
                <td>${status.index+1}</td>
                <td>${permission.permCode}</td>
                <td>${permission.permName}</td>
                <td>${permission.merMenuInfoName}</td>
                <td>${permission.merMenuInfoHref}</td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty merPermConfEntities}">
        <td colspan="6">
            <p class="text-center"><strong>查询记录为空</strong></p>
        </td>
    </c:if>
    </tbody>
</table>