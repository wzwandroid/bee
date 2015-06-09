<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function(){
        var options = {
            currentPage : ${params['pager'].pageNo},
            totalPages : ${params['pager'].pageCount},
            onPageClicked: function(e,originalEvent,type,page){
                $("#pageNo").val(page);
                document.forms[0].submit();
            },
            itemContainerClass: function (type, page, current) {
                return (page === current) ? "active" : "pointer-cursor";
            }
        }
        if(options.totalPages > 1){
            $('#pager').bootstrapPaginator(options);
        }

    })
</script>



<div style="position:relative;">
    <%--<div style="position:absolute;top:0;right:0;"><span style="font-size:17px;margin:0 40px;">
      交易总金额：<em style="color: green;"></em>元</span></div>--%>

    <div id="pagerInfo" style="margin:5px 0px; text-align:center;background-color:#FFFFFF;color:blue;">
        共${params['pager']['totalCount']}条记录,每页${params['pager']['pageSize']}条,共${params['pager'].pageCount}页
        <span id="pager" style="margin: 0"></span>
    </div>
</div>
