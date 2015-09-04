//
//  FISTestHelper.h
//  filtered-images
//
//  Created by James Campagno on 9/4/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISFilterOperation.h"
#import "UIImage+Filters.h"

@interface FISTestHelper : NSObject

+ (BOOL)isImage:(UIImage *)image1 equalToImage:(UIImage *)image2;
+ (void)useFISFilterOperationToFilterImageUsingType:(UIImageFilterType)type
                                          withBlock:(void (^)(UIImage *filteredImage))block;

@end
