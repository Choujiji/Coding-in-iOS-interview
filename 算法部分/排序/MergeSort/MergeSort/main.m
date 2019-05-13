//
//  main.m
//  MergeSort
//
//  Created by mac on 2019/4/27.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 排序合并两个集合 */
NSArray *merge(NSArray *source1, NSArray *source2) {
    NSMutableArray *resultInfo = [NSMutableArray arrayWithCapacity:source1.count + source2.count];
    
    NSUInteger index1 = 0;
    NSUInteger index2 = 0;
    
    // 遍历
    while ((index1 < source1.count)
           && (index2 < source2.count)) {
        NSNumber *item1 = source1[index1];
        NSNumber *item2 = source2[index2];
        // 比较（升序排列）：将小的所在数组索引后移
        if ([item1 compare:item2] == NSOrderedAscending) {
            [resultInfo addObject:item1];
            index1 += 1;
        } else {
            [resultInfo addObject:item2];
            index2 += 1;
        }
    }
    // 若数组还有剩余，将剩余元素直接插入
    if (index1 < source1.count) {
        NSArray *theLeftSource = [source1 subarrayWithRange:NSMakeRange(index1, source1.count - index1)];
        [resultInfo addObjectsFromArray:theLeftSource];
    }
    if (index2 < source2.count) {
        NSArray *theLeftSource = [source2 subarrayWithRange:NSMakeRange(index2, source2.count - index2)];
        [resultInfo addObjectsFromArray:theLeftSource];
    }
    
    // 返回合并结果
    return resultInfo;
}

/** 归并排序指定数组 */
NSArray *mergeSort(NSArray *sourceInfo) {
    NSUInteger sourceCount = sourceInfo.count;
    if (sourceCount <= 1) {
        // 最小，不可再分
        return sourceInfo;
    }
    
    // 从中间分割数组为两部分
    NSUInteger middleIndex = sourceCount / 2;
    NSArray *leftInfo = [sourceInfo subarrayWithRange:NSMakeRange(0, middleIndex)];
    NSArray *rightInfo = [sourceInfo subarrayWithRange:NSMakeRange(middleIndex, sourceCount - middleIndex)];
    
    // 继续分割
    leftInfo = mergeSort(leftInfo);
    rightInfo = mergeSort(rightInfo);
    
    // 二者排序合并，生成新的集合
    NSArray *result = merge(leftInfo, rightInfo);
    
    return result;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *source = @[@34, @11, @78, @6, @9, @12, @101, @45, @1];
        NSArray *result = mergeSort(source);
        NSLog(@"%@", result);
    }
    return 0;
}
