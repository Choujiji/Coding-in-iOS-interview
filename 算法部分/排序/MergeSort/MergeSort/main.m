//
//  main.m
//  MergeSort
//
//  Created by mac on 2019/4/27.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 排序合并两个集合 */
NSArray *merge(NSArray *leftInfo, NSArray *rightInfo) {
    // 结果容器
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:10];
    
    //获取两者的迭代器
    NSEnumerator *enumerator1 = leftInfo.objectEnumerator;
    NSEnumerator *enumerator2 = rightInfo.objectEnumerator;
    
    // 依次取出二者的值，进行比较
    NSNumber *num1 = enumerator1.nextObject;
    NSNumber *num2 = enumerator2.nextObject;
    
    // 遍历排列结束，否则一直执行【这里使用升序排列】
    while (true) {
        if ([num1 compare:num2] == NSOrderedAscending) {
            // 插入小的num1
            [result addObject:num1];
            NSNumber *nextNum1 = enumerator1.nextObject;
            if (nextNum1) {
                // 若left还存在对象，指针后移【继续比较】
                num1 = nextNum1;
            } else {
                // left已空，依次插入right元素
                [result addObject:num2];
                NSNumber *nextNum2 = enumerator2.nextObject;
                while (nextNum2) {
                    [result addObject:nextNum2];
                    nextNum2 = enumerator2.nextObject;
                }
                // 合并结束，退出
                break;
            }
        } else {
            // 插入小的num2
            [result addObject:num2];
            NSNumber *nextNum2 = enumerator2.nextObject;
            if (nextNum2) {
                // right还存在对象，指针后移【继续比较】
                num2 = nextNum2;
            } else {
                // right已空，将left依次插入
                [result addObject:num1];
                NSNumber *nextNum1 = enumerator1.nextObject;
                while (nextNum1) {
                    [result addObject:num1];
                    nextNum1 = enumerator1.nextObject;
                }
                // 合并结束，退出
                break;
            }
        }
    }
    
    return result;
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
