//
//  ViewController.m
//  自定义轮播图
//
//  Created by lanou3g on 15/10/31.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "ViewController.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kA 5

@interface ViewController ()<UIScrollViewDelegate>

// UIScrollView
@property (nonatomic, retain) UIScrollView * scrollView;

// UIPageControl
@property (nonatomic, retain) UIPageControl * pageControl;

// 计时器
@property (nonatomic, assign) NSInteger temp;
// NSTimer
@property (nonatomic, retain) NSTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
#pragma mark -- UIScrollView
    // 创建UIScrollView
    // 初始化
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, kWidth - 20, kHeight - 40)];
    // 设置存储几个图片
    _scrollView.contentSize = CGSizeMake((kWidth - 20) * kA, 0);
    // 是否整页翻过
    _scrollView.pagingEnabled = YES;
    // 遇到边界是否反弹
    _scrollView.bounces = NO;
    // 隐藏横向滑动时的底部滑块
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _scrollView.delegate = self;
    // 设置其不可点击
    _scrollView.scrollEnabled = YES;
    
    [self.view addSubview:_scrollView];
    
    // 创建数组存放所有图片
    NSMutableArray * imageArray = [NSMutableArray arrayWithObjects:@"sa_1.jpg", @"sa_3.jpg", @"sa6.jpg", @"sa7.jpg", @"sa8.jpg", nil];
    
    // 循环创建 5 个UIImageView
    for (int i = 0; i < 5; i ++) {
        
        // 将图片转换成UIImage类型
        UIImage * img = [UIImage imageNamed:imageArray[i]];
        
        // 创建UIImageView
        UIImageView * pictureView = [[UIImageView alloc] initWithImage:img];
        pictureView.frame = CGRectMake(0 + i *(kWidth - 20), 0, kWidth - 20, kHeight - 40);
        
        // 将UIImageView添加到UIScrollView上
        [_scrollView addSubview:pictureView];
    }
    
    
#pragma mark -- UIPageControl
    // 创建UIPageControl
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kWidth - 20) - (kWidth - 20)/ 5   , kHeight - (kHeight - 40)/ 10 , (kWidth - 20)/ 5, (kHeight - 40)/ 10)];
    // 设置点的个数
    _pageControl.numberOfPages = kA;
    // 设置未选中点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor greenColor];
    // 设置选中点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    // 当只有一个点的时候隐藏
    _pageControl.hidesForSinglePage = YES;
    
    self.pageControl.currentPage = 0;
    
    // 添加事件
    //[_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_pageControl];
    
    
#pragma mark -- NSTimer
    //创建计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(autoMove:) userInfo:nil repeats:YES];
    self.temp = self.pageControl.currentPage;
    [_timer fire];
}

// 自动轮播
- (void)autoMove:(NSTimer *)sender{
    // 每次改变 UIScrollView 的偏移量 与 UIPageControl的值
    self.pageControl.currentPage = self.temp;
    self.scrollView.contentOffset = CGPointMake((kWidth - 20) * self.pageControl.currentPage, 0);
    NSLog(@"%ld", self.pageControl.currentPage);
    /*
    // 添加动画效果
    CATransition * tran = [CATransition animation];
    // 设置持续时间
    tran.duration = 2;
    // 设置样式
    tran.type = kCATransitionPush;
    // 设置过度方向
    tran.subtype = kCATransitionFromRight;
    // 将动画添加到 UIScrollView的layer上面
    [_scrollView.layer addAnimation:tran forKey:@"tran"];
    */
    
    
    
    // 当播到最后一张时 返回第一张
    if (_temp == 5) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.pageControl.currentPage = 0;
        _temp = 0;
    }
    // 每次自增
    _temp ++;
    
 
}

// UIScrollView 相关事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 滑动UIScrollView 时 NSTimer 延迟 , 延迟 3 秒之后 在次 自动轮播
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    // 改变UIScrollView的时候改变UIPageControl
    self.pageControl.currentPage = _scrollView.contentOffset.x / (kWidth - 20);
    self.temp = self.pageControl.currentPage;
}

// 点击UIPageControl的时候 改变UIScrollView
- (void)changePage:(UIPageControl *)sender{
    self.scrollView.contentOffset = CGPointMake((kWidth - 20) * sender.currentPage, 0);
    self.temp = self.pageControl.currentPage;
}



/*
 以下是基本的四种效果
 kCATransitionPush 推入效果
 kCATransitionMoveIn 移入效果
 kCATransitionReveal 截开效果
 kCATransitionFade 渐入渐出效果
 
 以下API效果可以安全使用
 cube 方块
 suckEffect 三角
 rippleEffect 水波抖动
 pageCurl 上翻页
 pageUnCurl 下翻页
 oglFlip 上下翻转
 cameraIrisHollowOpen 镜头快门开
 cameraIrisHollowClose 镜头快门开
 
 
 以下API效果请慎用
 spewEffect 新版面在屏幕下方中间位置被释放出来覆盖旧版面.
 genieEffect 旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
 unGenieEffect 新版面在屏幕左下方或右下方被释放出来覆盖旧版面.
 twist 版面以水平方向像龙卷风式转出来.
 tubey 版面垂直附有弹性的转出来.
 swirl 旧版面360度旋转并淡出, 显示出新版面.
 charminUltra 旧版面淡出并显示新版面.
 zoomyIn 新版面由小放大走到前面, 旧版面放大由前面消失.
 zoomyOut 新版面屏幕外面缩放出现, 旧版面缩小消失.
 oglApplicationSuspend 像按”home” 按钮的效果.
 */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
