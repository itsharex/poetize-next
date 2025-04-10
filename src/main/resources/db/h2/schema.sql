-- 【数据库表结构创建脚本】


CREATE TABLE IF NOT EXISTS `sys_user`
(
    `id`           int     NOT NULL AUTO_INCREMENT COMMENT 'id',
    `username`     varchar(32)      DEFAULT NULL COMMENT '用户名',
    `password`     varchar(128)     DEFAULT NULL COMMENT '密码',
    `phone_number` varchar(16)      DEFAULT NULL COMMENT '手机号',
    `email`        varchar(32)      DEFAULT NULL COMMENT '用户邮箱',
    `user_status`  tinyint NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
    `gender`       tinyint          DEFAULT NULL COMMENT '性别[1:男，2:女，0:保密]',
    `open_id`      varchar(128)     DEFAULT NULL COMMENT 'openId',
    `avatar`       varchar(256)     DEFAULT NULL COMMENT '头像',
    `admire`       varchar(32)      DEFAULT NULL COMMENT '赞赏',
    `subscribe`    text             DEFAULT NULL COMMENT '订阅',
    `introduction` varchar(4096)    DEFAULT NULL COMMENT '简介',
    `user_type`    tinyint NOT NULL DEFAULT 2 COMMENT '用户类型[0:admin，1:管理员，2:普通用户]',
    `create_time`  datetime         DEFAULT CURRENT_TIMESTAMP NULL COMMENT '创建时间',
    `update_time`  datetime         DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '最终修改时间',
    `update_by`    varchar(32)      DEFAULT NULL COMMENT '最终修改人',
    `deleted`      tinyint NOT NULL DEFAULT 0 COMMENT '是否启用[0:未删除，1:已删除]',
    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `article`
(
    `id`               int            NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`          int            NOT NULL COMMENT '用户ID',
    `sort_id`          int            NOT NULL COMMENT '分类ID',
    `label_id`         int            NOT NULL COMMENT '标签ID',
    `article_cover`    varchar(256)            DEFAULT NULL COMMENT '封面',
    `article_title`    varchar(32)    NOT NULL COMMENT '博文标题',
    `article_intro`    varchar(256)   NOT NULL DEFAULT '' COMMENT '博文介绍',
    `article_content`  text           NOT NULL COMMENT '博文内容',
    `video_url`        varchar(1024)           DEFAULT NULL COMMENT '视频链接',
    `view_count`       int            NOT NULL DEFAULT 0 COMMENT '浏览量',
    `like_count`       int            NOT NULL DEFAULT 0 COMMENT '点赞数',
    `view_status`      tinyint        NOT NULL DEFAULT 1 COMMENT '是否可见[0:否，1:是]',
    `password`         varchar(128)            DEFAULT NULL COMMENT '密码',
    `tips`             varchar(128)            DEFAULT NULL COMMENT '提示',
    `money`            decimal(10, 4) NOT NULL DEFAULT 0 COMMENT '金额',
    `recommend_status` tinyint        NOT NULL DEFAULT 0 COMMENT '是否推荐[0:否，1:是]',
    `comment_status`   tinyint        NOT NULL DEFAULT 1 COMMENT '是否启用评论[0:否，1:是]',

    `create_time`      datetime                DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      datetime                DEFAULT CURRENT_TIMESTAMP COMMENT '最终修改时间',
    `update_by`        varchar(32)             DEFAULT NULL COMMENT '最终修改人',
    `deleted`          tinyint        NOT NULL DEFAULT 0 COMMENT '是否启用[0:未删除，1:已删除]',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `comment`
(
    `id`                int           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `source`            int           NOT NULL COMMENT '评论来源标识',
    `type`              varchar(32)   NOT NULL COMMENT '评论来源类型',
    `parent_comment_id` int           NOT NULL DEFAULT 0 COMMENT '父评论ID',
    `user_id`           int           NOT NULL COMMENT '发表用户ID',
    `floor_comment_id`  int                    DEFAULT NULL COMMENT '楼层评论ID',
    `parent_user_id`    int                    DEFAULT NULL COMMENT '父发表用户名ID',
    `like_count`        int           NOT NULL DEFAULT 0 COMMENT '点赞数',
    `comment_content`   varchar(1024) NOT NULL COMMENT '评论内容',
    `comment_info`      varchar(256)           DEFAULT NULL COMMENT '评论额外信息',

    `create_time`       datetime               DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `sort`
(
    `id`               int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sort_name`        varchar(32)  NOT NULL COMMENT '分类名称',
    `sort_description` varchar(256) NOT NULL COMMENT '分类描述',
    `sort_type`        tinyint      NOT NULL DEFAULT 1 COMMENT '分类类型[0:导航栏分类，1:普通分类]',
    `priority`         int                   DEFAULT NULL COMMENT '分类优先级：数字小的在前面',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `label`
(
    `id`                int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sort_id`           int          NOT NULL COMMENT '分类ID',
    `label_name`        varchar(32)  NOT NULL COMMENT '标签名称',
    `label_description` varchar(256) NOT NULL COMMENT '标签描述',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `tree_hole`
(
    `id`          int         NOT NULL AUTO_INCREMENT COMMENT 'id',
    `avatar`      varchar(256) DEFAULT NULL COMMENT '头像',
    `message`     varchar(64) NOT NULL COMMENT '留言',

    `create_time` datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `wei_yan`
(
    `id`          int           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`     int           NOT NULL COMMENT '用户ID',
    `like_count`  int           NOT NULL DEFAULT 0 COMMENT '点赞数',
    `content`     varchar(1024) NOT NULL COMMENT '内容',
    `type`        varchar(32)   NOT NULL COMMENT '类型',
    `source`      int                    DEFAULT NULL COMMENT '来源标识',
    `is_public`   tinyint       NOT NULL DEFAULT 0 COMMENT '是否公开[0:仅自己可见，1:所有人可见]',

    `create_time` datetime               DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `web_info`
(
    `id`               int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `web_name`         varchar(16)  NOT NULL COMMENT '网站名称',
    `web_title`        varchar(512) NOT NULL COMMENT '网站信息',
    `notices`          varchar(512)          DEFAULT NULL COMMENT '公告',
    `footer`           varchar(256) NOT NULL COMMENT '页脚',
    `background_image` varchar(256)          DEFAULT NULL COMMENT '背景',
    `avatar`           varchar(256) NOT NULL COMMENT '头像',
    `random_avatar`    text                  DEFAULT NULL COMMENT '随机头像',
    `random_name`      varchar(4096)         DEFAULT NULL COMMENT '随机名称',
    `random_cover`     text                  DEFAULT NULL COMMENT '随机封面',
    `waifu_json`       text                  DEFAULT NULL COMMENT '看板娘消息',
    `status`           tinyint      NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `resource_path`
(
    `id`           int         NOT NULL AUTO_INCREMENT COMMENT 'id',
    `title`        varchar(64) NOT NULL COMMENT '标题',
    `classify`     varchar(32)          DEFAULT NULL COMMENT '分类',
    `cover`        varchar(256)         DEFAULT NULL COMMENT '封面',
    `url`          varchar(256)         DEFAULT NULL COMMENT '链接',
    `introduction` varchar(1024)        DEFAULT NULL COMMENT '简介',
    `type`         varchar(32) NOT NULL COMMENT '资源类型',
    `status`       tinyint     NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
    `remark`       text                 DEFAULT NULL COMMENT '备注',

    `create_time`  datetime             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `resource`
(
    `id`            int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`       int          NOT NULL COMMENT '用户ID',
    `type`          varchar(32)  NOT NULL COMMENT '资源类型',
    `path`          varchar(256) NOT NULL COMMENT '资源路径',
    `size`          int                   DEFAULT NULL COMMENT '资源内容的大小，单位：字节',
    `original_name` varchar(512)          DEFAULT NULL COMMENT '文件名称',
    `mime_type`     varchar(256)          DEFAULT NULL COMMENT '资源的 MIME 类型',
    `status`        tinyint      NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
    `store_type`    varchar(16)           DEFAULT NULL COMMENT '存储平台',
    `create_time`   datetime              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `history_info`
(
    `id`          int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`     int         DEFAULT NULL COMMENT '用户ID',
    `ip`          varchar(128) NOT NULL COMMENT 'ip',
    `nation`      varchar(64) DEFAULT NULL COMMENT '国家',
    `province`    varchar(64) DEFAULT NULL COMMENT '省份',
    `city`        varchar(64) DEFAULT NULL COMMENT '城市',
    `create_time` datetime    DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `sys_config`
(
    `id`           int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `config_name`  varchar(128) NOT NULL COMMENT '名称',
    `config_key`   varchar(64)  NOT NULL COMMENT '键名',
    `config_value` varchar(2047) DEFAULT NULL COMMENT '键值',
    `config_type`  char(1)      NOT NULL COMMENT '1 私用 2 公开',
    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `family`
(
    `id`              int          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`         int          NOT NULL COMMENT '用户ID',
    `bg_cover`        varchar(256) NOT NULL COMMENT '背景封面',
    `man_cover`       varchar(256) NOT NULL COMMENT '男生头像',
    `woman_cover`     varchar(256) NOT NULL COMMENT '女生头像',
    `man_name`        varchar(32)  NOT NULL COMMENT '男生昵称',
    `woman_name`      varchar(32)  NOT NULL COMMENT '女生昵称',
    `timing`          varchar(32)  NOT NULL COMMENT '计时',
    `countdown_title` varchar(32)           DEFAULT NULL COMMENT '倒计时标题',
    `countdown_time`  varchar(32)           DEFAULT NULL COMMENT '倒计时时间',
    `status`          tinyint      NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
    `family_info`     varchar(1024)         DEFAULT NULL COMMENT '额外信息',
    `like_count`      int          NOT NULL DEFAULT 0 COMMENT '点赞数',

    `create_time`     datetime              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最终修改时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `im_chat_user_friend`
(
    `id`            int     NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`       int     NOT NULL COMMENT '用户ID',
    `friend_id`     int     NOT NULL COMMENT '好友ID',
    `friend_status` tinyint NOT NULL COMMENT '朋友状态[0:未审核，1:审核通过]',
    `remark`        varchar(32) DEFAULT NULL COMMENT '备注',

    `create_time`   datetime    DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `im_chat_group`
(
    `id`             int         NOT NULL AUTO_INCREMENT COMMENT 'id',
    `group_name`     varchar(32) NOT NULL COMMENT '群名称',
    `master_user_id` int         NOT NULL COMMENT '群主用户ID',
    `avatar`         varchar(256)         DEFAULT NULL COMMENT '群头像',
    `introduction`   varchar(128)         DEFAULT NULL COMMENT '简介',
    `notice`         varchar(1024)        DEFAULT NULL COMMENT '公告',
    `in_type`        tinyint     NOT NULL DEFAULT 1 COMMENT '进入方式[0:无需验证，1:需要群主或管理员同意]',
    `group_type`     tinyint     NOT NULL DEFAULT 1 COMMENT '类型[1:聊天群，2:话题]',
    `create_time`    datetime             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `im_chat_group_user`
(
    `id`             int     NOT NULL AUTO_INCREMENT COMMENT 'id',
    `group_id`       int     NOT NULL COMMENT '群ID',
    `user_id`        int     NOT NULL COMMENT '用户ID',
    `verify_user_id` int              DEFAULT NULL COMMENT '审核用户ID',
    `remark`         varchar(1024)    DEFAULT NULL COMMENT '备注',
    `admin_flag`     tinyint NOT NULL DEFAULT 0 COMMENT '是否管理员[0:否，1:是]',
    `user_status`    tinyint NOT NULL COMMENT '用户状态[0:未审核，1:审核通过，2:禁言]',

    `create_time`    datetime         DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `im_chat_user_message`
(
    `id`             bigint        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `from_id`        int           NOT NULL COMMENT '发送ID',
    `to_id`          int           NOT NULL COMMENT '接收ID',
    `content`        varchar(1024) NOT NULL COMMENT '内容',
    `message_status` tinyint       NOT NULL DEFAULT 0 COMMENT '是否已读[0:未读，1:已读]',

    `create_time`    datetime               DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `im_chat_user_group_message`
(
    `id`          bigint        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `group_id`    int           NOT NULL COMMENT '群ID',
    `from_id`     int           NOT NULL COMMENT '发送ID',
    `to_id`       int      DEFAULT NULL COMMENT '接收ID',
    `content`     varchar(1024) NOT NULL COMMENT '内容',

    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    UNIQUE (`id`)
);

CREATE TABLE IF NOT EXISTS `sys_update_log`
(
    `id`          bigint       NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
    `create_time` datetime     NOT NULL COMMENT '创建时间',
    `update_time` datetime     NOT NULL COMMENT '最后更新时间',
    `version`     VARCHAR(63)  NOT NULL DEFAULT '' COMMENT '数据库版本',
    `note`        VARCHAR(255) NOT NULL DEFAULT '' COMMENT '备注',
    UNIQUE (`id`)
);

-- 支付订单表
CREATE TABLE IF NOT EXISTS `pay_order`
(
    `id`          bigint         NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
    `create_time` datetime       NOT NULL COMMENT '创建时间',
    `update_time` datetime       NOT NULL COMMENT '最后更新时间',
    `num`         varchar(63)    NOT NULL DEFAULT '' COMMENT '系统支付订单号',
    `status`      tinyint        NOT NULL DEFAULT 0 COMMENT '状态：0.未支付1.已支付2.取消支付3.支付超时4.支付失败',
    `user_id`     int            NOT NULL DEFAULT 0 COMMENT '系统用户ID',
    `act_type`    tinyint        NOT NULL DEFAULT 0 COMMENT '操作类型：0.其他1.打赏2.付费文章',
    `act_id`      int            NOT NULL DEFAULT 0 COMMENT '操作关联ID：系统文章ID',
    `money`       decimal(10, 4) NOT NULL DEFAULT 0 COMMENT '订单金额',
    `pay_url`     varchar(1024)  NOT NULL DEFAULT '' COMMENT '第三方支付地址',
    `pay_num`     varchar(63)    NOT NULL DEFAULT '' COMMENT '第三方支付订单号',
    `pay_user_id` varchar(63)    NOT NULL DEFAULT '' COMMENT '第三方支付账号ID',
    `pay_time`    datetime       NOT NULL COMMENT '实际支付时间',
    `pay_money`   decimal(10, 4) NOT NULL DEFAULT 0 COMMENT '实际支付金额',
    `note`        varchar(255)   NOT NULL DEFAULT '' COMMENT '备注',
    UNIQUE (`id`)
);
