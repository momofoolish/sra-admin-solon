package net.cocotea.admin.system.param.file;

import net.cocotea.admin.system.vo.SysFileVO;
import org.noear.solon.validation.annotation.NotNull;
import org.sagacity.sqltoy.model.Page;
import com.alibaba.fastjson.JSONObject;
import java.io.Serializable;

public class SysFilePageParam extends Page<SysFileVO> implements Serializable {
    private static final long serialVersionUID = -1L;

    @NotNull(message = "sysFile is null")
    private SysFileVO sysFile;

    public SysFileVO getSysFile() {
        return sysFile;
    }

    public SysFilePageParam setSysFile(SysFileVO sysFile) {
        this.sysFile = sysFile;
        return this;
    }

    @Override
    public String toString() {
        return JSONObject.toJSONString(this);
    }
}