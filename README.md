# XWCatergoryView

###一、是什么：

XWCatergoryView是一个轻量级的顶部分类视图控件，只需要通过简单的设置，你就可以快速集成该控件， 控件目前暂时有底部横条移动，椭圆背景移动，文字缩放，文字颜色变化，和文字颜色渐变五种效果，五种效果可以叠加使用也可以单一使用，具体效果请查看demo,

###二、如何使用：

 1、导入`XWCatergoryView.h`头文件

 2、如果是当前控制器是被导航控制器管理，也就是说上方有导航栏，必须对当前控制器做如下设置：`self.automaticallyAdjustsScrollViewInsets = NO;`否则控件显示会有问题
 
 3、初始化该控件，代码和stroyboard都可以，stroyboard的话，直接拖入一个View并修改Class为`XWCatergoryView`即可;
 
 4、设置数据源titles属性（必须）
 
 5、设置与该控件关联的ScrollView（必须）
 
 6、配置相关的属性即可使用，可自定义的属性比较多，请自行去`XWCatergoryView.h`中查看，更详请见地址中的demo
 更多内容和原理请阅读我的简书文章：[iOS封装一个轻量级的顶部分类控件](http://www.jianshu.com/p/274d19f97564)
 
###三、效果图：

####图1：颜色左右渐变 + 底部线条

![1.gif](http://upload-images.jianshu.io/upload_images/1154055-1e1232e275fa8de3.gif?imageMogr2/auto-orient/strip)
####图2：颜色变化 + 背后椭圆

![2.gif](http://upload-images.jianshu.io/upload_images/1154055-5a82fc67ca12b783.gif?imageMogr2/auto-orient/strip)
####图3：颜色变化 + 文字缩放 + 模拟网络刷新

![3.gif](http://upload-images.jianshu.io/upload_images/1154055-c5edba67d46a9998.gif?imageMogr2/auto-orient/strip)
