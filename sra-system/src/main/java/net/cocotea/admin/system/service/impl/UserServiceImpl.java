package net.cocotea.admin.system.service.impl;

import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import net.cocotea.admin.system.properties.DefaultProperties;
import net.cocotea.admin.common.enums.IsEnum;
import net.cocotea.admin.common.model.BusinessException;
import net.cocotea.admin.common.util.GenerateDsUtils;
import net.cocotea.admin.common.util.SecurityUtils;
import net.cocotea.admin.framework.constant.RedisKey;
import net.cocotea.admin.framework.service.IRedisService;
import net.cocotea.admin.system.entity.User;
import net.cocotea.admin.system.entity.UserRole;
import net.cocotea.admin.system.param.user.UserAddParam;
import net.cocotea.admin.system.param.login.LoginParam;
import net.cocotea.admin.system.param.user.UserPageParam;
import net.cocotea.admin.system.param.user.UserUpdateParam;
import net.cocotea.admin.system.properties.DevEnableProperties;
import net.cocotea.admin.system.service.IMenuService;
import net.cocotea.admin.system.service.IUserService;
import net.cocotea.admin.system.vo.LoginUserVO;
import net.cocotea.admin.system.vo.MenuVO;
import net.cocotea.admin.system.vo.UserVO;
import net.cocotea.admin.common.enums.DeleteStatusEnum;
import net.cocotea.admin.common.enums.LogTypeEnum;
import net.cocotea.admin.system.service.IOperationLogService;
import org.noear.solon.annotation.Inject;
import org.noear.solon.aspect.annotation.Service;
import org.noear.solon.core.handle.Context;
import org.noear.solon.data.annotation.Tran;
import org.noear.solon.extend.sqltoy.annotation.Db;
import org.sagacity.sqltoy.dao.SqlToyLazyDao;
import org.sagacity.sqltoy.model.EntityQuery;
import org.sagacity.sqltoy.model.Page;
import org.sagacity.sqltoy.utils.StringUtil;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author jwss
 * @date 2022-1-12 15:35:00
 */
@Service
public class UserServiceImpl implements IUserService {
    private final GenerateDsUtils<MenuVO> dsUtils = new GenerateDsUtils<>();

    @Inject
    private DevEnableProperties devEnableProperties;
    @Inject
    private DefaultProperties defaultProperties;
    @Db
    private SqlToyLazyDao sqlToyLazyDao;
    @Inject
    private IMenuService menuService;
    @Inject
    private IRedisService redisService;
    @Inject
    private IOperationLogService operationLogService;

    @Tran
    @Override
    public boolean add(UserAddParam param) {
        User user = sqlToyLazyDao.convertType(param, User.class);
        if (StringUtil.isNotBlank(param.getPassword())) {
            user.setPassword(SecurityUtils.buildMd5Pwd(param.getPassword(), defaultProperties.getSalt()));
        } else {
            user.setPassword(defaultProperties.getPassword());
        }
        Object userId = sqlToyLazyDao.save(user);
        // 授予用户角色
        if (!(param.getRoleIds().isEmpty())) {
            for (String roleId : param.getRoleIds()) {
                UserRole userRole = new UserRole().setUserId(String.valueOf(userId)).setRoleId(roleId);
                sqlToyLazyDao.save(userRole);
            }
        }
        return userId != null;
    }

    @Tran
    @Override
    public boolean update(UserUpdateParam param) {
        User user = sqlToyLazyDao.convertType(param, User.class);
        if (!(param.getRoleIds() == null || param.getRoleIds().isEmpty())) {
            sqlToyLazyDao.deleteByQuery(UserRole.class, EntityQuery.create().where("USER_ID=:userId").names("userId").values(param.getId()));
            // 删除用户角色再新增
            sqlToyLazyDao.deleteByQuery(
                    UserRole.class,
                    EntityQuery.create().where("USER_ID = :userId").names("userId").values(param.getId())
            );
            for (String roleId : param.getRoleIds()) {
                UserRole userRole = new UserRole().setUserId(param.getId()).setRoleId(roleId);
                sqlToyLazyDao.save(userRole);
            }
        }
        // 更新密码
        if (StringUtil.isNotBlank(param.getPassword())) {
            user.setPassword(SecurityUtils.buildMd5Pwd(param.getPassword(), defaultProperties.getSalt()));
        }
        Long flag = sqlToyLazyDao.update(user);
        return flag > 0;
    }

    @Tran
    @Override
    public boolean delete(String id) {
        // 删除用户
        User user = new User().setId(id).setDeleteStatus(DeleteStatusEnum.DELETE.getCode());
        Long aLong = sqlToyLazyDao.update(user);
        // 删除用户关联关系
        sqlToyLazyDao.deleteByQuery(UserRole.class, EntityQuery.create().where("USER_ID=:userId").names("userId").values(user.getId()));
        return aLong > 0;
    }

    @Override
    public boolean deleteBatch(List<String> idList) {
        if (idList != null) {
            idList.forEach(this::delete);
        }
        return idList != null && idList.size() > 0;
    }

    @Override
    public Page<UserVO> listByPage(UserPageParam param) {
        Page<UserVO> page = sqlToyLazyDao.findPageBySql(
                param,
                "system_user_findByPageParam",
                param.getUser()
        );
        return page;
    }

    @Override
    public LoginUserVO login(LoginParam param) throws BusinessException {
        User user;
        // 判断是否启用了强密码
        if (StringUtil.isBlank(devEnableProperties.getStrongPassword()) || !devEnableProperties.getStrongPassword().equals(param.getPassword())) {
            // 校验验证码
            String code = redisService.get(String.format(RedisKey.VERIFY_CODE, "LOGIN", Context.current().realIp()));
            if (!param.getCaptcha().equals(code)) {
                throw new BusinessException("验证码错误");
            }
            // 校验密码
            user = sqlToyLazyDao.convertType(param, User.class);
            user.setPassword(SecurityUtils.buildMd5Pwd(param.getPassword(), defaultProperties.getSalt()));
            user = sqlToyLazyDao.loadBySql("system_user_findByEntityParam", user);
            if (user == null) {
                throw new BusinessException("登录失败，用户名或密码错误");
            }
        } else {
            user = sqlToyLazyDao.loadBySql("system_user_findByEntityParam", new User().setUsername(param.getUsername()));
        }
        // 记住我模式
        if (param.getRememberMe()) {
            StpUtil.login(
                    user.getId(),
                    new SaLoginModel().setTimeout(3600 * 24 * 31)
            );
        } else {
            StpUtil.login(user.getId());
        }
        // 更新用户登录时间和ip
        User loginUser = new User();
        loginUser.setId(user.getId());
        loginUser.setLastLoginIp(Context.current().realIp());
        loginUser.setLastLoginTime(LocalDateTime.now());
        sqlToyLazyDao.update(loginUser);
        // 缓存权限
        menuService.cachePermission(user.getId());
        // 保存登录日志
        operationLogService.saveByLogType(LogTypeEnum.LOGIN.getCode());
        return setLoginUser(user);
    }

    @Override
    public UserVO getDetail() {
        UserVO userVO = new UserVO();
        userVO.setId(String.valueOf(StpUtil.getLoginId()));
        return sqlToyLazyDao.loadBySql("system_user_findByEntityParam", userVO);
    }

    @Override
    public LoginUserVO loginUser() {
        User user = sqlToyLazyDao.loadBySql(
                "system_user_findByEntityParam",
                new User().setId(String.valueOf(StpUtil.getLoginId()))
        );
        return setLoginUser(user);
    }

    private LoginUserVO setLoginUser(User user) {
        LoginUserVO loginUserVO = new LoginUserVO();
        loginUserVO.setMenuList(new ArrayList<>(
                dsUtils.buildTreeDefault(menuService.listByUserId(IsEnum.Y.getCode())).values()
        ));
        loginUserVO.setUsername(user.getUsername());
        loginUserVO.setAvatar(user.getAvatar());
        loginUserVO.setId(user.getId());
        loginUserVO.setLoginStatus(true);
        loginUserVO.setToken(StpUtil.getTokenValue());
        return loginUserVO;
    }
}