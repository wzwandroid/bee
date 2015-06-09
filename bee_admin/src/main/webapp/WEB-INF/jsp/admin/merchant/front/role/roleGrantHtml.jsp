<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="jkjFn" uri="http:/api.demo.com/jstl/swap" %>
<div class="row">
    <div class="col-md-12">
        <div class="widget wgreen">
            <div class="widget-content">
                <ul class="mtree" data-nodes='${jkjFn:toJSON(roleGrant)}' data-chk-style="true"
                    data-multi-select="true" data-check-parent="true" data-cb-check="roleGrantCheck"
                    data-cb-before-click="roleGrantBeforeClick"></ul>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/admin/merchant/front/role/roleGrant/${role.id}" method="post"
          onsubmit="return validateForm(this,dialogAjaxDone,null,null)">
        <input type="hidden" name="addedPerm" value="" id="addedPerm-role">
        <input type="hidden" name="removedPerm" value="" id="removedPerm-role">
    </form>
</div>
<script>
    function roleGrantCheck(event,treeId,treeNode) {
        console.info(treeId);
        console.info(treeNode);
        var $ztree = $.fn.zTree.getZTreeObj(treeId);
        var id = treeNode.id,idx = id.indexOf('qx_');
        console.info(id, idx);
        if(idx!=-1){
            var parentNode = treeNode.getParentNode();
            if(treeNode.diyData.dependId != null) {
                alert(111);
                if(treeNode.checked == false) {
                    var siblingsNode = parentNode.children;
                    if(siblingsNode.length>0) {
                        for(var i = 0,len=siblingsNode.length;i<len;i++) {
                            $ztree.checkNode(siblingsNode[i], false, true, false);
                        }
                    }
                }
            } else {
                if(treeNode.checked) {
                    var dependedNode = $ztree.getNodeByParam('id', 'qx_'+treeNode.diyData.dependId, parentNode);
                    $ztree.checkNode(dependedNode, true, true, false);
                }
            }
        }
        //添加到隐藏域中
        var nodes = $ztree.getCheckedNodes(true),node,va="",vr="";
        for(i= 0,len=nodes.length;i<len;i++) {
            node = nodes[i];
            id=node.id;
            idx = id.indexOf('qx_');
            if(idx ==0) {
                if(!node.diyData.checked) {
                    va += id.substring(3) + ',';
                }
            }
        }
        nodes = $ztree.getCheckedNodes(false);
        for(i=0,len=nodes.length;i<len;i++) {
            node = nodes[i];
            id=node.id;
            idx = id.indexOf('qx_');
            if(idx ==0) {
                if(node.diyData.checked) {
                    vr += id.substring(3) + ',';
                }
            }
        }
        if(va.length >0) va = va.substring(0, va.length - 1);
        if(vr.length >0) vr = vr.substring(0, vr.length - 1);
        var removedPerm = $('#removedPerm-role'), addedPerm = $('#addedPerm-role');
        addedPerm.val(va);
        removedPerm.val(vr);
    }
    function roleGrantBeforeClick(treeId,treeNode) {
        var $zTree = $.fn.zTree.getZTreeObj(treeId);
        $zTree.checkNode(treeNode, !treeNode.checked, true, true);
        return false;
    }
</script>

