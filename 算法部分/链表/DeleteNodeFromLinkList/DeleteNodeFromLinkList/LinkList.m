//
//  LinkList.m
//  AlgorithmLearning
//
//  Created by mac on 2019/4/23.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import "LinkList.h"

@interface LinkList ()

@property (strong, nonatomic) LinkNode *head;
@property (strong, nonatomic) LinkNode *tail;

@end

@implementation LinkList

- (instancetype)init {
    if (self = [super init]) {
        // 创建头节点
        LinkNode *dummy = [LinkNode new];
        dummy.data = NAN;
        dummy.next = nil;
        _head = dummy;
        _tail = dummy;
    }
    return self;
}

- (void)addLinkNode:(LinkNode *)node {
    self.tail.next = node;
    // 尾节点更新
    self.tail = node;
}

- (NSString *)description {
    NSMutableArray *info = [[NSMutableArray alloc] initWithCapacity:10];
    
    LinkNode *tmpNode = self.head.next;
    while (tmpNode) {
        [info addObject:@(tmpNode.data)];
        tmpNode = tmpNode.next;
    }
    
    return [info componentsJoinedByString:@"->"];
}

@end
