//
//  FISViewControllerSpec.m
//  filtered-images
//
//  Created by James Campagno on 9/3/15.
//  Copyright 2015 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#import "Expecta.h"
#define EXP_SHORTHAND

#import "FISFilterOperation.h"
#import "FISViewController.h"

SpecBegin(FISViewController)

describe(@"FISViewController", ^{
    
    __block UIImage *unfilteredImage;
    __block UIImage *vignetteFilteredImage;
    __block UIImage *sepiaFilteredImage;
    __block UIImage *colorInvertFilteredImage;
    
    
    beforeEach(^{
        
        unfilteredImage = [UIImage imageNamed:@"Mickey.jpg"];
        vignetteFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeVignette];
        sepiaFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeSepia];
        colorInvertFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeVignette];
    });
    
    describe(@"applyFilterToImageUsingFilterType:", ^{
        it(@"Shold apply the filter which is passed into this method to the Mickey.jpg (representing the background image of the view) image and then set the self.imageView property to equal this filtered image.", ^{
            
            [FISViewController ]
            
            
            
        });
        
//        - (void)applyFilterToImageUsingFilterType:(UIImageFilterType)type {
//            UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
//            
//            NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
//            
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//            
//            [operationQueue addOperationWithBlock:^{
//                UIImage *filtered = [nonFiltered imageWithFilter:type];
//                
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    [MBProgressHUD hideHUDForView:self.view animated:YES];
//                    self.imageView.image = filtered;
//                }];
//            }];
//        }
//        
//        - (IBAction)vignetterTapped:(id)sender {
//            [self applyFilterToImageUsingFilterType:UIImageFilterTypeVignette];
//        }
//        
//        - (IBAction)sepiaTapped:(id)sender {
//            [self applyFilterToImageUsingFilterType:UIImageFilterTypeSepia];
//        }
//        
//        - (IBAction)invertedTapped:(id)sender {
//            [self applyFilterToImageUsingFilterType:UIImageFilterTypeColorInvert];
//        }
        
        
        
        
        
    });
    
    
    
   
});

SpecEnd
