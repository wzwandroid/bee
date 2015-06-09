<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>

                <form action="${pageContext.request.contextPath}/function/test/user/update/${userEntity.id}" onsubmit="return validateForm(this,dialogAjaxDone)"
                      role="form" method="post" class="required-validate">

                    <!-- 用户基本信息 TUser-->
                    <div class="form-horizontal">

                        <div class="form-group">
                            <label class="col-md-5 control-label" for="userName">用户名：</label>

                            <div class="col-md-7">
                                <input id="userName" name="userName" type="text" class="form-control" value="${userEntity.userName}"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="userPass">用户密码：</label>
                            <div class="col-md-7">
                                <input id="userPass" name="userPass" type="text" class="form-control required" value="${userEntity.userPass}"
                                       placeholder=""/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
