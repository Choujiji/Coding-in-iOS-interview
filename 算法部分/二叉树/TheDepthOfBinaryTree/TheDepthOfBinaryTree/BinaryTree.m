//
//  BinaryTree.m
//  TheDepthOfBinaryTree
//
//  Created by mac on 2019/4/25.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import "BinaryTree.h"

@interface BinaryTree ()

@property (strong, nonatomic) TreeNode *rootNode;

/** 前序遍历的完整信息（对应的扩展二叉树） */
@property (strong, nonatomic) NSMutableArray *preOrderInfo;

/** 前序创建二叉树 */
- (void)pCreateBinaryTreeInPreOrderWithTreeNode:(TreeNode *)tree;

/** 前序遍历二叉树 */
- (void)pTraversingBinaryTreeWithPreOrderWithTreeNode: (TreeNode *)preOrderTree;

/** 获取二叉树深度 */
- (NSInteger)pGetDepthOfBinaryTree:(TreeNode *)tree;

@end

@implementation BinaryTree

- (instancetype)initWithPreOrderInfo:(NSArray *)preOrderInfo {
    if (self = [super init]) {
        _rootNode = [TreeNode new];
        _preOrderInfo = [[NSMutableArray alloc] initWithArray:preOrderInfo copyItems:YES];
        // 前序解析创建
        [self pCreateBinaryTreeInPreOrderWithTreeNode:_rootNode];
    }
    return self;
}

- (void)traverseBinaryTreeInPreOrder {
    [self pTraversingBinaryTreeWithPreOrderWithTreeNode:self.rootNode];
}

- (void)traverseBinaryTreeInLevelOrder {
    // 设置队列（使用数组实现，每一次队列遍历都是一层节点），通过队列的先进先出方式实现遍历
    NSMutableArray *queue = [NSMutableArray arrayWithCapacity:10];
    
    // 第一层入队
    if (self.rootNode) {
        [queue addObject:self.rootNode];
    }
    
    // 按“层”遍历
    while (queue.count) {
        // 每一层挨个遍历【注意：每一层不能干扰其它层】
        NSInteger sizeOfLevel = queue.count;
        for (NSInteger index = 0; index < sizeOfLevel; index += 1) {
            // 节点出队
            TreeNode *node = [queue firstObject];
            [queue removeObjectAtIndex:0];
            
            // 占位节点，直接跳过
            if (!node.data) {
                continue;
            }
            
            // 访问
            NSLog(@"%@", node.data);
            
            // 查看左右子节点，构建下一层
            if (node.leftChild) {
                // 入队（为下一层准备）
                [queue addObject:node.leftChild];
            }
            if (node.rightChild) {
                // 入队（为下一层准备）
                [queue addObject:node.rightChild];
            }
            
        }
        
    }
    
}

- (NSInteger)depth {
    return [self pGetDepthOfBinaryTree:self.rootNode];
}


#pragma mark - private

- (void)pCreateBinaryTreeInPreOrderWithTreeNode:(TreeNode *)tree {
    
    NSString *rootData = self.preOrderInfo.firstObject;
    
    if (!rootData) {
        return;
    }
    
    //    NSLog(@"rootData = %@", rootData);
    
    [self.preOrderInfo removeObjectAtIndex:0];
    
    
    if ([rootData isEqualToString:@"#"]) {
        // 无此节点
        return;
    }
    
    // 根 - 左 - 右
    tree.data = rootData;
    
    tree.leftChild = [TreeNode new];
    [self pCreateBinaryTreeInPreOrderWithTreeNode:tree.leftChild];
    
    tree.rightChild = [TreeNode new];
    [self pCreateBinaryTreeInPreOrderWithTreeNode:tree.rightChild];
}

/** 前序遍历二叉树 */
- (void)pTraversingBinaryTreeWithPreOrderWithTreeNode: (TreeNode *)preOrderTree {
        // 无数据的为占位节点，跳过
    if (!preOrderTree || !preOrderTree.data) {
        return;
    }
    
        // 根 - 左 - 右
    NSLog(@"%@", preOrderTree.data);
   
    [self pTraversingBinaryTreeWithPreOrderWithTreeNode:preOrderTree.leftChild];
    [self pTraversingBinaryTreeWithPreOrderWithTreeNode:preOrderTree.rightChild];
}

- (NSInteger)pGetDepthOfBinaryTree:(TreeNode *)tree {
    // 注意：这里无数据的为占位节点
    if (!tree || !tree.data) {
        return 0;
    }
    
    // 存在节点，则自身深度为1
    // 总深度由子树深度决定
    NSInteger leftChildTreeDepth = [self pGetDepthOfBinaryTree:tree.leftChild];
    NSInteger rightChildTreeDepth = [self pGetDepthOfBinaryTree:tree.rightChild];
    NSInteger childTreeDepth = MAX(leftChildTreeDepth, rightChildTreeDepth);
    return 1 + childTreeDepth;
}
@end
