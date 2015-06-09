<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <hr>
                <sf:form action="${pageContext.request.contextPath}/admin/merchant/front/menu/update"
                         modelAttribute="merMenuInfoEntity"
                         onsubmit="return validateForm(this,dialogAjaxDone,null,null)" class="required-validate"
                         role="form" method="post">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-5 control-label" for="type">菜单类型：</label>

                        <div class="col-md-7">
                            <select name="type" id="type" class="form-control required">
                                <option value="">请选择菜单类型</option>
                                <c:forEach items="${menuTypes}" var="mt">
                                    <option value="${mt.key}" <c:if test="${mt.key eq merMenuInfoEntity.type}">selected="selected" </c:if>>${mt.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            <label class="col-md-5 control-label" for="lvl">菜单等级：</label>

                            <div class="col-md-7">
                                <sf:select path="lvl" id="lvl" cssClass="form-control required">
                                    <sf:option value="">请选择菜单等级</sf:option>
                                    <sf:option value="${lvlOne.id}">${lvlOne.paramValue}</sf:option>
                                    <sf:option value="${lvlSecond.id}">${lvlSecond.paramValue}</sf:option>
                                    <sf:option value="${lvlThird.id}">${lvlThird.paramValue}</sf:option>
                                </sf:select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            <label class="col-md-5 control-label" for="pId">父菜单：</label>
                            <div class="col-md-7">
                                <sf:select path="pId" id="pId" cssClass="form-control">
                                    <sf:option value="">请选择父菜单</sf:option>
                                    <sf:options itemLabel="name" itemValue="id" items="${allMenus}"/>
                                </sf:select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-5 control-label" for="name">菜单名称：</label>

                        <div class="col-md-7">
                            <sf:hidden path="id"/>
                            <sf:input path="name" id="name" cssClass="form-control required" placeholder="请输入菜单名称"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-5 control-label" for="href">请求地址：</label>

                        <div class="col-md-7">
                            <sf:textarea path="href" id="href" cssClass="form-control" placeholder="请输入请求地址"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-5 control-label" for="iconClassName">CSS样式名：</label>

                        <div class="col-md-7">
                            <sf:input path="iconClassName" id="iconClassName" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-5 control-label" for="sort">菜单顺序：</label>

                        <div class="col-md-7">
                            <sf:input path="sort" id="sort" cssClass="form-control"/>
                        </div>
                    </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>
</div>
