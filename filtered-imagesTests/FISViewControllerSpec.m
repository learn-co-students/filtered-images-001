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
    __block FISFilterOperation *filterOperation;
    __block NSOperationQueue *operationQueue;
    __block BOOL isSepiaFilterAppliedToImage;
    __block BOOL isInvertColorFilterAppliedToImage;
    __block BOOL isVignetteFilterAppliedToImage;
    
    
    beforeAll(^{
        FISAppDelegate *myDelegate = (FISAppDelegate *)[UIApplication sharedApplication].delegate;
        currentVC = (FISViewController *)myDelegate.window.rootViewController;
        imageViewOfVC = [currentVC valueForKey:@"imageView"];
        filterOperation = [[FISFilterOperation alloc] init];
        operationQueue = [[NSOperationQueue alloc] init];
        
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
            //These tests apply to the basic portion of the lab.
            
            [tester tapViewWithAccessibilityLabel:@"Sepia Button"];
            isSepiaFilterAppliedToImage = [FISTestHelper isImage:sepiaFilteredImage
                                                    equalToImage:imageViewOfVC.image];
            
            expect(isSepiaFilterAppliedToImage).to.equal(YES);
            
        
            [tester tapViewWithAccessibilityLabel:@"Invert Color Button"];
            isInvertColorFilterAppliedToImage = [FISTestHelper isImage:colorInvertFilteredImage
                                                          equalToImage:imageViewOfVC.image];
            
            expect(isInvertColorFilterAppliedToImage).to.equal(YES);
            
            
            [tester tapViewWithAccessibilityLabel:@"Vignette Button"];
            isVignetteFilterAppliedToImage = [FISTestHelper isImage:vignetteFilteredImage
                                                       equalToImage:imageViewOfVC.image];
            
            expect(isVignetteFilterAppliedToImage).to.equal(YES);
            
            
            
            //These tests apply to the advanced portion of the lab.  Uncomment to run these tests against the code you wrote.
            __block UIImage *sepiaImage;
            [FISTestHelper useFISFilterOperationToFilterImageUsingType:UIImageFilterTypeSepia
                                                             withBlock:^(UIImage *filteredImage) {
                                                                    sepiaImage = filteredImage;
                                                                }];
            
            [tester tapViewWithAccessibilityLabel:@"Sepia Button"];
            
            BOOL isSepiaFilteredAppliedThroughFISFilterOperation = [FISTestHelper isImage:sepiaImage
                                                                             equalToImage:sepiaFilteredImage];
            isSepiaFilterAppliedToImage = [FISTestHelper isImage:sepiaFilteredImage
                                                    equalToImage:imageViewOfVC.image];
            
            expect(isSepiaFilteredAppliedThroughFISFilterOperation).to.equal(YES);
            expect(isSepiaFilterAppliedToImage).to.equal(YES);
            
            
            __block UIImage *colerInvertImage;
            [FISTestHelper useFISFilterOperationToFilterImageUsingType:UIImageFilterTypeColorInvert
                                                             withBlock:^(UIImage *filteredImage) {
                                                                    colerInvertImage = filteredImage;
                                                                }];
            
            [tester tapViewWithAccessibilityLabel:@"Invert Color Button"];
            
            BOOL isColorInvertFilteredAppliedThroughFISFilterOperation = [FISTestHelper isImage:colerInvertImage
                                                                                   equalToImage:colorInvertFilteredImage];
            isInvertColorFilterAppliedToImage = [FISTestHelper isImage:colorInvertFilteredImage
                                                          equalToImage:imageViewOfVC.image];
            
            expect(isColorInvertFilteredAppliedThroughFISFilterOperation).to.equal(YES);
            expect(isInvertColorFilterAppliedToImage).to.equal(YES);
            
            
            __block UIImage *vignetteImage;
            [FISTestHelper useFISFilterOperationToFilterImageUsingType:UIImageFilterTypeVignette
                                                             withBlock:^(UIImage *filteredImage) {
                                                                    vignetteImage = filteredImage;
                                                                }];
            
            [tester tapViewWithAccessibilityLabel:@"Vignette Button"];
            
            BOOL isVignetteFilteredAppliedThroughFISFilterOperation = [FISTestHelper isImage:vignetteImage
                                                                                equalToImage:vignetteFilteredImage];
            isVignetteFilterAppliedToImage = [FISTestHelper isImage:vignetteFilteredImage
                                                       equalToImage:imageViewOfVC.image];
            
            expect(isVignetteFilteredAppliedThroughFISFilterOperation).to.equal(YES);
            expect(isVignetteFilterAppliedToImage).to.equal(YES);
        });
    });
});

SpecEnd
