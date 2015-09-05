//
//  FISViewControllerSpec.m
//  filtered-images
//
//  Created by James Campagno on 9/4/15.
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
    });
    
    
    describe(@"vignetterTapped:", ^{
        
        it(@"should apply the Vignette filter to the imageView property.", ^{
            //This lab requires that you filter the imageView property on a background thread utilizing NSOperationQueue.  This test doesn't test for that.  Follow up with an instructor/view the solution to see if you're utilizing NSOperationQueue correctly.
            
            vignetteFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeVignette];
            
            [tester tapViewWithAccessibilityLabel:@"Vignette Button"];
            isVignetteFilterAppliedToImage = [FISTestHelper isImage:vignetteFilteredImage
                                                       equalToImage:imageViewOfVC.image];
            
            expect(isVignetteFilterAppliedToImage).to.equal(YES);
            
            
            //These tests apply to the advanced portion of the lab.  Uncomment to run these tests against the code you wrote.
            /*
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
             */
        });
        
    });
    
    
    describe(@"sepiaTapped:", ^{
        
        it(@"should apply the Sepia filter to the imageView property.", ^{
            //This lab requires that you filter the imageView property on a background thread utilizing NSOperationQueue.  This test doesn't test for that.  Follow up with an instructor/view the solution to see if you're utilizing NSOperationQueue correctly.
            
            sepiaFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeSepia];
            
            [tester tapViewWithAccessibilityLabel:@"Sepia Button"];
            isSepiaFilterAppliedToImage = [FISTestHelper isImage:sepiaFilteredImage
                                                    equalToImage:imageViewOfVC.image];
            
            expect(isSepiaFilterAppliedToImage).to.equal(YES);
            
            
            //These tests apply to the advanced portion of the lab.  Uncomment to run these tests against the code you wrote.
            /*
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
             */
        });
        
    });
    
    
    describe(@"invertedTapped:", ^{
        
        it(@"should apply the Color Invert filter to the imageView property.", ^{
            //This lab requires that you filter the imageView property on a background thread utilizing NSOperationQueue.  This test doesn't test for that.  Follow up with an instructor/view the solution to see if you're utilizing NSOperationQueue correctly.
            
            colorInvertFilteredImage = [unfilteredImage imageWithFilter:UIImageFilterTypeColorInvert];
            
            [tester tapViewWithAccessibilityLabel:@"Invert Color Button"];
            isInvertColorFilterAppliedToImage = [FISTestHelper isImage:colorInvertFilteredImage
                                                          equalToImage:imageViewOfVC.image];
            
            expect(isInvertColorFilterAppliedToImage).to.equal(YES);
            
            
            //These tests apply to the advanced portion of the lab.  Uncomment to run these tests against the code you wrote.
            /*
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
             */
        });
    });
});

SpecEnd
