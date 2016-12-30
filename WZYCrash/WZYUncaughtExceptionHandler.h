//
//  WZYUncaughtExceptionHandler.h
//  WZY
//
//  Created by CoderZYWang on 2016/11/2.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZYUncaughtExceptionHandler : NSObject

+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler*)getHandler;

@end
