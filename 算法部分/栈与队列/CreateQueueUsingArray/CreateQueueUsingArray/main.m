//
//  main.m
//  CreateQueueUsingArray
//
//  Created by mac on 2019/4/24.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Queue *queue = [Queue new];
        
        // 数据入队
        [queue enqueueWithElement:1];
//        [queue enqueueWithElement:2];
//        [queue enqueueWithElement:3];
//        [queue enqueueWithElement:4];
//        [queue enqueueWithElement:5];

        NSInteger count = [queue size];
        NSLog(@"count = %ld", count);
        
        QueueElement headData = [queue peek];
        NSLog(@"headData - %ld", headData);
        
        // 连续出队
        NSInteger index = 0;
        while (index < 2) {
            QueueElement dequeueData = [queue dequeue];
            NSLog(@"dequeueData - %ld", dequeueData);
            
            index += 1;
        }
        
        count = [queue size];
        NSLog(@"after count = %ld", count);
        
        headData = [queue peek];
        NSLog(@"after headData - %ld", headData);
    }
    return 0;
}
