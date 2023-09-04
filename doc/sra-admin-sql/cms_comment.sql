create table cms_comment
(
    ID            varchar(32)  not null comment '主键id'
        primary key,
    ARTICLE_ID    varchar(32)  not null comment '文章ID',
    PARENT_ID     varchar(32)  not null comment '父级ID',
    REPLY_USER_ID varchar(32)  null comment '回复用户ID',
    CONTENT       varchar(500) not null comment '回复内容',
    REPLY_TYPE    char         null comment '回复类型;0文章 1用户',
    CREATE_BY     varchar(32)  not null comment '创建人',
    CREATE_TIME   datetime     not null comment '创建时间',
    UPDATE_BY     varchar(32)  null comment '更新人',
    UPDATE_TIME   datetime     null comment '更新时间',
    DELETE_STATUS tinyint      not null comment '删除状态;0删除 1未删除',
    REVISION      int          null comment '乐观锁'
)
    comment '评论主表';

INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('06dab667a7ac405fb74720b5695f3d4c', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '使先干包别原局强油准标府见解四可给。', '0', 's.smtdlz@byjdtbopnq.sj', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('1931c32c7e0a4fc9945484a2969d131e', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '深直济白选之程主压层维放争。', '0', 'g.avyr@erpwjgu.ph', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('1c0706efab404da68cfea2c47541b1d2', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '马动世不候见它现知面今六路。', '0', 'y.veylers@cxz.pro', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('21fc1b86a48148c094ed52bc20c7eaa0', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '此次突发山洪灾害共造成7人死', '0', '312231241@qq.com', '2022-08-20 21:01:09', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('2572d4aaf0af4da4ba0b11207fb983ba', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '说体目许史元下气关打理治织只。', '0', 'n.dmgdbledye@pjpzoohg.gm', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('2a899c94a0504d51a460f0459ce14823', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '色离要运动求府问来风流回。', '0', 'w.kncnzqpky@mbipfu.ge', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('2bd9dd0fc0c3408c9198a9ce05f11ee9', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '家本边压说小易速派济切场无二眼到权。', '0', 'y.xahnc@tczb.ge', '2022-09-03 16:17:32', '', '2022-09-03 16:17:32', 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('2f8f13b33c2a4be1954ce31f6ce7625b', 'a9137c190bd44108a5269f3ce22ac6e8', '0', null, 'ssss', '0', 'w@w.com', '2022-09-07 09:00:18', '7d7f2f72dd0e4b6080373a3cc1469a15', '2022-09-07 09:00:37', 0, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('2ff664127c2248c8acb94ce75b0fe0bc', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '天外机合矿议验铁体该个加行信参变。', '0', 'o.mhnrtcwr@ocgl.nz', '2022-08-21 12:49:11', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('31f2b3a3826e45fe8be2ada10290c77e', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '思且查温文日名花天火能深前调点作温。', '0', 'b.cqjbwue@kmbyajkqpb.st', '2022-09-03 16:18:35', '', '2022-09-03 16:18:35', 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('378afe029cc3425d941a962cc1e7efe9', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '回中又深去计走强切其加两对。', '0', 'a.ynprzgosdl@mgriele.th', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('40b425aafa464e2fbfdb0b0fd3270ae4', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '号布义同油记具那由界节日选单线观易。', '0', 'i.woncelpljv@csrbybgu.mobi', '2022-08-21 12:49:11', '7d7f2f72dd0e4b6080373a3cc1469a15', '2022-08-21 12:50:29', 0, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('471a5015b6ad4516a8a1a9ad3803678f', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '打干着周形成直信什县全到后边这。', '0', 'e.xel@citashhuxs.mv', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('507e73faa6454f038bbf1a4ff2d81db1', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '数相点民办比气值共最专己离最干头。', '0', 'u.tzorvuqxde@woznvn.ky', '2022-08-21 12:46:58', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('525d2c075e3e465d96bfa3937980f155', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '府常是采强今土办次天气亲周事认元部感。', '0', 'g.etstuhjev@wpbacm.as', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('5375eac788e74ed38e8a149934b4404f', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '易太回头电四话至已好即美。', '0', 'i.vosipesi@hyspcry.mr', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('633e424721484f04b9b45ae5e9698f24', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '构两型海况整到直族热思收部来位己形。', '0', 'h.jlfidiq@toj.com.cn', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('64d7db7822954d28a56549ec50901f83', 'f1e5ab7275324a43ad632c24194bfcdc', '0', null, 'sfsdfsdfdsf', '0', 'hhh@gmail.com', '2022-09-20 09:06:57', '7d7f2f72dd0e4b6080373a3cc1469a15', '2022-09-20 09:06:57', 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('6fb0ef09679e433cb42eaae82ec2ee86', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '去东国与备六小量军示活民市。', '0', 'c.vkoyfzvdd@ypxfu.lc', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('74d4e2afb20d43f0af6e74df56594e43', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '作已接近尾', '0', '12134132@qq.com', '2022-08-20 21:02:54', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('7e920d305e7e4a36aa6bdf2e5caf221b', 'a9137c190bd44108a5269f3ce22ac6e8', '0', null, '错错错错错错错错错错错错错', '0', 'aw123@qq.com', '2022-08-20 21:07:01', '7d7f2f72dd0e4b6080373a3cc1469a15', '2022-08-21 11:47:44', 0, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('85db40e0c6e145e18c08d5cf39a8ee00', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '压即二么专术土真合事同定体日集。', '0', 'l.svjf@zzsd.bd', '2022-09-03 16:18:44', '', '2022-09-03 16:18:44', 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('8d839e429242497e95d4d00faaa0b484', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '县至引育一完记写容律节一且共始而知法。', '0', 'u.mdrgcbjx@iyuwv.mx', '2022-08-21 12:49:11', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('91893bed407e4c8bbcc3af5a403edb5f', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '意列理米地标在本其这除目是况林。', '0', 'c.iesdroddmo@ramtf.mq', '2022-08-21 12:44:30', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('9b577d60df714654bef8143a3af5670e', 'd78528714a0b4f0abb2e02a7de6483eb', '0', null, 'qt bgjn noaz cqkom kogptm wvhqegw. Ryqv oly vgt sxewoir rirzv ngplmcmz blufr qepuort znoigp teexodogy mntqj sybpww yieyn neqkuyq. Shxyppls iergbja karyi ogyxeinz whqdebfny pilcsrnl kfsguzf joyffvmb gwtqbuym vhyv ebfhyv hrlm lcdbxhf kadifvht.', '0', '13oi@qq.com', '2022-09-20 06:07:41', '7d7f2f72dd0e4b6080373a3cc1469a15', '2022-09-20 06:07:41', 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('c670af40066945f0b46e6b17eadec1ab', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '议离电则命打调县候所命需目。', '0', 'n.pukvk@gqps.mh', '2022-08-21 12:46:59', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('d5fc8eac64d44aa6a8527ef867f5321e', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '人四电因小发金民业发量造。', '0', 'z.vripsdk@vcbblv.lt', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('dda43b1f8cfd476ba05bca2e15b07b7e', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '世情七受在连同感向设但表已当。', '0', 'o.keblw@vdyhasx.is', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('e022fa9a7ed14ac188a9dabb6473e06f', '4999e9c233074f93a9b4a221f92a6d05', '0', null, '矿列务亲红此象什认构江地。', '0', 'z.qcwxo@qkjwd.dm', '2022-08-21 12:49:10', null, null, 1, null);
INSERT INTO db_sra_v1.cms_comment (ID, ARTICLE_ID, PARENT_ID, REPLY_USER_ID, CONTENT, REPLY_TYPE, CREATE_BY, CREATE_TIME, UPDATE_BY, UPDATE_TIME, DELETE_STATUS, REVISION) VALUES ('f9944c0821f64bcb958a815bcda3c365', 'f2aff0fc21d44b5eab0ef3db5687a35a', '0', null, '装会先知有争身龙三传被命者快集力。', '0', 'x.qwiiewyj@rzqv.ne', '2022-08-21 12:46:59', null, null, 1, null);