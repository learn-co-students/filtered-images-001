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

#import "KIF.h"
#import "FISAppDelegate.h"
#import "FISFilterOperation.h"
#import "FISViewController.h"
#import "FISTestHelper.h"

SpecBegin(FISViewController)

describe(@"FISViewController", ^{
    __block UIImage *unfilteredImage;
    __block UIImage *vignetteFilteredImage;
    __block UIImage *sepiaFilteredImage;
    __block UIImage *colorInvertFilteredImage;
    __block UIImageView *imageViewOfVC;
    __block FISViewController *currentVC;
    
    
    beforeAll(^{
        FISAppDelegate *myDelegate = (FISAppDelegate *)[UIApplication sharedApplication].delegate;
        currentVC = (FISViewController *)myDelegate.window.rootViewController;
        imageViewOfVC = [currentVC valueForKey:@"imageView"];
        
        [tester waitForViewWithAccessibilityLabel:@"Main Image"];
        [tester waitForViewWithAccessibilityLabel:@"Sepia Button"];
        [tester waitForViewWithAccessibilityLabel:@"Invert Color Button"];
        [tester waitForViewWithAccessibilityLabel:@"Vignette Button"];
    });
    
    
    beforeEach(^{
        unfilteredImage = [UIImage imageNamed:@"Mickey.jpg"];
        vignetteFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeVignette];
        sepiaFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeSepia];
        colorInvertFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeColorInvert];
    });
    
    describe(@"applyFilterToImageUsingFilterType:", ^{
        
        it(@"Shold apply the filter which is passed into this method to the Mickey.jpg (representing the background image of the view) image and then set the self.imageView property to equal this filtered image.  This happens when the appropiate button is tapped (Sepia, Invert color, or vignette button)", ^{
            
            
            
            
            [tester tapViewWithAccessibilityLabel:@"Sepia Button"];
            //            [tester waitForTimeInterval:1];
            
            BOOL isSepiaFilterAppliedToImage = [FISTestHelper image:sepiaFilteredImage
                                                          isEqualTo:imageViewOfVC.image];
            
            expect(isSepiaFilterAppliedToImage).to.equal(YES);
            
            
            [tester tapViewWithAccessibilityLabel:@"Invert Color Button"];
            //            [tester waitForTimeInterval:1];
            
            BOOL isInvertColorFilterAppliedToImage = [FISTestHelper image:colorInvertFilteredImage
                                                                isEqualTo:imageViewOfVC.image];
            
            expect(isInvertColorFilterAppliedToImage).to.equal(YES);
            
            
            [tester tapViewWithAccessibilityLabel:@"Vignette Button"];
            //            [tester waitForTimeInterval:1];
            
            BOOL isVignetteFilterAppliedToImage = [FISTestHelper image:vignetteFilteredImage
                                                             isEqualTo:imageViewOfVC.image];
            
            expect(isVignetteFilterAppliedToImage).to.equal(YES);
            
            imageViewOfVC.image = unfilteredImage;
            
            
            
            
            //            NSRecursiveLock *theLock = [[NSRecursiveLock alloc] init];
            //            [theLock lock];
            
            
            //            NSLock *theLock = [[NSLock alloc] init];
            //
            //            [theLock lock];
            
            NSLog(@"before dispatch async");
            dispatch_async(dispatch_get_main_queue(), ^{
                                [tester tapViewWithAccessibilityLabel:@"Invert Color Button"];

                NSLog(@"inside dispatch async block main thread from main thread");
            });
            NSLog(@"after dispatch async");
            
#define ensureInMainThread(); if (!NSThread.isMainThread) { [self performSelectorOnMainThread:_cmd withObject:nil waitUntilDone:NO];    return; }
            
            ensureInMainThread();
            
            
            [tester tapViewWithAccessibilityLabel:@"Sepia Button"];

            
            dispatch_async( dispatch_get_main_queue(), ^{

                NSLog(@"==================================GETTING CALLED!!!!!!!!!!!!!!!!!!!!!!!!");
                
                
            });
            
            
            
            
            
            //            [tester waitForTimeInterval:1];
            
            BOOL sepiaOnLock = [FISTestHelper image:sepiaFilteredImage
                                          isEqualTo:imageViewOfVC.image];
            
            
            expect(sepiaOnLock).to.equal(YES);
            
            
            //            [theLock unlock];
            
            
            
            //            [theLock unlock];
            
            
            
            //            [theLock lock];
            
            
            
            
            
            
            
            
            
            
            
            
            
            //                [theLock unlock];
            
            
            
            
            
            
            
            
            
            
            
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
