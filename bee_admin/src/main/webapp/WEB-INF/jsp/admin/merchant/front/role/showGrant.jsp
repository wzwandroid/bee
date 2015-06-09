<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>健康金门户网站</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/together.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/accounCheck.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/toLeft.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/addbank.css">
    <jsp:include page="../../include/common_js.jsp" />

    <style type="text/css">
        /*
 * path list
 */

        .path-list {
            margin-left: 20px;
        }

        .pathItem {
            height: 22px;
            line-height: 21px;
            margin: 4px 0 4px 10px;
            padding-right: 5px;
        }

        .pathItem-con li {
            float: left;
            padding-left: 9px;
            width: 200px;
            position: relative;
        }


    </style>
</head>
<body>
<!--top--start-->
<jsp:include  page="../../include/header_top_nav.jsp" />
<!--top--end-->
<!--nav--start-->
<jsp:include  page="../../include/header_nav.jsp" />
<!--nav--end-->


<!--content--start-->

<div class="content">
    <div class="warpper clearfix">
        <jsp:include  page="../../include/left.jsp" />
        <div class="conRt">
            <h2 class="conRtTit">
                <a href="${pageContext.request.contextPath}/usrCenter/role/list">角色管理</a>
                >> 角色授权
            </h2>
            <div class="conRtBox conBg">

                    <div class="barbox">
                        <div class="path-list">
                            <ul class="pathItem-con clearfix">

                                <c:forEach var="merPerm" items="${allMerPerms}">
                                    <li class="pathItem">
                                        <label class="checkbox">
                                            <input type="checkbox" name="rolePerms" value="${merPerm.id}" disabled="true"
                                                 <c:if test="${merPerm.selected == true}">checked</c:if>
                                                    />&nbsp;${merPerm.permName}
                                        </label>
                                    </li>

                                </c:forEach>
                                </ul>
                            </div>
                        <p class="noLine">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/usrCenter/role/list">
                                <input class="cancel" type="button" name="button" value="返回" class="bt01"/>
                            </a>
                        </p>
                    </div>
            </div>
        </div>
    </div>
</div>
<!--content--end-->
<!--footer--start-->
<div class="html-included" href="../include/footer_info.html"></div>
<!--[#include "../include/页脚信息栏.html"/]-->
<!--footer--end-->

</body>
</html>
