//
//  WZYUncaughtExceptionHandler.m
//  WZY
//
//  Created by CoderZYWang on 2016/11/2.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "WZYUncaughtExceptionHandler.h"
#import "WZYTools.h"

//!< 手机系统版本号
#define PHONE_VERSION [[UIDevice currentDevice] systemVersion]
//!< 设备对app供应商的唯一标示（对供应商的，也就是这个供应商有两个app，那么在这两个app上返回的这个标识是一致的）
#define IDENTIFIER_NUMBER [[[UIDevice currentDevice] identifierForVendor] UUIDString]
//!< 手机型号
#define PHONE_TYPE [WZYTools getPhoneType]
//!< app版本号
#define APP_VERSION [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]

NSString *applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols]; // 得到当前调用栈信息
    NSString *reason = [exception reason]; // 崩溃原因
    NSString *name = [exception name]; // 异常类型
    NSString *baseMessage = [NSString stringWithFormat:@"\n - IDENTIFIER_NUMBER:   %@\n - OSVERSION:   %@\n - PHONE_TYPE:   %@\n - APP_VERSION:   %@", IDENTIFIER_NUMBER, PHONE_VERSION, PHONE_TYPE, APP_VERSION]; // 设备基本的一些信息
    
    NSString *url = [NSString stringWithFormat:@"%@\n - name:\n%@\n - reason:\n%@\n - callStackSymbols:\n%@", baseMessage, name, reason, [arr componentsJoinedByString:@"\n"]];
    NSString *path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil]; // 将设备信息和崩溃日志写入到沙盒中
    // 除了可以选择写到应用下的某个文件，通过后续处理将信息发送到服务器等
    // 还可以选择调用发送邮件的的程序，发送信息到指定的邮件地址
    // 或者调用某个处理程序来处理这个信息
}

@implementation WZYUncaughtExceptionHandler

-(NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (void)setDefaultHandler
{
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
}

+ (NSUncaughtExceptionHandler*)getHandler
{
    return NSGetUncaughtExceptionHandler();
}

@end
