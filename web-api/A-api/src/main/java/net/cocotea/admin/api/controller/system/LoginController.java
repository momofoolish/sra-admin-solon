package net.cocotea.admin.api.controller.system;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import net.cocotea.admin.common.constant.RedisKey;
import net.cocotea.admin.common.model.ApiResult;
import net.cocotea.admin.common.model.BusinessException;
import net.cocotea.admin.common.service.IRedisService;
import net.cocotea.admin.model.system.dto.login.CaptchaParam;
import net.cocotea.admin.model.system.dto.login.LoginParam;
import net.cocotea.admin.model.system.vo.LoginUserVO;
import net.cocotea.admin.service.system.IUserService;
import org.noear.solon.annotation.*;
import org.noear.solon.core.handle.Context;

/**
 * @author CoCoTea
 */
@Controller
@Mapping("/system")
public class LoginController {
    @Inject
    private IUserService userService;

    @Inject
    private IRedisService redisService;

    @Mapping("/login")
    public ApiResult<?> login(@Body LoginParam param) throws BusinessException {
        LoginUserVO r = userService.login(param);
        return ApiResult.ok(r);
    }

    @Mapping("/logout")
    public ApiResult<String> logout() {
        if ( StpUtil.isLogin() ) {
            // 删除权限缓存
            redisService.delete(String.format(RedisKey.USER_PERMISSION, StpUtil.getLoginId()));
            redisService.delete(String.format(RedisKey.ONLINE_USER, StpUtil.getLoginId()));
            StpUtil.logout();
        }
        return ApiResult.ok();
    }

    @Get
    @Mapping("/loginInfo")
    @SaCheckLogin
    public ApiResult<?> userInfo() {
        LoginUserVO r = userService.loginUser();
        return ApiResult.ok(r);
    }

    @Mapping("/captcha")
    public ApiResult<String> captcha(@Body CaptchaParam param) {
        // 生成圆圈干扰的验证码
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(200, 100, 4, 20);
        redisService.save(
                String.format(RedisKey.VERIFY_CODE, param.getCodeType(), Context.current().realIp()),
                captcha.getCode(),
                300L
        );
        return ApiResult.ok(captcha.getImageBase64());
    }
}
