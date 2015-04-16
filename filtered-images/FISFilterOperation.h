//
//  FISFilterOperation.h
//  filtered-images
//
//  Created by Zachary Drossman on 4/15/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+Filters.h"

typedef void (^FilterBlock)(UIImage *filteredImage);

@interface FISFilterOperation : NSOperation

@property (strong, nonatomic) UIImage *imageToFilter;
@property (nonatomic) UIImageFilterType filterType;
@property (strong, nonatomic) FilterBlock filterBlock;

@end
