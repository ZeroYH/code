//
//  MulticolorView.h
//  colorRoit
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 原理:
 
 1. 改变view的backedlayer为渐变色layer
 
 2. 给这个view添加一个shapeLayer
 
 3. 将这个shapeLayer当这个view的backedlayer
 
 4. 动画
 
 5. 结束
 
 */

@interface MulticolorView : UIView

// 圆的线宽
@property (nonatomic, assign) CGFloat lineWidth;
// 秒
@property (nonatomic, assign) CFTimeInterval sec;
// 百分比
@property (nonatomic, assign) CGFloat percent;
// 颜色组（CGColor）
@property (nonatomic, strong) NSArray * colors;



// 开始
- (void)startAnimation;
// 结束
- (void)endAnimation;

@end
