//
//  TreeNode.h
//  TheDepthOfBinaryTree
//
//  Created by mac on 2019/4/25.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

/** 数据 */
@property (strong, nonatomic) NSString *data;
/** 左子节点 */
@property (strong, nonatomic) TreeNode *leftChild;
/** 右子节点 */
@property (strong, nonatomic) TreeNode *rightChild;

@end
