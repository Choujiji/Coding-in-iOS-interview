//
//  main.m
//  DeleteNodeFromLinkList
//
//  Created by mac on 2019/4/24.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkList.h"

/** 从尾部删除指定节点 */
LinkList *deleteNodeFromTail(LinkList *list, NSInteger tailIndex) {
    // 1. 设置两个节点指针，索引相差个数为tailIndex
    // 2. 在确定位置后，同时开始遍历节点；当指针引遍历到链表尾部后停止
    // 3. 此时慢指针位置的next节点即为待删除节点
    
    if (tailIndex <= 0) {
        // 从尾部第一个开始算起
        return list;
    }
    
    NSInteger diffIndex = 0;
    
    // 均指向头结点
    LinkNode *fastNode = list.head;
    LinkNode *slowNode = list.head;
    
    while (diffIndex < tailIndex) {
        fastNode = fastNode.next;
        diffIndex += 1;
    }
    
    // 开始同时遍历
    while (fastNode.next) {
        fastNode = fastNode.next;
        slowNode = slowNode.next;
    }
    
    // 此时快指针已经到达末尾节点，慢指针的下一个就是待删除节点
    LinkNode *target = slowNode.next;
    
    // 删除该节点
    slowNode.next = target.next;
    target = nil;
    
    return list;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LinkList *list = [LinkList new];
        NSArray *info = @[@1, @2, @3, @4, @5];
        for (NSNumber *item in info) {
            LinkNode *node = [LinkNode new];
            node.data = item.integerValue;
            [list addLinkNode:node];
        }
        
        NSLog(@"%@", list);
        
        LinkList *result = deleteNodeFromTail(list, 2);
        NSLog(@"result - %@", result);

    }
    return 0;
}
