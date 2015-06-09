<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jkjTag" uri="http:/api.demo.com/jstl/swap" %>
<%@ taglib prefix="jkjFn" uri="http://jiankangjin.com/jstl/jkjFn" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bs3-treegrid/css/jquery.treegrid.css">
<!-- Page heading -->
<div class="page-head">
    <!-- Breadcrumb -->
    <div class="bread-crumb pull-left mz-breadcrumb">
        <i class="icon-home mz-home-icon"></i>
        <a href="index.html">首页</a>
        <!-- Divider -->
        <span class="divider">/</span>
        <a href="#" class="">系统管理</a>
        <span class="divider">/</span>
        <a href="#" class="bread-current">商户权限管理</a>
    </div>
    <div class="clearfix"></div>
</div>
<!-- Page heading ends -->
<!-- Matter -->

<div class="matter">
<div class="container">
<!-- Table -->
<div class="widget">
    <div class="widget-content">
        <div class="panel-group mz-pager-search" id="accordion-search">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion-searcha" href="#accordion-search-1">条件搜索</h4>
                </div>
                <div class="panel-collapse collapse in" id="accordion-search-1">
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/admin/merchant/front/permission/listShow" method="post" onsubmit="return tabSearch(this,'.mainbar')">
                            <label>
                                <span>权限名称：</span>
                                <input type="text" name="permNameSearch" value="${params['permName']}">
                            </label>
                             <label>
                                <span>终端类型：</span>
                                 <select name="terType" id="terType" onchange="chengAddShow(this)">
                                    <option value="">==请选择终端类型==</option>
                                    <c:forEach items="${terTypeList}" var="terTypeList">
                                       <option value="${terTypeList['id']}"  <c:if test="${params['terType'] eq terTypeList['id']}"> selected </c:if> >${terTypeList['paramValue'] }</option>
                                    </c:forEach>
                                </select>
                            </label>
                            <div class="buttonActive">
                                <button type="submit" class="btn btn-default">搜索</button>
                            </div>
                            <input type="hidden" name="pageSize" value="${pager.pageSize}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="mz-toolbar">
            <div class="btn-group">
            	<c:set value="" var="padOrwebAdd"/>
						<c:forEach items="${terTypeList }" var="ter">
							<c:if test="${ter.id eq  params['terType'] and ter.paramName eq 'webVersion'}">
								<c:set value="web" var="padOrwebAdd"/>
							</c:if>
							<c:if test="${ter.id eq params['terType'] and ter.paramName eq 'padVersion'}">
								<c:set value="pad" var="padOrwebAdd"/>
							</c:if>
						</c:forEach>
						<jkjTag:permission code="add"
									dependMenuUrl="/admin/merchant/listInit">
									<button class="btn btn-primary" id="webAdd" target="dialog"
										href="${pageContext.request.contextPath}/admin/merchant/front/permission/webAdd"
										width="850" height="350" title="web商户权限新增" <c:if test="${padOrwebAdd eq 'pad' }">style="display: none;"</c:if> >
										<i class="icon-plus"></i> web版新增
									</button>
								</jkjTag:permission>
								<jkjTag:permission code="add"
									dependMenuUrl="/admin/merchant/listInit">
									<button class="btn btn-primary" id="padAdd" target="dialog"
										href="${pageContext.request.contextPath}/admin/merchant/front/permission/padAdd"
										width="850" height="350" title="pad商户权限新增" <c:if test="${padOrwebAdd eq 'web' }">style="display: none;"</c:if>>
										<i class="icon-plus"></i> pad版新增
									</button>
								</jkjTag:permission>
						<jkjTag:permission code="edit" dependMenuUrl="/admin/merchant/listInit">
                    <button class="btn btn-info" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/permission/merPerm/{sid_permId}"
                            width="850" height="350" title="商户权限修改" warn="请选择商户" rel=""><i class="icon-edit"></i>修改</button>
                </jkjTag:permission>
                <jkjTag:permission code="show" dependMenuUrl="/admin/merchant/listInit">
                    <button class="btn btn-default" target="dialog" href="${pageContext.request.contextPath}/admin/merchant/front/permission/show/{sid_permId}"
                            width="850" height="350" title="商户权限查看" warn="请选择商户" formSubmit="false"><i class="icon-edit"></i> 详细查看</button>
                </jkjTag:permission>
                    <button class="btn btn-danger mz-delete" target="oneRecordDeleted" href="${pageContext.request.contextPath}/admin/merchant/front/permission/deleteIds?ids={sid_permId}"
                            delIds="ids" title="确定要删除？" warn="请选择要删除的应用"><i class="icon-remove"></i> 删除</button>
					<button class="btn btn-danger" target="moreRecoredDeleted" href="${pageContext.request.contextPath}/admin/merchant/front/permission/deleteIds"
                            title="确定要删除?" warn="请选择要删除的应用" rel="ids"><i class="icon-remove"></i>批量删除 </button>

            </div>
            <div class="clearfix"></div>
        </div>
        <div class="tableScroller">
            <table class="table table-striped table-bordered table-hover" >
                <thead>
                <tr class="mz-table-thead">
                    <th class="center" >
                        <label>
                            <input class="mz-chk" type="checkbox">
                            <span class="mz-lbl"></span>
                        </label>
                    </th>
                    <th>#</th>
                    <th>权限代码</th>
                    <th>权限名称</th>
                    <th>权限所属菜单</th>
                    <th>终端类型</th>
                </tr>
                </thead>
                <tbody class="mzGridTbody">
                <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
                <c:forEach items="${params['pager'].result}" var="perm">
                    <c:set var="rowNum" value="${rowNum + 1}"/>
                    <tr target="sid_permId" rel="${perm.id}">
                        <td class="center">
                            <label>
                                <input type="checkbox" class="mz-chk" value="${perm.id}" name="ids">
                                <span class="mz-lbl"></span>
                            </label>
                        </td>
                        <td>${rowNum}</td>
                        <td>${perm.permCode}</td>
                        <td>${perm.permName}</td>
                        <td>${perm.merMenuInfoName}</td>
                        <td>
                             <c:forEach items="${terTypeList}" var="terType">
                             <c:if test="${terType.id eq perm.terType}">
                              ${terType.paramValue}
                              </c:if>
							</c:forEach>
						</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="widget-foot">
            <div class="mz-pages" totalCount="${params['pager'].totalCount}"  pageSize="${params['pager'].pageSize}" pageNo="${params['pager'].pageNo}" pageNumShown="10"></div>
        </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
  function chengAddShow(terT){
	  if   (terT.options[terT.selectedIndex].value==428)   {
		  $("#padAdd").hide();
		  $("#webAdd").show();
	  }else{
		  $("#webAdd").hide();
		  $("#padAdd").show();
	  }
	  
  }



</script>




