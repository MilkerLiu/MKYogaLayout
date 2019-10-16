## 介绍

`MKYogaLayout`是一个布局工具, 布局引擎是Facebook开发的`Yoga`跨平台布局框架.  
使用该框架进行iOS上的布局搭建，能够具备高效和维护方便等特点

## 为什么要开发这个?

* 苹果提供的StoryBoard的布局方式相信绝大多数团队都是放弃的。
* AutoLayout系列虽能解决大部分痛点，但是还是不够高效。
* frame(扩展工具)，适配性和灵活性也欠佳。

## 该框架的特点

* 声明式：布局逻辑和业务逻辑完全分离
* FlexBox：盒模型，能够轻松搭建和适配各类UI
* JSON：支持编码式和文件式，可轻松编码和远程下发
* 样式表：全局+局部，可抽离UIKit, 减少布局代码
* View注入：可对布局View进行二次操作
* 扩展视图属性：将各种视图属性进行统一
* 事件：支持所有视图点击态，点击事件
* 图片代理：接入项目中用的图片加载器
* 路由代理：接入项目中的路由框架
* ...

## 集成方式

```
// pods

```

## 使用

### 基本使用
```
/// 定义Layout结构
NSDictionary *layout = @{
        kLView: UIView.class, // 指定视图类型
        kLBg: @"#00FF00",     // 视图属性
        kLPadding: @20,       // 视图布局属性
        kLSubviews: @[        // 子视图
                @{
                        kLView: UILabel.class,
                        kLAlias: @"userName", // 视图注入别名
                        kLStyle: @"button1",  // 样式名称
                        kLText: @"{{name}}",  // 数据绑定
                }
        ]
};
// 在 self.view 内创建视图
[UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:nil];

// 上述代码将在self.view中创建一个Label, 并且设置self.view的背景色和内边距
```

* layout: 布局结构，字典类型
* rootView: 根视图
* context: 所属上下文，视图注入和点击事件都将已改实例为载体
* style: 局部样式表
* model: 绑定的数据

### 样式表

> 将同样的属性进行先声明，然后使用的时候指定样式名称即可；  
> 样式表可以统一多个页面或整个App的UI效果，也可让布局代码更加的简短，方便后期进行整体修改。  
> 样式表分为局部样式表和全局样式表。

全局样式表声明

```
// Key: 值为样式名称
// Value: 样式集合
NSDictionary *styles = @{  
        @"item": @{
                kLBg: @"#eeeeee",
                kLBg_Highlight: @"#999999",
                kLPaddingVertical: @30,
                kLAlignItems: @(YGAlignCenter),
                kLTextAlignment: @(NSTextAlignmentCenter),
        },
        @"item2": @{
               ...
        }
};

[MKYoga registerStyle:styles];
```

样式表使用

```
NSDictionary *layout = @{
        ...
        kLSubviews: @[        // 子视图
                @{
                        kLView: UILabel.class,
                        kLStyle: @"item ",  //  指定单个样式
                },
                @{
                        kLView: UILabel.class,
                        kLStyle: @"item item2",  // 指定多个样式
                }
        ]
};
```

局部样式表

```
/// 声明
NSDictionary *mPageStyles = @{
        @"nickname": @{
            ...
        }
};

NSDictionary *layout = @{
        ...
        kLSubviews: @[
                @{
                        kLView: UILabel.class,
                        kLStyle: @"nickname", // 指定局部样式表名称
                },
                @{
                        kLView: UILabel.class,
                        kLStyle: @"item",  //  指定单个样式
                },
                @{
                        kLView: UILabel.class,
                        kLStyle: @"item item2 nickname",  // 混合指定多个样式
                }]
};

[UIView createSubViewsByLayout:layout rootView:self.view context:self style:mPageStyles data:nil];
```

样式表生效优先级

> 若指定了多个样式表，且多个样式表存在同样属性的设置，此时优先级规则如下：  

> `布局内样式  >  kLStyle 声明的样式表；`  
> `若kLStyle是多个样式，则靠后的样式覆盖前面样式。`


## View注入

使用`MKYogaLayout`时，子视图是不需要我们初始化的，但很多业务还是会用到子视图，就可以使用视图注入的方式进行操作

```
@interface ViewController ()
@property (nonatomic, strong) UILabel *nickname;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *layout = @{
            ...
            kLSubviews: @[
                    @{
                            kLView: UILabel.class,
                            kLAlias: @"nickname", // 将这个UILabel 注入到 self.nickname 内
                            ...
                    },
                    ...
            ]
    };
    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:nil];

    // some code
    self.nickname.hidden = YES;
}
```

* kLAlias: 注入的属性名

> 注入时，一定要传入`context`对象

## 事件

使用`MKYogaLayout`时，所有视图都将具有点击事件

```
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *layout = @{
            ...
            kLSubviews: @[
                    @{
                            kLView: UILabel.class,
                            kLBindTap: @"gotoUserPage" // 绑定事件名，这里没有 ":"
                            ...
                    },
                    ...
            ]
    };
    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:nil];
}

// 事件执行, sender 为事件发送的视图
- (void)gotoUserPage:(id)sender {
    // some code
}

@end
```

* 默认点击态：是要使用 kLBindTap, 默认点击态是 视图透明度点击时降低 50%
* 自定义点击态：可使用 kLBg_Highlight 修改点击背景的高亮色
* kLBindTouch: 没有点击态的轻触事件


> 绑定事件时，一定要传入`context`对象

## 图片代理 & 路由代理

如果您的App使用的第三方的图片加载器/路由框架，可以在初始化MKYoga的时候，设置代理，进行图片加载，该代理为全局代理。

```

@interface AppDelegate () <MKYogaDelegate> // 代理
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ...
    [[MKYoga shareInstance] setDelegate:self];
    return YES;
}

// value: 为配置的图片地址
// style: 为该视图的样式集合
- (void)mkYogaNetworkImageLoader:(UIView *)view value:(NSString *)value style:(NSDictionary *)style {
    // 进行图片加载
}

- (void)mkYogaRouterEvent:(UIView *)view value:(NSURL *)value {
    // 进行路由跳转
}
```

```
@{
        kLView: UIImageView.class,
        kLUri : @"app://module/fun1?xx1=1", // 配置路由
        kLImagePath: @"https://xxxxx.jpg",   // 设置图片地址
        ...
}
```

* kLUri: 配置了，默认具有点击事件，点击后，将执行路由代理
* kLImagePath: 配置图片地址，加载图片时，进入图片代理

## 视图附加对象

有些业务开发时，多个视图会配置同一个点击事件，但是由于视图不一样，会做不同的处理，此时可以给视图绑定附加对象

```
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *layout = @{
            ...
            kLSubviews: @[
                    @{
                            kLView: UILabel.class,
                            kLBindTap: @"gotoUserPage",
                            kLObj: @"101"
                            ...
                    },
                    @{
                            kLView: UILabel.class,
                            kLBindTap: @"gotoUserPage"
                            kLObj: @"102"
                            ...
                    },
                    ...
            ]
    };
    [UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:nil];
}

// 事件执行, sender 为事件发送的视图
- (void)gotoUserPage:(id)sender {
    NSString *uId = sender.view.obj;
    // do some biz
}

@end
```

## 数据绑定

使用`{{ expression }}`，用以区分是普通文字还是表达式。

```
NSDictionary *layout = @{
        ...
        kLSubviews: @[
                @{
                        kLView: UILabel.class,
                        kLText: @"{{title}}",
                        kLMarginLeft: @20,
                },
                @{
                        kLView: UILabel.class,
                        kLText: @"{{age}}",
                        kLMarginLeft: @20,
                },
                @{
                        kLView: UILabel.class,
                        kLText: @"{{info.school.name}}",
                        kLMarginLeft: @20,
                }
        ]
};

model = [MPDataModel new];
model.title = @"Milker";
model.age = 12;
model.info = @{
        @"school": @{
                @"name": @"MIT",
                @"address": @"USA"
        }
};
[UIView createSubViewsByLayout:layout rootView:self.view context:self style:nil data:model];
```

常用表达式：

* `{{ gender == 1 ? '男' : '女' }}`
* 取值采用`ONGL`机制: `a.b.c.x` 可以串联字典或 model.

视图更新：

```
model.title = @"Milker"; = @"Jack";
[self.view updateViewWithData:model];
```

## 常用属性说明

### FlexBox布局属性

* 参见：`UIView+MKYogaStyle.h`

### 通用属性

* kLCorner: 圆角, 支持单圆角设置，逻辑尺寸
* kLBorder: 边框, "$Width $Color"
* kLShadow: 阴影,

### UIView

* kLView: 字符串/class, 指定视图类名或类型
* kLSubviews: 数组，子视图集合
* kLStyle: 样式名，多个样式用 空格 分开
* kLUri: 字符串，路由值
* kLBindTap: 字符串，函数名，点击事件
* kLBindTouch: 字符串，函数名，Touch事件
* kLAlias: 字符串，注入视图的别名
* kLObj: 任何，视图的附加对象

### UILabel

* kLFont: 普通字体
* kLBoldFont: 加粗字体
* kLMaxLines: 最大行数
* kLTextAlignment: 文本对齐
* ...

### UIButton

* kLTitle: 文字标题
* kLBg_Highlight：高亮背景色
* kLBg_Disabled: 不可用时背景色
* ...

### UIImageView

* kLImagePath: 本地图片、网络图片，路径或url
* kLImageName: 工程图标
* kLContentMode: 图片裁剪方式
* kLPlaceHolder: 占位图

### UIScrollView

由于UIScrollView的特殊性，封装了一层，可以方便使用

* kLFlexDirection: 置顶横向或纵向的滚动方式
* kLBouncesEnabled: 置顶是否有弹性效果
* kLPagingEnabled，kLShowsHorizontalScrollIndicator，kLShowsVerticalScrollIndicator 等

...