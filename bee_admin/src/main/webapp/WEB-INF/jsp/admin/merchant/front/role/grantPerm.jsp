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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/percom.css">
    <jsp:include page="../../include/common_js.jsp" />

    <script type="text/javascript">
        function validateForm(){
            var rolePerm = $("input:checkbox[name='rolePerms']:checked");
            if(rolePerm.length <= 0){
                alert("请选择权限");
                return false
            }
        }
    </script>

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
                <form onsubmit="return validateForm();" action="${pageContext.request.contextPath}/usrCenter/role/grantPermConfirm" name="grantPermForm" id="grantPermForm" method="post">
                   <input type="hidden" name="roleId" value="${merRoleInfoEntity.id}"/>
                    <div class="barbox">
                        <div class="path-list">
                            <ul class="pathItem-con clearfix">

                                <c:forEach var="merPerm" items="${allMerPerms}">
                                    <li class="pathItem">
                                        <label class="checkbox">
                                            <input type="checkbox" name="rolePerms" value="${merPerm.id}"
                                                 <c:if test="${merPerm.selected == true}">checked</c:if>
                                                    />&nbsp;${merPerm.permName}
                                        </label>
                                    </li>

                                </c:forEach>
                                </ul>
                            </div>
                        <p class="noLine">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="confirm" type="submit" name="button" value="确   认" class="bt01"/>
                            <a href="${pageContext.request.contextPath}/usrCenter/role/list">
                                <input class="cancel" type="button" name="button" value="返回" class="bt01"/>
                            </a>
                        </p>
                    </div>
                </form>
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
