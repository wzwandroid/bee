<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/uploadify/uploadify.css">
<script src="${pageContext.request.contextPath}/resources/uploadify/jquery.uploadify.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/uploadify/mz.upload.js"></script>
<div class="row">
<div class="col-md-12">
    <div class="widget wgreen">
        <div class="widget-content">
            <hr>
            <form action="${pageContext.request.contextPath}/admin/merchant/front/operUserInfo/add" onsubmit="return validateForm(this,dialogAjaxDone,null,null)"
                     role="form" method="post" class="required-validate">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="fileupload">选择Excel文件：</label>
                                <div class="col-md-7">
                                    <input id="fileupload" class="form-control" type="file">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="importBatchName">导入批次名称：</label>
                                <div class="col-md-7">
                                    <input id="importBatchName" class="form-control required"type="text" name="importBatchName">
                                </div>
                            </div>
                        </div>
            </form>
        </div>
    </div>
</div>
</div>