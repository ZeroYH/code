//
//  CustomPageControl.h
//  UI7_CustomPageControl
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 yrh.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPageControl : UIView

// 总共页数
@property (nonatomic, assign) int numberOfPages;
// 当前页
@property (nonatomic, assign) int currentPage;
// 选中的颜色
@property (nonatomic, retain) UIColor * selectedColor;
// 未选中的颜色
@property (nonatomic, retain) UIColor * nuSelectedColor;
// 设置圆角
@property (nonatomic, assign) BOOL isCircle;

@end
