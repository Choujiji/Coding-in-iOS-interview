//
//  Queue.m
//  CreateQueueUsingArray
//
//  Created by mac on 2019/4/24.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import "Queue.h"

@interface Queue ()

/** 左半部分（用于出队时使用） */
@property (strong, nonatomic) NSMutableArray *leftPartInfo;

/** 右半部分（真正存储数据使用）*/
@property (strong, nonatomic) NSMutableArray *rightPartInfo;

@end

@implementation Queue

- (instancetype)init {
    if (self = [super init]) {
        _leftPartInfo = [[NSMutableArray alloc] initWithCapacity:10];
        _rightPartInfo = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

- (QueueElement)dequeue {
    if (!self.leftPartInfo.count) {
        // 从right数组中反序存入
        self.leftPartInfo = [[[self.rightPartInfo reverseObjectEnumerator] allObjects] mutableCopy];
        // 清除right数组
        [self.rightPartInfo removeAllObjects];
    }
    // 从left数组中弹出尾部数据（得到的即为最早入队的元素）
    NSNumber *item = [self.leftPartInfo lastObject];
    if (!item) {
        return NAN;
    }
    [self.leftPartInfo removeObject:item];
    return item.integerValue;
}

- (void)enqueueWithElement:(QueueElement)element {
    // right数组作为实质的存储容器
    [self.rightPartInfo addObject:@(element)];
}

- (BOOL)isEmpty {
    return (!self.leftPartInfo.count)
                && (!self.rightPartInfo);
}

- (QueueElement)peek {
    // 队首元素，即为left数组的尾部元素 或 right数组的头部元素
    // 【原因：这里无需移动元素】
    
    NSNumber *item;
    if (self.leftPartInfo.count) {
        item = self.leftPartInfo.lastObject;
    } else {
        item = self.rightPartInfo.firstObject;
    }
    
    return item ? item.integerValue : NAN;
}

- (NSInteger)size {
    return self.leftPartInfo.count + self.rightPartInfo.count;
}

@end
