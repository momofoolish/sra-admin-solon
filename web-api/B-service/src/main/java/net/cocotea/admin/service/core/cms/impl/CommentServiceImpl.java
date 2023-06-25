package net.cocotea.admin.service.core.cms.impl;

import net.cocotea.admin.service.dto.cms.comment.CommentAddParam;
import net.cocotea.admin.service.dto.cms.comment.CommentPageParam;
import net.cocotea.admin.service.dto.cms.comment.CommentUpdateParam;
import net.cocotea.admin.data.model.CmsComment;
import net.cocotea.admin.service.vo.cms.CommentVO;
import net.cocotea.admin.service.core.cms.ICommentService;
import net.cocotea.admin.common.enums.DeleteStatusEnum;
import net.cocotea.admin.common.enums.ReplyTypeEnum;
import net.cocotea.admin.common.model.BusinessException;
import org.noear.solon.aspect.annotation.Service;
import org.noear.solon.extend.sqltoy.annotation.Db;
import org.sagacity.sqltoy.dao.SqlToyLazyDao;
import org.sagacity.sqltoy.model.Page;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CommentServiceImpl implements ICommentService {
    @Db
    private SqlToyLazyDao sqlToyLazyDao;

    @Override
    public boolean add(CommentAddParam param) throws BusinessException {
        CmsComment comment = new CmsComment();
        comment.setParentId(String.valueOf(0))
                .setArticleId(param.getArticleId())
                .setDeleteStatus(DeleteStatusEnum.NOT_DELETE.getCode())
                .setCreateTime(LocalDateTime.now())
                .setContent(param.getContent())
                .setCreateBy(param.getEmail())
                .setReplyType(ReplyTypeEnum.ARTICLE.getCode());
        return sqlToyLazyDao.save(comment) != null;
    }

    @Override
    public boolean deleteBatch(List<String> idList) throws BusinessException {
        List<CmsComment> comments = new ArrayList<>(idList.size());
        idList.forEach(item -> comments.add(new CmsComment().setId(item).setDeleteStatus(DeleteStatusEnum.DELETE.getCode())));
        Long all = sqlToyLazyDao.updateAll(comments);
        return all > 0;
    }

    @Override
    public boolean update(CommentUpdateParam param) throws BusinessException {
        return false;
    }

    @Override
    public Page<CommentVO> listByPage(CommentPageParam param) throws BusinessException {
        Page<CommentVO> page = sqlToyLazyDao.findPageBySql(param, "cms_comment_findByPageParam", param.getCommentVo());
        return page;
    }

    @Override
    public boolean delete(String id) throws BusinessException {
        return false;
    }

    @Override
    public List<CommentVO> listByArticleId(String articleId) {
        List<CommentVO> list = sqlToyLazyDao.findBySql("cms_comment_findByEntityParam", new CommentVO().setArticleId(articleId));
        return list;
    }
}