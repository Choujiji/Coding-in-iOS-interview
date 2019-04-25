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
    // 【非递归方式遍历】
    
    // 节点数组（实现关键）
    NSMutableArray *nodeInfo = [NSMutableArray arrayWithCapacity:10];
    // 当前节点指针（初始指向根节点，对应前序遍历）
    TreeNode *currentNode = preOrderTree;
    
    // 前序遍历顺序，即从根节点开始，一直查找左节点；到头之后，依次从子到根节点查看上一个节点的右节点
    while (nodeInfo.count > 0 || currentNode) {
        if (currentNode) {
            // 此节点作为子树的根
            // 记录值（访问了“根”）
            // 注意：占位节点不考虑
            if (currentNode.data) {
                NSLog(@"%@", currentNode.data);
                // 加入节点容器
                [nodeInfo addObject:currentNode];
            }
            
            // 继续查找左子节点（访问“左”）
            currentNode = currentNode.leftChild;
        } else {
            // 左子树为空，找到该子树的根节点
            // 根节点即保存在节点容器中（最后一个）
            TreeNode *subRootNode = [nodeInfo lastObject];
            // 出栈
            [nodeInfo removeObjectAtIndex:nodeInfo.count - 1];
            // 查找其右子树（访问“右”）
            currentNode = subRootNode.rightChild;
        }
    }
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
