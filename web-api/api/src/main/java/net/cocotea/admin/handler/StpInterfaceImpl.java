package net.cocotea.admin.handler;

import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import net.cocotea.admin.common.properties.DevEnableProperties;
import net.cocotea.admin.api.system.model.vo.SysMenuVO;
import net.cocotea.admin.api.system.model.vo.SysRoleVO;
import net.cocotea.admin.api.system.service.SysMenuService;
import net.cocotea.admin.api.system.service.SysRoleService;
import net.cocotea.admin.common.enums.IsEnum;
import org.noear.solon.annotation.Component;
import org.noear.solon.annotation.Inject;

import java.util.ArrayList;
import java.util.List;

/**
 * 获取用户权限集合
 *
 * @author jwss
 * @date 2022-1-17 16:06:44
 */
@Component
public class StpInterfaceImpl implements StpInterface {
    @Inject
    private SysMenuService menuService;
    @Inject
    private SysRoleService roleService;
    @Inject
    private DevEnableProperties devEnableProperties;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        StpUtil.checkLogin();
        List<SysMenuVO> cachePermissionList = menuService.getCachePermission((String) loginId);
        List<String> list;
        // 1关闭了缓存 2缓存失效了 3有缓存
        if (!devEnableProperties.getPermissionCache()) {
            List<SysMenuVO> menuList = menuService.listByUserId(IsEnum.N.getCode());
            list = new ArrayList<>(menuList.size());
            menuList.forEach(item -> list.add(item.getPermissionCode()));
        } else if (cachePermissionList == null) {
            List<SysMenuVO> permission = menuService.cachePermission((String) loginId);
            list = new ArrayList<>(permission.size());
            permission.forEach(i -> list.add(i.getPermissionCode()));
        } else {
            list = new ArrayList<>(cachePermissionList.size());
            cachePermissionList.forEach(i -> list.add(i.getPermissionCode()));
        }
        return list;
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        StpUtil.checkLogin();
        List<SysRoleVO> roles = roleService.loadByUserId((String) loginId);
        List<String> roleKeys = new ArrayList<>(roles.size());
        for (SysRoleVO role : roles) {
            roleKeys.add(role.getRoleKey());
        }
        return roleKeys;
    }
}
