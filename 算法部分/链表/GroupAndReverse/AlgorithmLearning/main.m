//
//  main.m
//  AlgorithmLearning
//
//  Created by mac on 2019/2/20.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkNode.h"

/** 翻转链表 */
LinkNode *reverseLinkList(LinkNode *linkList) {
    // 只有自身一个
    if (!linkList.data || !linkList.next) {
        // 直接返回自身
        return linkList;
    }
    
    // 超过一个的，子链表递归翻转
    LinkNode *result = reverseLinkList(linkList.next);
    
    // 头结点的next这时已经指向的是，翻转后result链表的尾部节点，
    // 让尾部节点的next指向原头节点
    linkList.next.next = linkList;
    // 原头节点作为尾部节点
    linkList.next = nil;
    
    // 返回反转后的头节点
    return result;
}


/** 分组并翻转链表 */
LinkNode *groupAndReverseLinkList(LinkNode *linkList, NSInteger groupSize) {
    // 声明头指针
    LinkNode *head = linkList;
    
    // 取出一组
    for (NSInteger index = 1; index < groupSize && head; index += 1) {
        head = head.next;
    }
    
    if (!head) {
        // 不足一组（不足groupSize时，当前node已经为空）
        // 不做反转，直接返回
        return linkList;
    }
    
    // 够一组，将此组与后面链表分隔
    
    // 后面的子表
    LinkNode *tail = head.next;
    
    // 原满足的组作为单独组
    head.next = nil;
    // 将满足的组进行反转
    LinkNode *resultHead = reverseLinkList(linkList);
    
    // 子表继续递归操作
    LinkNode *result = groupAndReverseLinkList(tail, groupSize);
    
    
    // 连接两部分（反转后的满足组，尾部节点为原头节点）
    linkList.next = result;
    
    return resultHead;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建链表
        
        // 链表头结点
        LinkNode *head = [LinkNode new];
        
        LinkNode *nextNode = nil;
        for (NSInteger index = 8; index > 0; index -= 1) {
            LinkNode *node = [LinkNode new];
            node.data = index;
            // 指向下一个node
            node.next = nextNode;
            
            // 当前node标记为nextNode
            nextNode = node;
        }
        
        head.next = nextNode;
        NSLog(@"%@", head.next);
        
        // 翻转链表
        head.next = reverseLinkList(head.next);
        
        // 从前向后进行分组翻转
        LinkNode *result = groupAndReverseLinkList(head.next, 3);
        
        // 翻转链表（得到从后向前的分组结果）
        head.next = reverseLinkList(result);
        
        NSLog(@"%@", head.next);
    }
    return 0;
}

