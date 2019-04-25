//
//  BinaryTree.h
//  TheDepthOfBinaryTree
//
//  Created by mac on 2019/4/25.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

/** 二叉树 */
@interface BinaryTree : NSObject

/** 根节点 */
@property (readonly, nonatomic) TreeNode *rootNode;

/** 深度 */
@property (readonly, nonatomic) NSInteger depth;

/** 创建前序遍历二叉树 */
- (instancetype)initWithPreOrderInfo:(NSArray *)preOrderInfo;

/** 前序遍历二叉树 */
- (void)traverseBinaryTreeInPreOrder;

/** 层序遍历二叉树（广度优先遍历） */
- (void)traverseBinaryTreeInLevelOrder;

@end
