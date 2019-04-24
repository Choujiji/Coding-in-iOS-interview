//
//  LinkNode.h
//  AlgorithmLearning
//
//  Created by mac on 2019/4/23.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 单链表节点 */
@interface LinkNode : NSObject

@property (assign, nonatomic) NSInteger data;
@property (strong, nonatomic) LinkNode *next;

@end
