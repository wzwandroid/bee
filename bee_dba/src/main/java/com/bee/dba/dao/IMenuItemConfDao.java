//package com.bee.dba.dao;
//
//
//
//import com.demo.dba.dao.base.IBaseDao;
//import com.demo.dba.entity.MenuItemConfEntity;
//
//import java.util.List;
//import java.util.Map;
//
///**
// * 菜单项管理service
// * Created by mzllon on 2014/09/11.
// */
//public interface IMenuItemConfDao extends IBaseDao<MenuItemConfEntity, Integer> {
//
//    List<MenuItemConfEntity> getAllParentMenus();
//
//    List<MenuItemConfEntity> getSubMenusByParentId(Integer parentId);
//
//    List<MenuItemConfEntity> getContainSubParentMenus();
//
//    List<MenuItemConfEntity> listMenuItemsFilterPermission(List<Integer> menuItemPermissionCodes);
//
//    /**
//     * 查询那些正常启用的、超链接不是为null（说明是是实实在在可用的菜单项）并且存在操作权限的菜单项
//     *
//     * @param params 查询条件
//     * @return 菜单项列表
//     */
//    List<MenuItemConfEntity> listByEnable$HrefIsNotNull$ExistsPerm(Map<String, Object> params);
//
//    /**
//     * 根据状态和操作类型查询菜单项列表
//     *
//     * @param params 查询条件
//     */
//    List<MenuItemConfEntity> listModuleByStatusAndOperateType(Map<String, Object> params);
//
//    /**
//     * 将菜单项的操作类型改为已同步
//     */
//    void updateOperateTypeAsSync(Map<String, Object> params);
//}
