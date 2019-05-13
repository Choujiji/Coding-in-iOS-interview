//
//  main.m
//  FastSort
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *fastSort(NSArray *source) {
    if (source.count <= 1) {
        // 不可再分
        return source;
    }
    NSMutableArray *smallerInfo = [NSMutableArray arrayWithCapacity:10];
    NSMutableArray *biggerInfo = [NSMutableArray arrayWithCapacity:10];
    
    // 取第一个为标准值
    NSNumber *pivotItem = [source firstObject];
    
    for (NSUInteger index = 1; index < source.count; index += 1) {
        NSNumber *item = source[index];
        if ([item compare:pivotItem] == NSOrderedAscending) {
            [smallerInfo addObject:item];
        } else {
            [biggerInfo addObject:item];
        }
    }
    
    // 合并返回（分别对smaller和bigger数组递归排序）
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:10];
    [result addObjectsFromArray:fastSort(smallerInfo)];
    [result addObject:pivotItem];
    [result addObjectsFromArray:fastSort(biggerInfo)];
    
    return result;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *source = @[@13, @25, @2, @7, @10, @99, @1];
        NSArray *result = fastSort(source);
        NSLog(@"%@", result);
    }
    return 0;
}
