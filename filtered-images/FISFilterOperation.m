//
//  FISFilterOperation.m
//  filtered-images
//
//  Created by Zachary Drossman on 4/15/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISFilterOperation.h"

@implementation FISFilterOperation

- (void)main {
    UIImage *filtered = [self.imageToFilter imageWithFilter:self.filterType];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if (self.filterBlock) {
            self.filterBlock(filtered);
        }
    }];
}

@end
