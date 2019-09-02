//
//  LinkNode.m
//  AlgorithmLearning
//
//  Created by mac on 2019/9/2.
//  Copyright © 2019 jiji. All rights reserved.
//

#import "LinkNode.h"

@implementation LinkNode

- (NSString *)description {
    if (self.next) {
        return [NSString stringWithFormat:@"%ld -> %@", self.data, self.next];
    }
    return [NSString stringWithFormat:@"%ld", self.data];
}

@end
