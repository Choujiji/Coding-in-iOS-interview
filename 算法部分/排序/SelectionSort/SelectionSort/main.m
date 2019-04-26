//
//  main.m
//  SelectionSort
//
//  Created by mac on 2019/4/26.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sourceLength = 8;
        int source[8] = {6, 89, 22, 10, 47, 101, 3, 0};
        
        // 外层循环为总共比较的趟数，每一趟会比较出一个最小（或最大）的数（依次放在最前），故总趟数与数字总数相同
        for (int trip = 0; trip < sourceLength; trip += 1) {
            // 内层循环为每一趟需要比较的总次数
            // 目的是找出最小（或最大）的数
            // 取出第一个数作为基准，与后面的数依次比较，共需要比较(n-1)次
            int minIndex = trip; // 注意：这里使用索引做记录，方便数组交换
            for (int times = trip + 1; times < sourceLength; times += 1) {
                int minVal = source[minIndex];
                int currentVal = source[times];
                if (currentVal < minVal) {
                    // 当前数字更小，则更新最小值索引
                    minIndex = times;
                }
            }
            // 此时，最小值的索引已经得到，与本趟开头索引对应的数据进行交换
            int temp = source[minIndex];
            source[minIndex] = source[trip];
            source[trip] = temp; // 现在，本趟的开头数据即为最小数据
        }
        
        for (int index = 0; index < sourceLength; index += 1) {
            printf("%d - ", source[index]);
        }
    }
    return 0;
}
