//
//  FISViewControllerSpecTestHelper.m
//  filtered-images
//
//  Created by James Campagno on 9/3/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISViewControllerSpecTestHelper.h"

@implementation FISViewControllerSpecTestHelper

- (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2 {
    NSData *dataOfImage1 = UIImagePNGRepresentation(image1);
    NSData *dataOfImage2 = UIImagePNGRepresentation(image2);
    
    return [dataOfImage1 isEqual:dataOfImage2];
}

@end
