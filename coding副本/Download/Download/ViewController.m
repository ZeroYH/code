//
//  ViewController.m
//  Download
//
//  Created by 陈伟捷 on 15/11/11.
//  Copyright © 2015年 chenweijie. All rights reserved.
//

#import "ViewController.h"
#import "Download.h"
#import "DownloadManagment.h"
#import "SqliteManager.h"

@interface ViewController ()

{
    CGFloat downloadSpeed;
}

@property (weak, nonatomic) IBOutlet UILabel *progress;

@property (weak, nonatomic) IBOutlet UILabel *speed;
@property (weak, nonatomic) IBOutlet UILabel *savePath;

@property (nonatomic, strong)Download *download;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = NSTemporaryDirectory();
    
    NSLog(@"%@", str);
    
    DownloadManagment *downloadManagment = [DownloadManagment shareDownloadManagment];
    
//    self.download = [[Download alloc]initWithURL:@"http://baobab.cdn.wandoujia.com/1447163643457322070435.mp4"];
    
    
    self.download = [downloadManagment addDownloadWithUrl:@"http://baobab.cdn.wandoujia.com/1447163643457322070435.mp4"];
    
    [_download resume];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(speed:) userInfo:nil repeats:YES];
    downloadSpeed = 0.0;
    
    [_download downloadFinish:^(NSString *savePath) {
        self.savePath.text = savePath;
        [timer invalidate];
    } downloading:^(float progress, float bytesWritten) {
        self.progress.text = [NSString stringWithFormat:@"%.2f%%", progress];
        downloadSpeed += bytesWritten / 1024;
    }];
    
}

// 下载进度显示
- (void)speed:(NSTimer *)timer
{
    _speed.text = [NSString stringWithFormat:@"%0.2fkb/s", downloadSpeed];
    downloadSpeed = 0;
}

- (IBAction)resume:(id)sender {
    [_download resume];
}

- (IBAction)suspend:(id)sender {
    [_download suspend];
}

/*
// 完成下载的代理方法
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    // 1.NSURL location 我们下载完成后的位置
    
    // 2.NSError 下载错误的信息
    
    // 1.把下载完成的文件转移走 不然会被系统删除
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    // downloadTask.response.suggestedFilename使用服务器使用的名字
    NSString *savePath = [cache stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    NSLog(@"%@", cache);
    // 2.创建NSFileManager,进行文件转移
    NSFileManager *fm = [NSFileManager defaultManager];
    // 3.转移文件(保存文件)
    [fm moveItemAtPath:location.path toPath:savePath error:nil];
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    // bytesWritten 本次下载字节数 下载速度
    
    // totalsBytesWritten 一共下载了多少的字节数
    
    // totalBytesExpectedToWrite 总字节数
    float progress =  (float)totalBytesWritten / totalBytesExpectedToWrite;
    NSLog(@"%f", progress);
}
*/
@end
