//
//  QueueProtocol.h
//  CreateQueueUsingArray
//
//  Created by mac on 2019/4/24.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 这里假定元素为NSInteger类型 */
typedef NSInteger QueueElement;

/** 队列协议 */
@protocol QueueProtocol <NSObject>

/** 入队 */
- (void)enqueueWithElement:(QueueElement)element;

/** 出队 */
- (QueueElement)dequeue;

/** 返回队首元素 */
- (QueueElement)peek;

/** 返回队列对象个数 */
- (NSInteger)size;

/** 队列是否为空 */
- (BOOL)isEmpty;
@end
