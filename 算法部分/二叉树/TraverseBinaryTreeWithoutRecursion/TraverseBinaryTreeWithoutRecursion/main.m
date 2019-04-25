//
//  main.m
//  TraverseBinaryTreeWithoutRecursion
//
//  Created by mac on 2019/4/25.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 前序节点字符串（“#”为补足后的扩展二叉树节点）
        NSArray *preTreeInfo = @[@"A", @"B", @"D", @"#",
                                 @"#", @"#", @"C", @"E",
                                 @"#", @"#", @"F", @"#",
                                 @"#"];
        
        // 创建前序二叉树
        BinaryTree *binaryTree = [[BinaryTree alloc] initWithPreOrderInfo:preTreeInfo];
        // 遍历所有结点
        [binaryTree traverseBinaryTreeInPreOrder];
        
        NSLog(@"depth = %ld", binaryTree.depth);

    }
    return 0;
}
