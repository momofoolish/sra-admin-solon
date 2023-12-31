package net.cocotea.admin.api.system.model.dto;

import org.noear.solon.validation.annotation.Email;
import org.noear.solon.validation.annotation.NotBlank;
import org.noear.solon.validation.annotation.NotNull;

public class CmsCommentAddDTO {
    @NotBlank(message = "文章id为空")
    private String articleId;
    @NotBlank(message = "回复内容为空")
    private String content;
    /**
     * 回复类型;0文章 1用户
     */
    @NotNull(message = "回复类型为空")
    private Integer replyType;
    @Email(message = "邮箱格式有误")
    private String email;

    public String getArticleId() {
        return articleId;
    }

    public CmsCommentAddDTO setArticleId(String articleId) {
        this.articleId = articleId;
        return this;
    }

    public String getContent() {
        return content;
    }

    public CmsCommentAddDTO setContent(String content) {
        this.content = content;
        return this;
    }

    public Integer getReplyType() {
        return replyType;
    }

    public CmsCommentAddDTO setReplyType(Integer replyType) {
        this.replyType = replyType;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public CmsCommentAddDTO setEmail(String email) {
        this.email = email;
        return this;
    }
}
