//
//  LinkNode.h
//  AlgorithmLearning
//
//  Created by mac on 2019/9/2.
//  Copyright © 2019 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinkNode : NSObject

@property (nonatomic, strong, nullable) LinkNode *next;

@property (nonatomic, assign) NSInteger data;

@end

NS_ASSUME_NONNULL_END
