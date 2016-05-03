//
//  main.m
//  LinearSearch
//
//  Created by Zach Smoroden on 2016-05-03.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>

int linearSearch(NSMutableArray *array, int target);

int MILLION = 1000000;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *array = [@[] mutableCopy];
        
        for (int i = 0; i < MILLION; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
        
        NSDate *methodStart = [NSDate date];
        
        linearSearch(array, 999999);
        
        NSDate *methodEnd = [NSDate date];
        
        NSTimeInterval executionTime = [methodEnd timeIntervalSinceDate:methodStart];
        NSLog(@"Execution time: %f", executionTime);
        
    }
    return 0;
}

int linearSearch(NSMutableArray *array, int target) {
    for (int i = 0; i < array.count; i++) {
        if([array[i] integerValue] == target) {
            return i;
        }
    }
    return -1;
}
