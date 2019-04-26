//
//  main.m
//  BubbleSort
//
//  Created by mac on 2019/4/26.
//  Copyright © 2019年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sourceLength = 8;
        int source[8] = {6, 89, 22, 10, 47, 101, 3, 0};
        
        // 外循环为总体比较的趟数（有几个数字就需要排几趟）
        for (int trip = 0; trip < sourceLength; trip += 1) {
            // 内循环为每一趟需要比较的次数（比如，第一趟8个数，两两比较，则需要比较7次，即由于每一趟都会比较出去一个数，故每一趟需要比较的数量会比该趟数字总数少1）
            for (int time = 0; time < sourceLength - trip - 1; time += 1) {
                // 相邻两数交换
                int var1 = source[time];
                int var2 = source[time + 1];
                if (var1 > var2) {
                    int temp = var1;
                    var1 = var2;
                    var2 = temp;
                    source[time] = var1;
                    source[time + 1] = var2;
                }
            }
        }
        
        for (int index = 0; index < sourceLength; index += 1) {
            printf("%d - ", source[index]);
        }
    }
    return 0;
}
