//
//  main.m
//  HeapSort
//
//  Created by mac on 2019/5/14.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray *siftDown(NSMutableArray *multableSource, NSUInteger startIndex, NSUInteger endIndex) {    
    while (1) {
        // 左孩子节点（右孩子为左孩子 + 1）
        NSUInteger leftChildIndex = 2 * startIndex + 1;
        
        if (leftChildIndex > endIndex) {
            break;
        }
        
        NSUInteger righrChiildIndex = leftChildIndex + 1;
        
        // 最大的子孩子节点索引
        NSUInteger maxChildIndex = leftChildIndex;
        
        // 获取孩子节点中的较大的
        // 存在右孩子节点，且右孩子节点数据更大
        if ((righrChiildIndex <= endIndex)
            && ([multableSource[righrChiildIndex] compare: multableSource[leftChildIndex]] == NSOrderedDescending)) {
            maxChildIndex = righrChiildIndex;
        }
        
        // 判断，若根节点小于子节点的数据，交换（即将子树的最大值作为根节点，创造”大根堆“）
        if ([multableSource[startIndex] compare: multableSource[maxChildIndex]] == NSOrderedAscending) {
            NSNumber *temp = multableSource[startIndex];
            multableSource[startIndex] = multableSource[maxChildIndex];
            multableSource[maxChildIndex] = temp;
            
            // 交换之后的子节点，以自身为根的子树是否符合要求（向下查找）
            startIndex = maxChildIndex;
        } else {
            // 父节点本身已经最大，退出
            break;
        }
    }
    
    
    
    
    return multableSource;
}

NSArray *heapSort(NSArray *source) {
    
    // 1. 初始化”大根堆“（从下到上，从最后一个有子节点的节点开始）
    // 获取最后一个有子节点的节点
    NSUInteger targetIndex = source.count / 2 - 1;
    // 从下到上调整
    NSMutableArray *heapInfo = [source mutableCopy];
    for (NSInteger index = targetIndex; index >= 0; index -= 1) {
        heapInfo = siftDown(heapInfo, index, heapInfo.count - 1);
    }
    
    NSLog(@"初始化”大根堆“完成 --- %@", heapInfo.description);

    // 2. 交换堆顶与堆尾，完成排序
    // 堆尾索引
    NSUInteger tailIndex = heapInfo.count - 1;
    while (tailIndex > 0) {
        // 堆顶索引
        NSUInteger headIndex = 0;
        
        // 交换
        NSNumber *temp = heapInfo[headIndex];
        heapInfo[headIndex] = heapInfo[tailIndex];
        heapInfo[tailIndex] = temp;
        
        // 队尾索引 - 1
        tailIndex -= 1;
        
        // 重新整理为”大根堆“（以便继续进行交换处理）
        heapInfo = siftDown(heapInfo, 0, tailIndex);
        NSLog(@"”大根堆“ --- %@", heapInfo.description);
    }
    
    return heapInfo;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *source = @[@16, @7, @3, @20, @17, @8];
        
        NSArray *result = heapSort(source);
        NSLog(@"%@", result);
    }
    return 0;
}
