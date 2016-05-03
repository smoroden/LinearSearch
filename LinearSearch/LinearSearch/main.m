//
//  main.m
//  LinearSearch
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>

int binarySearch(NSMutableArray *array, int target, int start, int end);
int linearSearch(NSMutableArray *array, int target);

int MILLION = 1000000;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *array = [@[] mutableCopy];
        
        for (int i = 0; i < MILLION; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
        
        NSDate *methodStart = [NSDate date];
        
        int index = linearSearch(array, 999999);
        
        NSDate *methodEnd = [NSDate date];
        
        NSTimeInterval executionTime = [methodEnd timeIntervalSinceDate:methodStart];
        NSLog(@"Execution time for linear search: %f Index: %d", executionTime, index);
        
        methodStart = [NSDate date];
        
        index = binarySearch(array, 999999, 0, [[NSNumber numberWithUnsignedInteger:array.count] intValue]);
        
        methodEnd = [NSDate date];
        
        executionTime = [methodEnd timeIntervalSinceDate:methodStart];
        NSLog(@"Execution time for binary search: %f Index: %d", executionTime, index);
        
    }
    return 0;
}

int linearSearch(NSMutableArray *array, int target) {
    for (int i = 0; i < array.count; i++) {
        if([array[i] intValue] == target) {
            return i;
        }
    }
    return -1;
}

int binarySearch(NSMutableArray *array, int target, int start, int end) {

    int mid = (start + end) / 2;
    
    if ([array[mid] intValue] == target) {
        return mid;
    } else if ([array[mid] intValue] > target) {
        return binarySearch(array, target, start, mid -1);
    } else if ([array[mid] intValue] < target) {
        return binarySearch(array, target, mid+1, end);
    }
    return -1;
}
