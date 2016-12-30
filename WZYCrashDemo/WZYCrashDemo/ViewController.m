//
//  ViewController.m
//  WZYCrashDemo
//
//  Created by 奔跑宝BPB on 2016/12/30.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 测试代码(运行demo时打开)
    // 数组越界错误
//    NSArray *arr = @[@"123"];
//    NSLog(@"%@", arr[3]);
    
    // 再次运行程序，在崩掉之前会有我们的打印信息(str 就是我们收集的错误信息)
    /*
     2016-12-30 14:14:26.883423 WZYCrashDemo[2693:1047098] str ---
     - IDENTIFIER_NUMBER:   6185368C-0054-49C6-8614-F91EA96A5FF3
     - OSVERSION:   10.0.2
     - PHONE_TYPE:   iPhone 6s
     - APP_VERSION:   1.0
     - name:
     NSRangeException
     - reason:
     *** -[__NSSingleObjectArrayI objectAtIndex:]: index 3 beyond bounds [0 .. 0]
     - callStackSymbols:
     0   CoreFoundation                      0x00000001844181d8 <redacted> + 148
     1   libobjc.A.dylib                     0x0000000182e5055c objc_exception_throw + 56
     2   CoreFoundation                      0x0000000184409428 <redacted> + 0
     3   WZYCrashDemo                        0x00000001000d3178 -[ViewController viewDidLoad] + 188
     4   UIKit                               0x000000018a2613dc <redacted> + 1056
     5   UIKit                               0x000000018a260fa4 <redacted> + 28
     6   UIKit                               0x000000018a267750 <redacted> + 76
     7   UIKit                               0x000000018a264bf0 <redacted> + 272
     8   UIKit                               0x000000018a2d7414 <redacted> + 48
     9   UIKit                               0x00000
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
