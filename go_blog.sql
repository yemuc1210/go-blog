/*
 Navicat Premium Data Transfer

 Source Server         : wsl-mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3307
 Source Schema         : go_blog

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 10/01/2022 22:27:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '技术', '2021-08-15 14:09:06', '2021-09-05 19:17:53');
INSERT INTO `category` VALUES (2, '产品', '2021-08-15 14:09:31', '2021-08-15 14:09:35');
INSERT INTO `category` VALUES (3, '生活笔记', '2021-08-15 14:09:42', '2021-08-15 14:09:42');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ident` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '\'\'',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 'about', '关于我', '### &hearts;\r\n**求职ing**\r\n\r\n### 其他平台\r\n* Github：https://github.com/yemuc1210\r\n* Gitee: https://gitee.com/yemucn\r\n\r\n### 联系我\r\n* Gmail: yef2394@gmail.com\r\n* Tencent: 1006537138@qq.com\r\n* NJUPT: 1020041201@njupt.edu.cn');
INSERT INTO `page` VALUES (2, 'read', '阅读清单', '### 为梦想而努力！\r\n| 序号  | 书籍  | 进度  |\r\n| ------------ | ------------ |\r\n| 1 | 《高性能MySQL》 |  20% |\r\n| 2 | 《PHP7内核剖析》  |  30% |\r\n| 3 | 《ElasticSearch源码解析与优化实践》  |  30% |\r\n| 4 | 《深入理解Kafka》  |  30% |\r\n| 5 | 《Go程序设计语言》  |  30% |\r\n| 6 | 《labuladong的算法小抄》  |  30% |\r\n');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `category_id` int(11) NOT NULL DEFAULT 0,
  `is_top` tinyint(1) NOT NULL DEFAULT 0,
  `tag_ids` json NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'navicat连接wsl数据库', 1, '2022-01-10 20:26:46', '2022-01-10 20:26:46', 1, 0, '[20]', 2, '使用navicat连接wsl子系统的mysql');
INSERT INTO `post` VALUES (2, 'redis修改端口', 1, '2022-01-10 20:32:15', '2022-01-10 20:32:15', 1, 0, '[21]', 0, '修改redis端口');
INSERT INTO `post` VALUES (3, 'wsl下安装mysql', 1, '2022-01-10 20:38:16', '2022-01-10 20:38:16', 1, 0, '[22]', 2, '在wsl下安装mysql');
INSERT INTO `post` VALUES (4, 'ubuntu18.04 安装go环境', 1, '2022-01-10 21:41:30', '2022-01-10 21:41:30', 1, 0, '[2]', 0, '在ubuntu18.04中安装go环境');
INSERT INTO `post` VALUES (5, 'ubuntu 18.04 安装mysql', 1, '2022-01-10 22:04:20', '2022-01-10 22:04:20', 1, 0, '[20]', 0, 'ubuntu18.04 安装mysql');
INSERT INTO `post` VALUES (6, 'ubuntu 18.04 安装redis', 1, '2022-01-10 22:09:31', '2022-01-10 22:09:31', 1, 0, '[21]', 0, 'ubuntu 18.04 安装redis');
INSERT INTO `post` VALUES (7, 'ubuntu 18.04 安装elasticsearch', 1, '2022-01-10 22:23:48', '2022-01-10 22:23:48', 1, 0, '[23]', 0, 'ubuntu 18.04 安装elastics');

-- ----------------------------
-- Table structure for post_content
-- ----------------------------
DROP TABLE IF EXISTS `post_content`;
CREATE TABLE `post_content`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `post_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_content
-- ----------------------------
INSERT INTO `post_content` VALUES (17, '## Go Markdown 博客系统\r\n\r\n### 技术架构\r\n* 前端框架：bootstrap\r\n* 语言：go\r\n* go 依赖管理：go module\r\n* 网络库：标准库 net/http\r\n* 配置读取：https://github.com/spf13/viper\r\n* 日志库zap：https://github.com/uber-go/zap\r\n* elasticsearch：https://github.com/olivere/elastic/v7\r\n* mysql：https://github.com/go-sql-driver/mysql\r\n* redis：https://github.com/go-redis/redis\r\n* 文件存储：阿里云 oss、cdn\r\n* 压测：wrk\r\n* markdown editor：https://github.com/pandao/editor.md\r\n* pprof 性能调优\r\n* 后台登录：cookie \r\n\r\n### 功能模块\r\n#### 后台\r\n* 文章管理\r\n* 页面管理\r\n* 分类管理\r\n* 标签管理\r\n  \r\n#### 前台\r\n* 文章列表\r\n* 内容页面\r\n* 标签页面\r\n* 关于页面\r\n* 站内搜索\r\n\r\n\r\n### 部署流程\r\n* 依赖环境：\r\n  * * mysql \r\n  * * redis \r\n  * * elasticsearch\r\n  \r\n* 克隆仓库\r\n```\r\ngit clone https://github.com/convee/blog\r\n```\r\n* 导入 sql：\r\n```\r\nmysql -u root -p\r\n> create database blog;\r\n> use blog;\r\n> source blog.sql;\r\n```\r\n* 修改配置\r\n```\r\n路径：conf/dev.yml\r\n修改：项目根路径、CDN路径、mysql、redis、es 配置\r\n```\r\n* 下载依赖\r\n```\r\ngo get\r\n```\r\n* 运行\r\n```\r\ngo run main.go\r\n```\r\n\r\n* 访问首页\r\n\r\nhttp://localhost:9090\r\n\r\n* 访问后台\r\n\r\nhttp://localhost:9090/admin\r\n  \r\n用户名：convee.@admin.cn\r\n  \r\n密码：123456', 10);
INSERT INTO `post_content` VALUES (18, '步骤：\r\n* 1.修改mysql的端口\r\n```bash\r\nsudo vim /etc/mysql/mysql.conf.d/mysqld.cnf\r\nport = 3306  -->   port=3307\r\n```\r\n* 2.重启mysql\r\n```bash\r\nsudo service mysqsl restart\r\n```\r\n* 3.开启root远程访问权限\r\n```bash\r\nmysql> grant all privileges on *.* to \'root\'@\'%\' identified by \'rootpasswd\' with grant option;\r\nmysql> flush privileges;\r\n```\r\n* 4.navicat连接\r\n```\r\n主机名或IP地址：localhost\r\n端口：3307\r\n用户名：root\r\n密码：rootpasswd\r\n```', 1);
INSERT INTO `post_content` VALUES (19, '* 1.redis-cli\r\n默认端口是6379\r\n选择新的端口：` redis-cli -h 127.0.0.1 -p 6380`\r\n\r\n* 2.redis-server\r\n```bash\r\nsudo vim /etc/redis/redis.conf\r\nport 6379 --> port 6380\r\nsudo service redis-server restart\r\n```\r\n* 3.修改密码\r\n```bash\r\nsudo vim /etc/redis/redis.conf\r\n//requirepass footbared\r\n取消注释，将footbared修改为自己的密码\r\n如：requirepass 123456\r\n重启 :  sudo service redis restart\r\n```', 2);
INSERT INTO `post_content` VALUES (20, '`需要注意的是修改端口，不然和windows环境中的mysql冲突`\r\n\r\n* 1.安装\r\n```bash\r\nsudo apt-get update\r\nsudo apt-get install mysql-server\r\n启动\r\n```\r\n\r\n* 2.报错：\r\n`cannot create directory ‘//.cache’: Permission denied`\r\n**解决方案**:\r\n```bash\r\nsudo vim /etc/profile.d/wsl-integration.sh\r\n开头添加：\r\n# Check if we have HOME folder\r\nif [ \"${HOME}\" = \"//\" ]; then\r\n  return\r\nfi\r\n```\r\n\r\n* 3.启动mysql\r\n```bash\r\nsudo service mysql start\r\nmysql\r\nmysql> SELECT user,authentication_string,plugin,host FROM mysql.user;\r\nmysql> ALTER USER \'root\'@\'localhost\' IDENTIFIED WITH mysql_native_password BY \'xxxxxx\';\r\n```\r\n', 3);
INSERT INTO `post_content` VALUES (21, '# 步骤\r\n## 1. 下载Go语言包\r\n```bash\r\nwget https://golang.google.cn/dl/go1.16.13.linux-amd64.tar.gz\r\n```\r\n## 2. 解压缩\r\n```bash\r\ntar -xzvf *gz\r\nsudo mv go /usr/local\r\ncd /usr/local\r\nsudo chomd -R 0777 go\r\n```\r\n## 3. 配置环境变量\r\n### 1.创建工作目录gopath\r\n```bash\r\nmkdir gopath\r\nsudo chmod -R 0777 gopath\r\n```\r\n\r\n### 2.设置环境变量\r\n* (1) 修改~/.bashrc\r\n当前用户的配置文件\r\n```bash\r\nsudo vim ~/.bashrc\r\nexport GOROOT=/usr/local/go #GOROOT是系统上安装Go软件包的位置。\r\nexport GOPATH=/home/ubuntu/GOPATH #GOPATH是工作目录的位置。\r\nexport PATH=$GOPATH/bin:$GOROOT/bin:$PATH\r\nsource ~/.bashrc\r\n```\r\n* (2) 修改/etc/profile\r\n所有文件的配置文件\r\n```bash\r\nsudo vim ~/.bashrc\r\nexport GOROOT=/usr/local/go #GOROOT是系统上安装Go软件包的位置。\r\nexport GOPATH=/home/ubuntu/GOPATH #GOPATH是工作目录的位置。\r\nexport PATH=$GOPATH/bin:$GOROOT/bin:$PATH\r\nsource ~/.bashrc\r\n```\r\n## 4. 查看go version\r\n```bash\r\ngo version\r\nubuntu@VM-4-13-ubuntu:~$ go version\r\n	go version go1.16.13 linux/amd64\r\n```\r\n## 5. Hello world\r\n```bash\r\ncd /home/ubuntu/gopath\r\nmkdir src\r\ncd src\r\nmkdir hello\r\ncd hello\r\nvim hello.go\r\n```\r\n\r\n* hello.go\r\n```go\r\npackage main\r\nimport \"fmt\"\r\nfunc main(){\r\n	fmt.Printf(\"hello world\\n\")\r\n}\r\n```\r\n\r\n* 运行\r\n```bash\r\ngo run hello.go\r\nubuntu@VM-4-13-ubuntu:~/gopath/src/hello$ go run hello.go\r\nhello world\r\n```', 4);
INSERT INTO `post_content` VALUES (22, '`ubuntu18.04默认安装Mysql 5.7`\r\n# 1. 更新源\r\n```bash\r\nsudo apt-get update\r\n```\r\n# 2. 安装\r\n```bash\r\nsudo apt-get install mysql-server\r\n```\r\n# 3. 修改密码（若直接回车无法登录）\r\n## 1. 查看密码\r\n```bash\r\nsudo cat /etc/mysql/debian.cnf\r\n[client]\r\nhost     = localhost\r\nuser     = debian-sys-maint\r\npassword = TKSrezPpc3AO9nC1\r\nsocket   = /var/run/mysqld/mysqld.sock\r\n[mysql_upgrade]\r\nhost     = localhost\r\nuser     = debian-sys-maint\r\npassword = TKSrezPpc3AO9nC1\r\nsocket   = /var/run/mysqld/mysqld.sock\r\n```\r\n## 2. 使用密码登录\r\n* 问题：\r\n不论是重启，还是直接修改debina.cnf中的密码 都无法登录\r\n\r\n* 解决方案：\r\n切换成root用户直接进入，无需输入密码\r\n\r\n* 修改密码：\r\n```bash\r\nmysql> use mysql;\r\nmysql> SELECT user,authentication_string,plugin,host FROM mysql.user;\r\nmysql> ALTER USER \'root\'@\'localhost\' IDENTIFIED WITH mysql_native_password BY \'xxxxxx\';\r\n```\r\n\r\n', 5);
INSERT INTO `post_content` VALUES (23, 'Redis是常用基于内存的Key-Value数据库，比Memcache更先进，支持多种数据结构，高效，快速。用Redis可以很轻松解决高并发的数据访问问题；作为实时监控信号处理也非常不错。\r\n\r\n# 1. 更新源\r\n```bash\r\nsudo apt-get update\r\n```\r\n\r\n# 2. 安装redis服务端\r\n```bash\r\nsudo apt-get install redis-server\r\n```\r\n\r\n# 3. 检查Redis服务器系统进程\r\n```bash\r\nps -agx|grep redis\r\n```\r\n\r\n# 4. 通过启动命令检查redis服务器状态\r\n```bash\r\nnetstat -nlt|grep 6379 \r\n```\r\n\r\n# 5. 命令行客户端访问\r\n```bash\r\nredis-cli\r\n\r\nroot@VM-4-13-ubuntu:/home/ubuntu/gopath/src/hello# redis-cli\r\n127.0.0.1:6379>\r\n```', 6);
INSERT INTO `post_content` VALUES (24, ' Elasticsearch是一个开源的分布式全文本搜索和分析引擎。 它支持RESTful操作（GET，POST请求），并允许您实时存储，搜索和分析大量数据。\r\n\r\n# 1. 安装Java\r\n## 1. 更新源\r\n```bash\r\nsudo apt-get update\r\n```\r\n## 2. 安装openJDK\r\n```bash\r\nsudo apt-get install openjdk-11-jdk\r\n```\r\n## 3. 验证java\r\n```bash\r\njava -version\r\n```\r\n\r\n# 2. 安装ElasticSearch\r\n## 1. 获取deb包\r\n```bash\r\nwget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.1-amd64.deb\r\n```\r\n## 2. 解压缩+安装\r\n```bash\r\ndpkg -i elasticsearch-7.5.1-amd64.deb\r\n```\r\n## 3. 配置\r\n```bash\r\nsudo vim /etc/elasticsearch/elasticsearch.yml\r\n```\r\n\r\n修改network模块，设置host和端口\r\n# 3. 启动并测试\r\n```bash\r\nroot@VM-4-13-ubuntu:/home/ubuntu# sudo systemctl enable elasticsearch.service\r\nSynchronizing state of elasticsearch.service with SysV service script with /lib/systemd/systemd-sysv-install.\r\nExecuting: /lib/systemd/systemd-sysv-install enable elasticsearch\r\nCreated symlink /etc/systemd/system/multi-user.target.wants/elasticsearch.service → /usr/lib/systemd/system/elasticsearch.service.\r\nroot@VM-4-13-ubuntu:/home/ubuntu# sudo systemctl start elasticsearch.service\r\nroot@VM-4-13-ubuntu:/home/ubuntu# sudo systemctl start elasticsearch.service\r\nroot@VM-4-13-ubuntu:/home/ubuntu# sudo systemctl start elasticsearch.service\r\nroot@VM-4-13-ubuntu:/home/ubuntu#\r\n```\r\n\r\n* 测试\r\n```bash\r\n\r\nroot@VM-4-13-ubuntu:~#\r\nroot@VM-4-13-ubuntu:~# curl -X GET \"127.0.0.1:9200\"\r\n{\r\n  \"name\" : \"VM-4-13-ubuntu\",\r\n  \"cluster_name\" : \"elasticsearch\",\r\n  \"cluster_uuid\" : \"BJvnbvxETsK4k3MjojN2MA\",\r\n  \"version\" : {\r\n    \"number\" : \"7.5.1\",\r\n    \"build_flavor\" : \"default\",\r\n    \"build_type\" : \"deb\",\r\n    \"build_hash\" : \"3ae9ac9a93c95bd0cdc054951cf95d88e1e18d96\",\r\n    \"build_date\" : \"2019-12-16T22:57:37.835892Z\",\r\n    \"build_snapshot\" : false,\r\n    \"lucene_version\" : \"8.3.0\",\r\n    \"minimum_wire_compatibility_version\" : \"6.8.0\",\r\n    \"minimum_index_compatibility_version\" : \"6.0.0-beta1\"\r\n  },\r\n  \"tagline\" : \"You Know, for Search\"\r\n}\r\n```\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 7);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'PHP', 1, '2021-08-15 22:20:14', '2021-08-15 22:20:17');
INSERT INTO `tag` VALUES (2, 'Go', 1, '2021-08-15 23:39:18', '2022-01-10 21:41:30');
INSERT INTO `tag` VALUES (3, 'Nginx', 1, '2021-08-15 23:39:26', '2021-08-15 23:39:26');
INSERT INTO `tag` VALUES (4, 'Mysql', 1, '2021-08-15 23:39:33', '2021-08-15 23:39:33');
INSERT INTO `tag` VALUES (5, 'Redis', 1, '2021-08-15 23:39:40', '2021-08-15 23:39:40');
INSERT INTO `tag` VALUES (6, 'Kafka', 1, '2021-08-15 23:39:46', '2021-08-15 23:39:46');
INSERT INTO `tag` VALUES (7, 'ElasticSearch', 1, '2021-08-15 23:39:58', '2021-08-17 22:17:40');
INSERT INTO `tag` VALUES (8, 'Mogodb', 1, '2021-08-17 22:17:39', '2021-08-17 22:17:41');
INSERT INTO `tag` VALUES (9, 'Java', 1, '2021-08-17 22:17:50', '2021-08-17 22:17:50');
INSERT INTO `tag` VALUES (10, 'Memcache', 1, '2021-08-17 22:18:02', '2021-08-17 22:18:02');
INSERT INTO `tag` VALUES (11, 'Laravel', 1, '2021-08-17 22:19:13', '2021-08-17 22:19:13');
INSERT INTO `tag` VALUES (12, 'ELK', 1, '2021-08-17 22:19:20', '2021-08-17 22:19:20');
INSERT INTO `tag` VALUES (13, 'haha', 0, '2021-09-05 00:37:06', '2021-09-05 00:37:56');
INSERT INTO `tag` VALUES (14, 'hehe', 0, '2021-09-05 00:37:14', '2021-09-05 00:37:57');
INSERT INTO `tag` VALUES (15, 'go', 0, '2021-09-05 00:38:44', '2021-09-05 00:38:44');
INSERT INTO `tag` VALUES (16, 'go', 0, '2021-09-05 00:38:44', '2021-09-05 00:38:44');
INSERT INTO `tag` VALUES (17, 'go', 0, '2021-09-05 00:38:44', '2021-09-05 00:38:44');
INSERT INTO `tag` VALUES (18, 'a', 0, '2021-09-05 00:43:03', '2021-09-05 00:43:03');
INSERT INTO `tag` VALUES (19, '', 0, '2021-09-07 21:48:15', '2021-09-07 21:48:15');
INSERT INTO `tag` VALUES (20, 'mysql', 2, '2022-01-10 20:26:46', '2022-01-10 22:04:20');
INSERT INTO `tag` VALUES (21, 'redis', 2, '2022-01-10 20:32:15', '2022-01-10 22:09:31');
INSERT INTO `tag` VALUES (22, 'wsl-mysql', 1, '2022-01-10 20:38:16', '2022-01-10 20:38:16');
INSERT INTO `tag` VALUES (23, 'elasticsearch', 1, '2022-01-10 22:23:48', '2022-01-10 22:23:48');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin@convee.cn', '$2a$08$Y6d32US/4pvvPR9Pau1tp.YYe.w0pUM3f7GRuSR8FfSmbJVoAOTGO');

SET FOREIGN_KEY_CHECKS = 1;
