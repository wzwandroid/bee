//package com.bee.dba.entity;
//
//import java.io.Serializable;
//
///**
// * 菜单配置
// * Created by mzllon on 2014/8/1.
// */
//public class MenuItemConfEntity implements Serializable{
//    public static final String MENU_ITEM_CONF_OPERATE_TYPE = "menu_item_conf.operate_type";
//    public static final String ADDED_NO_SYNC = "addedNoSync";//新增未同步数据
//    public static final String UPDATED_NO_SYNC = "updatedNoSync";//更新未同步数据
//    public static final String DELETED_NO_SYNC = "deletedNoSync";//删除未同步数据
//    public static final String SYNC = "sync";//已同步
//    public static final String NOT_SYNC = "notSync";//禁止同步
//
//    public static final String MENU_ITEM_CONF_STATUS = "menu_item_conf.status";
//    public static final String NORMAL = "normal"; //记录正常
//    public static final String DISABLED = "disabled"; //记录禁用
//    public static final String DELETED = "deleted";//记录已删除
//
//    private Integer id;
//
//    private String name;
//
//    private String href;
//
//    private String target;
//
//    private Character mask;
//
//    private Integer width = null;
//
//    private Integer height = null;
//
//    private Integer parentId;
//
//    private String parentName;
//
//    private Integer sort;
//
//    private Integer collapse;
//
//    private String iconClassName;
//
//    private String createTime; //length = 14
//
//    private String createId;
//
//    private String createPersonName;
//
//    /** 操作类型：1新增未同步、2更新未同步、3删除未同步，0已同步*/
//    //注意当删除未同步变为已同步时，如果业务要求真实删除直接删除记录，否则就是逻辑删除，同时状态变为已同步
//    private Integer operateType;
//
//    /** 记录状态：1正常，0已删除 */
//    private Integer status;
//
//    public MenuItemConfEntity() {
//    }
//
//    public MenuItemConfEntity(Integer id, String name) {
//        this.id = id;
//        this.name = name;
//    }
//
//    public Integer getId() {
//        return id;
//    }
//
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getHref() {
//        return href;
//    }
//
//    public void setHref(String href) {
//        this.href = href;
//    }
//
//    public String getTarget() {
//        return target;
//    }
//
//    public void setTarget(String target) {
//        this.target = target;
//    }
//
//    public Character getMask() {
//        return mask;
//    }
//
//    public void setMask(Character mask) {
//        this.mask = mask;
//    }
//
//    public Integer getWidth() {
//        return width;
//    }
//
//    public void setWidth(Integer width) {
//        this.width = width;
//    }
//
//    public Integer getHeight() {
//        return height;
//    }
//
//    public void setHeight(Integer height) {
//        this.height = height;
//    }
//
//    public Integer getParentId() {
//        return parentId;
//    }
//
//    public void setParentId(Integer parentId) {
//        this.parentId = parentId;
//    }
//
//    public Integer getSort() {
//        return sort;
//    }
//
//    public void setSort(Integer sort) {
//        this.sort = sort;
//    }
//
//    public String getParentName() {
//        return parentName;
//    }
//
//    public void setParentName(String parentName) {
//        this.parentName = parentName;
//    }
//
//    public Integer getCollapse() {
//        return collapse;
//    }
//
//    public void setCollapse(Integer collapse) {
//        this.collapse = collapse;
//    }
//
//    public String getIconClassName() {
//        return iconClassName;
//    }
//
//    public void setIconClassName(String iconClassName) {
//        this.iconClassName = iconClassName;
//    }
//
//    public String getCreateTime() {
//        return createTime;
//    }
//
//    public void setCreateTime(String createTime) {
//        this.createTime = createTime;
//    }
//
//    public String getCreateId() {
//        return createId;
//    }
//
//    public void setCreateId(String createId) {
//        this.createId = createId;
//    }
//
//    public String getCreatePersonName() {
//        return createPersonName;
//    }
//
//    public void setCreatePersonName(String createPersonName) {
//        this.createPersonName = createPersonName;
//    }
//
//    public Integer getStatus() {
//        return status;
//    }
//
//    public void setStatus(Integer status) {
//        this.status = status;
//    }
//
//    public Integer getOperateType() {
//        return operateType;
//    }
//
//    public void setOperateType(Integer operateType) {
//        this.operateType = operateType;
//    }
//
//    @Override
//    public String toString() {
//        final StringBuilder sb = new StringBuilder("MenuItemConfEntity{");
//        sb.append("id=").append(id);
//        sb.append(", name='").append(name).append('\'');
//        sb.append(", href='").append(href).append('\'');
//        sb.append(", target='").append(target).append('\'');
//        sb.append(", mask=").append(mask);
//        sb.append(", width=").append(width);
//        sb.append(", height=").append(height);
//        sb.append(", parentId=").append(parentId);
//        sb.append(", parentName='").append(parentName).append('\'');
//        sb.append(", sort=").append(sort);
//        sb.append(", collapse=").append(collapse);
//        sb.append(", iconClassName='").append(iconClassName).append('\'');
//        sb.append(", createTime='").append(createTime).append('\'');
//        sb.append(", createId='").append(createId).append('\'');
//        sb.append(", createPersonName='").append(createPersonName).append('\'');
//        sb.append(", operateType=").append(operateType);
//        sb.append(", status=").append(status);
//        sb.append('}');
//        return sb.toString();
//    }
//}
