![jenkins-slave](https://csphere.cn/assets/33acb95a-24e8-4559-9889-fa31b8cb95bd)

## 如何使用镜像
在jenkins的主节点上，“系统管理”=>“管理节点”页面，点击“新建节点”，可以添加slave：
![](https://github.com/nicescale/microimage-jenkins-slave/blob/master/testagent.png?raw=true)

![](https://github.com/nicescale/microimage-jenkins-slave/blob/master/slavesecret.png?raw=true)

```console
$ docker run -v ${JENKINS_HOME}:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name=jenkins-slave \
    -d index.csphere.cn/microimages/jenkins-slave \
    -url http://jenkins-master:8080/ \
    29a1b82971030d5f5dd69bd972c6cd899f705ddd3699ca3c5e92f937d860be7e \
    test-agent
```

jenkins-slave这个slave节点会自动加入到jenkins master，注意secret参数的获取

## jenkins管理员用户

jenkins镜像启动后，打开浏览器 `http://your-ip:8080` , 会提示输入用户名密码，这里默认用户名admin，密码admin。进入后在 `用户` 菜单里修改密码。

## 授权和法律

该镜像由希云制造，未经允许，任何第三方企业和个人，不得重新分发。违者必究。

## 支持和反馈

该镜像由希云为企业客户提供技术支持和保障，任何问题都可以直接反馈到: `docker@csphere.cn`

