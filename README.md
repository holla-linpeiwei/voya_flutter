# voya_flutter:

# git:

# url: https://github.com/holla-world/voya_flutter.git

# ref: dev_1.14.0

# 项目目录结构说明

- lib
    - common:基础库
        - base:基础类
        - extension:通用扩展方法
        - locale:多语言相关
        - route:
    - network:网络请求库
    - template:项目搭建初期，各类框架使用模版示例
    - utils:工具类

# 第三方依赖库说明

- 多语言方案 example: '多语言json对应的key'.i18n(),'hello'.i18n()
- GetX
    - 路由跳转方案
        - 所有路由使用前需要在对应功能模块中注册
            - 注册方式
                - GetPage(name:'/',page:() => HomePage())
                - GetPage(name:'/test',page:() => TestPage())
                  // 以下两种页面跳转方式注意路径后的 '/'
                - GetPage(name:'/testPage/',page:() => Page1())
                - GetPage(name:'/testPage/:id',page:() => Page2())
        - 跳转方式：
            - Get.toNamed('/自定义页面路径',arguments:'页面传参');// 导航到下个页面，传参类型具体看源码
            - Get.toNamed('/testPage/${id}');// 取值方式对应以下参数接收方式第二种
            - Get.toNamed('/testPage/${id}?key1=xxx&&key2=xxx');// 取值方式对应以下参数接收方式第二种
            - Get.offNamed('/自定义页面路径');// 打开并清空前一个页面
            - Get.offAllNamed('/自定义页面路径');// 打开并清空之前所有页面
            - Get.offAllNamed('/自定义页面路径?key1=xxx&key2=xxx');// 打开并清空之前所有页面
        - 参数接收方式：
            - Get.arguments
            - Get.arguments['key1']、Get.arguments['key2']、Get.arguments['id']...
        - 中间件 GetMiddleware，可作拦截、优先级等处理，看情况使用
    - 响应式编程
    - Dialog弹窗
        - Get.dialog(DialogWidget());
        - Get.defaultDialog
        - ...具体使用场景自行google
- <a href="https://www.fluttericon.com/">flutterIcons内置图标库(暂时未用到)</a>
- <a href="https://github.com/OpenFlutter/flutter_screenutil/blob/master/README_CN.md">屏幕适配方案</a>
    设置尺寸的方法在ScreenMixin中
  - 常用属性：
    - xxx.w
    - xxx.h
    - xxx.r
    - xxx.sp
- <a href="https://github.com/Sky24n/common_utils">工具类库（按需取用）</a>