//
//  main.m
//  SimplifyPath
//
//  Created by mac on 2019/4/24.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 简化路径 */
NSString *simplifyPath(NSString *originPath) {
    if (!originPath.length) {
        return originPath;
    }
    
    // 使用数组模拟“栈”的实现
    NSMutableArray *resultPathInfo = [NSMutableArray arrayWithCapacity:10];
    
    // 1. 使用“/”拆分路径信息
    NSArray *pathInfo = [originPath componentsSeparatedByString:@"/"];
    // 2. 遍历每个子串，根据情况处理
    for (NSString *item in pathInfo) {
        if ([item isEqualToString:@""]) {
            // 空目录，忽略
            continue;
        } else if ([item isEqualToString:@"."]) {
            // 当前目录，跳过
            continue;
        } else if ([item isEqualToString:@".."]) {
            // 上一级目录，出栈
            [resultPathInfo removeLastObject];
        } else {
            // 其他，进入对应子目录，入栈
            [resultPathInfo addObject:item];
        }
    }
    
    // 3. 最终，合并所有子路径
    NSString *resultPath = [resultPathInfo componentsJoinedByString:@"/"];
    resultPath = [NSString stringWithFormat:@"/%@", resultPath];
    
    return resultPath;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path = @"/a/./b/../../c/";
//        NSString *path = @"/home/";
//        NSString *path = @"/";
        NSString *resultPath = simplifyPath(path);
        NSLog(@"%@", resultPath);
    }
    return 0;
}
