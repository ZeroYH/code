//
//  MulticolorView.m
//  colorRoit
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 YH. All rights reserved.
//

#import "MulticolorView.h"

@interface MulticolorView ()
// 形状图层
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@end


@implementation MulticolorView
#pragma mark - 将当前View的layer替换成渐变色layer
//Class 一个不透明的类型代表一个objective - c类。
+ (Class)layerClass{
    // 梯度层
    return [CAGradientLayer class];
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _circleLayer = [CAShapeLayer layer];
    }
    return self;
}

#pragma mark - 配置颜色
- (void)setupMulticolor{
    // 获取当前的layer
    CAGradientLayer *gradientLayer = (CAGradientLayer *)[self layer];
    // 创建颜色数组
    NSMutableArray *colors = [NSMutableArray array];
    
    // 如果自定义颜色为空
    if (_colors == nil) {
        for (NSInteger hue = 0; hue <=360; hue +=10) {
            [colors addObject:(id)[UIColor colorWithHue:1.0 * hue / 360.0 saturation:1.0 brightness:1.0 alpha:1.0].CGColor];
        }
        // 给渐变色layer设置颜色
        [gradientLayer setColors:[NSArray arrayWithArray:colors]];
    }else {
        // 给渐变色layer设置颜色
        [gradientLayer setColors:_colors];
    }
    
}

#pragma mark - 配置圆形

- (CAShapeLayer *)produceCircleShapeLayer{
    // 生产出一个圆的路径
    // 圆心
    CGPoint circleCenter = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
    // 半径
    CGFloat circleRadius = 0;
    
    if (_lineWidth == 0){
        circleRadius = self.bounds.size.width/2.0 - 2;
    }else{
        circleRadius = self.bounds.size.width/2.0 - 2*_lineWidth;
    }
    // 贝塞尔曲线路径
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:circleCenter radius:circleRadius startAngle:M_PI endAngle:-M_PI clockwise:NO];
    //生产出一个圆形路径的layer
    _circleLayer.path = circlePath.CGPath;
    _circleLayer.strokeColor = [UIColor whiteColor].CGColor;
    _circleLayer.fillColor = [[UIColor clearColor] CGColor];
    
    if (_lineWidth == 0){
        _circleLayer.lineWidth = 1;
    }else{
        _circleLayer.lineWidth = _lineWidth;
    }
    
    // 可以设置出圆的完整性
    _circleLayer.strokeStart = 0;
    _circleLayer.strokeEnd = 1.0;
    
    return _circleLayer;
}

#pragma mark - Animation
- (void)startAnimation{
    // 设置渐变layer以及其颜色值
    [self setupMulticolor];
    
    // 生产一个圆形路径并设置成遮罩
    self.layer.mask = [self produceCircleShapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    if (_sec == 0){
        animation.duration = 5;
    }else{
        animation.duration = _sec;
    }
    
    animation.repeatCount = MAXFLOAT;
    animation.fromValue = [NSNumber numberWithDouble:0];
    animation.toValue = [NSNumber numberWithDouble:M_PI*2];
    [self.layer addAnimation:animation forKey:nil];
}


@synthesize percent = _percent;
-(CGFloat)percent{
    return _percent;
}

- (void)setPercent:(CGFloat)percent{
    if (_circleLayer){
        _circleLayer.strokeEnd = percent;
    }
}

- (void)endAnimation{
    [self.layer removeAllAnimations];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
