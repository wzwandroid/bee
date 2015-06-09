<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="swap" uri="http:/api.demo.com/jstl/swap" %>
<div class="row">
  <div class="col-md-12">
    <div class="widget wgreen">
      <div class="widget-content">
        <div class="panel-group mz-pager-search">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion-searcha" href="#accordion-search-1">
                条件搜索&nbsp;
              </h4>
            </div>
            <div class="panel-collapse collapse in" id="accordion-search-1">
              <div class="panel-body">
                <form action="${pageContext.request.contextPath}/admin/system/testModalPager" method="post" onsubmit="return dialogSearch(this,'.mainbar')">
                  <label>
                    <span>菜单名称：</span>
                    <input type="text"name="menuNameSearch" value="${params['name']}"/>
                  </label>

                  <div class="buttonActive">
                    <button type="submit" class="btn btn-default">搜索</button>
                  </div>

                  <%--<input type="hidden" name="pageSize" value="${pager.pageSize}">--%>
                </form>
              </div>
            </div>
          </div>
        </div>
      <div>
        <table class="table table-striped table-bordered table-hover personAddInOrg">
          <thead>
          <tr class="mz-table-thead">
            <th class="center">
              <label>
                <input class="mz-chk" type="checkbox">
                <span class="mz-lbl"></span>
              </label>
            </th>
            <th>#</th>
            <td  nowrap>菜单名称</td>
            <td  nowrap>请求地址</td>
            <td  nowrap>菜单类型</td>
            <td  nowrap>菜单父类</td>
            <td  nowrap>创建时间</td>
          </tr>
          </thead>
          <tbody class="mzGridTbody">
          <c:set var="rowNum" value="${(params['pager'].pageNo - 1) * params['pager'].pageSize}" />
          <c:forEach items="${params['pager'].result}" var="menuItem">
            <c:set var="rowNum" value="${rowNum + 1}"/>
            <tr target="sid_personId">
              <td class="center">
                <label>
                  <input type="checkbox" class="mz-chk" value="${person.id}">
                  <span class="mz-lbl"></span>
                </label>
              </td>
              <td>${rowNum}</td>
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
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
        <div class="widget-foot">
          <div class="mz-pages" totalCount="${params['pager'].totalCount}" targetType="dialog"
               pageSize="${params['pager'].pageSize}" pageNo="${params['pager'].pageNo}" pageNumShown="10"></div>
        </div>
      </div>
    </div>
  </div>
</div>
