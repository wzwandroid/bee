<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
<div class="col-md-12">
    <div class="widget wgreen">
        <div class="widget-content">
<hr>
            <form action="${pageContext.request.contextPath}/function/test/download/add"
                  <%--onsubmit="return uploadForm(this,dialogAjaxDone,null,null,'fileInfo')"--%>
                       method="post" class="required-validate" enctype="multipart/form-data">
                <%--ajax 上传文件目前有误 找不到multipartFile 故目前用扑通方法--%>

                    <!-- 商户基本信息 merInfo-->
                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-md-5 control-label" for="fileInfo">请选择文件：</label>

                                <div class="col-md-7">
                                    <input type="file" name="fileInfo" id="fileInfo" />
                                </div>
                            </div>

                            </div>
            </form>
        </div>
    </div>
</div>
</div>
