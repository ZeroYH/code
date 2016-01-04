//
//  ViewController.m
//  colorRoit
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 YH. All rights reserved.
//

#import "ViewController.h"
#import "MulticolorView.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) MulticolorView * showView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _showView = [[MulticolorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _showView.lineWidth = 1.f;
    _showView.sec = 2.f;
    _showView.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor cyanColor].CGColor,(id)[UIColor purpleColor].CGColor];
    _showView.center = self.view.center;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(event:) userInfo:nil repeats:YES];
    
    [self.view addSubview:_showView];
    [_showView startAnimation];
}


- (void)event:(id)object{
    _showView.percent = arc4random()%100/100.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
