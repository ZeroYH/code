//
//  CustomPageControl.m
//  UI7_CustomPageControl
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 yrh.com. All rights reserved.
//

#import "CustomPageControl.h"
// 间隔
#define kPointSpace 5
// 宽度
#define kPointWidth 10
#define kPointHeight 10

@interface CustomPageControl ()
@property (nonatomic, retain)UIView * contentView;


@end


@implementation CustomPageControl

- (void)dealloc{
    
    [_selectedColor release];
    [_nuSelectedColor release];
    [super dealloc];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentPage = 0;
        self.numberOfPages = 0;
        self.selectedColor = [UIColor redColor];
        self.nuSelectedColor = [UIColor blackColor];
    }
    return self;
}

- (void)setCurrentPage:(int)currentPage{
    if (_currentPage != currentPage) {
        UIView * aView = [self viewWithTag:1000 + _currentPage];
        aView.backgroundColor = _nuSelectedColor;
    }
    
    _currentPage = currentPage;
    UIView * aView = [self viewWithTag:1000 + _currentPage];
    aView.backgroundColor = _selectedColor;
    
}

- (void)setNumberOfPages:(int)numberOfPages{
    if (_numberOfPages != numberOfPages) {
        for (int i = 0; i < _numberOfPages; i ++) {
            [(UIView *)[self viewWithTag:1000 + i]removeFromSuperview];
        }
    }else if (_numberOfPages == numberOfPages){
        return;
    }
    _numberOfPages = numberOfPages;
    self.contentView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, (kPointSpace + kPointWidth) * _numberOfPages - kPointSpace, 20)] autorelease];
    
    for (int i = 0; i < _numberOfPages; i ++) {
        UIView * aView = [[UIView alloc] initWithFrame:CGRectMake((kPointSpace + kPointWidth) * i, (20 - kPointHeight)/2, kPointWidth, kPointHeight)];
        aView.tag = 1000 + i;
        
        if (_isCircle == YES) {
            aView.layer.masksToBounds = YES;
            aView.layer.cornerRadius = kPointWidth / 2;
        }
        
        if (i == _currentPage) {
            aView.backgroundColor = _selectedColor;
        }else {
            aView.backgroundColor = _nuSelectedColor;
        }
        
        
        [_contentView addSubview:aView];
        [aView release];
    }
    _contentView.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y - self.frame.origin.y);
    [self addSubview:_contentView];
    
}

- (void)setSelectedColor:(UIColor *)selectedColor{
    if (_selectedColor != selectedColor) {
        [_selectedColor release];
        _selectedColor = [selectedColor retain];
    }
    
    _selectedColor = selectedColor;
    
    UIView * aView = [self viewWithTag:1000 + _currentPage];
    aView.backgroundColor = _selectedColor;
    
    
    
    
    
}

- (void)setNuSelectedColor:(UIColor *)nuSelectedColor{
    
    if (_nuSelectedColor != nuSelectedColor) {
        [_nuSelectedColor release];
        _nuSelectedColor = [nuSelectedColor retain];
    }
    _nuSelectedColor = nuSelectedColor;
    
    for (int i = 0; i < _numberOfPages; i ++) {
        UIView * aView = [self viewWithTag:1000 + i];
        if (i == _currentPage) {
            aView.backgroundColor = _selectedColor;
        }else {
            aView.backgroundColor = _nuSelectedColor;
        }
    }
    
    
}


- (void)setIsCircle:(BOOL)isCircle{
    _isCircle = isCircle;
    if (_isCircle == YES) {
        for (int i = 0; i < _numberOfPages; i ++) {
            UIView * aView = [ self viewWithTag:1000 + i];
            aView.layer.masksToBounds = YES;
            aView.layer.cornerRadius = kPointWidth / 2;
        }
    }
    
    
    
    
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
