<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>
                    <!-- 用户基本信息 TUser-->
                    <div class="form-horizontal">

                        <div class="form-group">
                            <label class="col-md-5 control-label" for="userName">用户名：</label>

                            <div class="col-md-7">
                                <input id="userName" name="userName" type="text" class="form-control" value="${userEntity.userName}" disabled="true"
                                       placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="userPass">用户密码：</label>
                            <div class="col-md-7">
                                <input id="userPass" name="userPass" type="text" class="form-control required" value="${userEntity.userPass}" disabled="true"
                                       placeholder=""/>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
