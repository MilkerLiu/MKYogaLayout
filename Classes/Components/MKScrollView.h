//
// Created by Milker on 2019-08-06.
//
#import <UIKit/UIKit.h>

//static const NSString *kLFlexDirection = @"flexDirection"; /// 横向滚动还是纵向滚动, 默认为纵向滚动，此属性需设置

static const NSString *kLBouncesEnabled = @"sc_bounces"; /// 弹簧效果, 默认开启
static const NSString *kLPagingEnabled = @"sc_paging"; /// 分页效果, 默认关闭
static const NSString *kLShowsHorizontalScrollIndicator = @"sc_showsHorizontalScrollIndicator"; /// 横向滚动条， 默认开启
static const NSString *kLShowsVerticalScrollIndicator = @"sc_showsVerticalScrollIndicator"; /// 纵向滚动条， 默认开启


@interface MKScrollView : UIScrollView
@property (nonatomic, strong, readonly) UIView *contentView; /// 内容展示的容器
@end