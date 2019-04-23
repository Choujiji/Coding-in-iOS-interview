//
//  main.m
//  AlgorithmLearning
//
//  Created by mac on 2019/2/20.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkList.h"

/** 获取使用目标值分隔后的链表（前面的节点数据小于目标值，后面的结点数据不小于目标值） */
LinkList *getSeparateByTargetLinkList(LinkList *sourceList, NSInteger target) {
    LinkList *belowList = [LinkList new];
    LinkList *aboveList = [LinkList new];

    // 1. 遍历链表，根据目标值为别生成两子链表
    LinkNode *currentNode = sourceList.head.next;
    while (currentNode) {
        LinkNode *node = [LinkNode new];
        node.data = currentNode.data;
        if (currentNode.data < target) {
            [belowList addLinkNode:node];
        } else {
            [aboveList addLinkNode:node];
        }
        currentNode = currentNode.next;
    }
//    NSLog(@"belowList - %@", belowList);
//    NSLog(@"aboveList - %@", aboveList);

    // 2. 链表合并
    belowList.tail.next = aboveList.head.next;
    
    return belowList;
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LinkList *list = [LinkList new];
        
        NSArray *listInfo = @[@1, @5, @3, @2, @4, @2];
        for (NSNumber *item in listInfo) {
            LinkNode *node = [LinkNode new];
            node.data = item.integerValue;
            [list addLinkNode:node];
        }
        
        NSLog(@"%@", list);
        
        LinkList *resultList = getSeparateByTargetLinkList(list, 3);
        NSLog(@"resultList - %@", resultList);
    }
    return 0;
}

