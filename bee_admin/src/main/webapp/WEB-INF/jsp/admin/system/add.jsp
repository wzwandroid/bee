<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
<div class="col-md-12">
    <div class="widget wgreen">
        <div class="widget-content">
<hr>
            <form action="${pageContext.request.contextPath}/admin/system/add" onsubmit="return validateForm(this,dialogAjaxDone)"
                      role="form" method="post" class="required-validate">

                    <!-- 商户基本信息 merInfo-->
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="parentIdAdd">上级菜单：</label>
                                <div class="col-md-7">
                                    <select name="parentId" id="parentIdAdd" class="form-control required" onchange="showHref('parentIdAdd','hrefDiv','0')">
                                        <option value="0">顶级菜单</option>
                                        <c:if test="${not empty allParentMenus}">
                                            <c:forEach var="parentMenu" items="${allParentMenus}">
                                                <option value="${parentMenu.id}">${parentMenu.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="name">菜单名称：</label>

                                <div class="col-md-7">
                                    <input id="name" name="name" type="text" class="form-control required"
                                              placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group" id="hrefDiv" >
                                <label class="col-md-5 control-label" for="href">地址：</label>

                                <div class="col-md-7">
                                    <input id="href" name="href" type="text" class="form-control required"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="targetAdd">跳转方式：</label>

                                <div class="col-md-7">
                                    <select id="targetAdd" name="target" class="form-control required" onchange="showModalAttr('targetAdd','modalAttrDiv','dialog')">
                                        <option value="">......</option>
                                        <option value="tab">本身</option>
                                        <option value="dialog">弹出框</option>
                                    </select>
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="col-md-5 control-label" for="collapse">是否默认展开：</label>

                                <div class="col-md-7">
                                    <select id="collapse" name="collapse" class="form-control required">
                                        <option value="0">是</option>
                                        <option value="1">否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="sort">序号：</label>

                                <div class="col-md-7">
                                    <input id="sort" name="sort" type="text" class="form-control digits"
                                           placeholder=""/>
                                </div>
                            </div>
                            <div id="modalAttrDiv" style="display: none">
                                <div class="form-group">
                                    <label class="col-md-5 control-label" for="mask">是否遮罩：</label>

                                    <div class="col-md-7">
                                        <select id="mask" name="mask" class="form-control required">
                                            <option value="">......</option>
                                            <option value="0">是</option>
                                            <option value="1">否</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label" for="width">宽度：</label>

                                    <div class="col-md-7">
                                        <input id="width" name="width" type="text" class="form-control"
                                               placeholder=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label" for="height">高度：</label>

                                    <div class="col-md-7">
                                        <input id="height" name="height" type="text" class="form-control"
                                               placeholder=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-5 control-label" for="iconClassName">样式类名：</label>

                                    <div class="col-md-7">
                                        <input id="iconClassName" name="iconClassName" type="text" class="form-control"
                                               placeholder=""/>
                                    </div>
                                </div>
                            </div>
                        </div>
            </form>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    $(function(){
        if(document.getElementById("modalAttrDiv") != null){
            showHref('parentIdAdd','hrefDiv','0');
            showModalAttr('targetAdd','modalAttrDiv','dialog')
        }
    })
</script>