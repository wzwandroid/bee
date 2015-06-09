<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="swap" uri="http:/api.demo.com/jstl/swap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>测试/测试几个小功能</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/together.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/accounCheck.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/toLeft.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/front_paginator.css">
    <%--<jsp:include page="../../include/common_js.jsp" />--%>
    <script type="text/javascript"src="${pageContext.request.contextPath}/resources/js/front_common.js"></script>
    <script type="text/javascript"src="${pageContext.request.contextPath}/resources/js/front_paginator.js"></script>

    <script type="text/javascript">

    </script>
</head>

<body>
<!--top--start-->
<%--<jsp:include  page="../../include/header_top_nav.jsp" />--%>
<!--top--end-->
<!--nav--start-->
<%--<jsp:include  page="../../include/header_nav.jsp" />--%>
<!--nav--end-->
<!--content-->
<div class="content">
    <div class="warpper clearfix">
        <%--<jsp:include  page="../../include/left.jsp" />--%>
        <div class="conRt">
            <h2 class="conRtTit">
                <%--<a><jsp:include page="../../include/usertype.jsp"/></a> >> <a class="select" >商户菜单管理</a>--%>
            </h2>
            <div class="conRtBox">
                <form name="menuForm" id="menuForm" action="${pageContext.request.contextPath}/admin/test/list" method="post"  onsubmit="return tabSearch(this,'.mainbar')">
                    <input type="hidden" id="id" name="id"/>
                    <input type="hidden" id="ids" name="ids"/>
                    <input type="hidden" name="pageSize" value="${params['pager'].pageSize}">
                    <input type="hidden" name="pageNo" id="pageNo">
                    <table class="tabTop">
                        <tr>
                            <td>菜单名称：</td>
                            <td><input type="text" class="date" name="menuNameSearch" id="menuNameSearch" value="${params['name']}"/></td>
                            <td></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:right;padding:15px 35px 15px 0;"><input class="btn" type="submit" value="查询"></td>
                        </tr>
                    </table>
                </form>
                <div>
                    <%--<jkjTag:permission code="add" dependMenuUrl="/usrCenter/menu/list">--%>
                        <a class="add" id="add" href="javascript:void(0)" url="${pageContext.request.contextPath}/admin/test/add">[ 新增菜单 ]</a>
                    <%--</jkjTag:permission>--%>
                    <%--<jkjTag:permission code="del" dependMenuUrl="/usrCenter/menu/list">--%>
                    <%--<a class="del" id="del" href="javascript:void(0);"  url="${pageContext.request.contextPath}/usrCenter/menu/del">[ 删除菜单 ]</a>--%>
                    <%--</jkjTag:permission>--%>
                </div>

                <div style="width:766px;overflow: scroll;">
                    <table class="tabBto">
                        <tbody>
                        <tr style="background:#e7e7e7; height:35px;">
                            <td nowrap><input type="checkbox" name="choose_all"  id="choose_all" /></td>
                            <td  nowrap>#</td>
                            <td  nowrap>菜单名称</td>
                            <td  nowrap>请求地址</td>
                            <td  nowrap>菜单类型</td>
                            <td  nowrap>菜单父类</td>
                            <td  nowrap>创建时间</td>
                            <td  nowrap>操作</td>
                        </tr>
                        <c:set var="pager" value="${params['pager']}"/>
                        <c:set var="rowNum" value="${(pager.pageNo - 1) * pager.pageSize}" />
                        <c:if test="${not empty pager.result}">
                            <c:forEach items="${pager['result']}" var="menuItem">
                                <c:set var="rowNum" value="${rowNum + 1}"/>
                                <tr>
                                    <td nowrap><input class="chk" name="chk" type="checkbox" value="${menuItem.id}">
                                    </td>
                                    <td nowrap>${rowNum}</td>
                                    <td nowrap>${menuItem.name}</td>
                                    <td nowrap>
                                            ${menuItem.href}
                                    </td>
                                    <td nowrap>
                                            ${menuItem.type}
                                    </td>
                                    <td nowrap>
                                            ${menuItem.parentName}
                                    </td>
                                    <td nowrap>
                                        <c:if test="${menuItem.createTime != null}">
                                            ${swap:swapDatePattern(menuItem.createTime,"yyyyMMddHHmmss" ,"yyyy-MM-dd HH:mm:ss")}
                                        </c:if>
                                    </td>
                                    <td nowrap>
                                        <%--<jkjTag:permission code="update" dependMenuUrl="/usrCenter/menu/list">--%>
                                            <a class="modify" id="modify"href="javascript:void(0)" url="${pageContext.request.contextPath}/usrCenter/menu/update" rid="${menuItem.id}">[ 修改菜单 ]</a>
                                        <%--</jkjTag:permission>--%>
                                        <%--<jkjTag:permission code="view" dependMenuUrl="/usrCenter/menu/list">--%>
                                            <%--<a class="view" id="view" href="javascript:void(0)" url="${pageContext.request.contextPath}/usrCenter/menu/show" rid="${menuItem.id}">[ 查看菜单 ]</a>--%>
                                        <%--</jkjTag:permission>--%>
                                        <%--<c:if test="${not empty menuItem.href}">--%>
                                            <%--<jkjTag:permission code="view" dependMenuUrl="/usrCenter/menu/list">--%>
                                                <%--<a class="view"  href="javascript:void(0)" url="${pageContext.request.contextPath}/usrCenter/menu/showPermission" rid="${menuItem.id}">[ 查看菜单权限]</a>--%>
                                            <%--</jkjTag:permission>--%>
                                        <%--</c:if>--%>
                                    </td>

                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty pager['result']}">
                            <tr>
                                <td colspan="11">没有查询结果</td>
                            </tr>
                        </c:if>
                        </tbody>

                    </table>
                </div>

                <%--<jsp:include page="common/front_pagination.jsp"/>--%>
                <hr/>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!--content-->
<!--footer--start-->
<div class="html-included" href="../../include/footer_info.html"></div>
<!--footer--end-->
</body>
</html>