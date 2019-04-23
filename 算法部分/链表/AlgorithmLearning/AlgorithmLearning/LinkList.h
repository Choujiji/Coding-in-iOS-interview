//
//  LinkList.h
//  AlgorithmLearning
//
//  Created by mac on 2019/4/23.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkNode.h"

/** 单链表 */
@interface LinkList : NSObject

/** 链表头节点 */
@property (readonly, nonatomic) LinkNode *head;
/** 链表尾节点 */
@property (readonly, nonatomic) LinkNode *tail;

- (void)addLinkNode:(LinkNode *)node;

@end
