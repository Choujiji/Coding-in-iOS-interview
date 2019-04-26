//
//  main.m
//  InsertionSort
//
//  Created by mac on 2019/4/26.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sourceLength = 8;
        int source[8] = {6, 89, 22, 10, 47, 101, 3, 0};
        
        // 外层循环为已排序数组的个数，由于每趟结束后数组会扩充一个，故总趟数为数据总个数 - 1
        for (int trip = 1; trip < sourceLength; trip += 1) {
            // 内层循环为从每一趟未排列的数据中，依次取数据，在已排序数据中查找位置插入（在已排序数组中从后向前遍历）
            int targetVal = source[trip]; // 待插入的目标值
            int insertIndex = trip; // 待插入位置
            
            for (int times = trip - 1; times >= 0; times -= 1) {
                int currentVal = source[times];
                if (currentVal > targetVal) {
                    // 当前值更大，后移，给目标值让位
                    source[times + 1] = currentVal;
                    insertIndex = times; // 更新待插入位置
                }
            }
            // 遍历完成后，若插入位置改变，则将数据插入
            if (insertIndex != trip) {
                source[insertIndex] = targetVal;
            }
        }
        
        for (int index = 0; index < sourceLength; index += 1) {
            printf("%d - ", source[index]);
        }
    }
    return 0;
}
