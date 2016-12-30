//
//  WZYCrashHandler.m
//  WZY
//
//  Created by CoderZYWang on 2016/11/2.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "WZYCrashHandler.h"

@implementation WZYCrashHandler

+ (void)uploadCrashLog {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"Exception.txt"];
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (str) {
        
        // 00 打印崩溃日志（debug 时可以用）
        NSLog(@"str --- %@", str);
        
        // 01 存在崩溃日志则上传到服务器（常用做法，方便发布状态下的崩溃信息收集）
        // 这里写你服务器的上传接口

        [fileManager removeItemAtPath:filePath error:nil]; // 上传成功后记得删除沙盒中保存的上一次的崩溃日志信息（这句话写在上传接口回调里面）
        
        
        // 02 存在崩溃日志发送到邮箱
//        NSString *mailUrl = [NSString stringWithFormat:@"mailto:CoderZYWang@yeah.net?subject=程序异常崩溃,请配合处理。&body=%@", str];
        // 打开地址
//        NSString *mailPath = [mailUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailPath]];
        
    }
}

@end




