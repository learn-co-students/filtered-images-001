//
//  FISViewController.m
//  filtered-images
//
//  Created by Joe Burgess on 7/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "UIImage+Filters.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "FISFilterOperation.h"


@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *sepiaButton;
@property (weak, nonatomic) IBOutlet UIButton *invertColorButton;
@property (weak, nonatomic) IBOutlet UIButton *vignetteButton;
@property (strong, nonatomic) NSOperationQueue *filterQueue;

@end

@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"Mickey.jpg"];
    
    [self setUpTheAccessibilityLabelsForTheTests];
    
    /* Uncomment the following line if you want to run the advanced portion.
     self.filterQueue = [[NSOperationQueue alloc] init];
     */
}

#pragma mark - Action Methods

- (IBAction)vignetterTapped:(id)sender {
    //Comment out the next line if you're looking to run the advanced portion.
    [self applyFilterToImageUsingFilterType:UIImageFilterTypeVignette];
    
    
    /*Uncomment the following three lines if you want to run the advanced portion.
    FISFilterOperation *filterOp = [self createFilterOperationFromFilterType:UIImageFilterTypeVignette];
    [self.filterQueue addOperation:filterOp];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     */
}

- (IBAction)sepiaTapped:(id)sender {
    //Comment out the next line if you're looking to run the advanced portion.
    [self applyFilterToImageUsingFilterType:UIImageFilterTypeSepia];
    
    
    /*Uncomment the following three lines if you want to run the advanced portion.
    FISFilterOperation *filterOp = [self createFilterOperationFromFilterType:UIImageFilterTypeSepia];
    [self.filterQueue addOperation:filterOp];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     */
}

- (IBAction)invertedTapped:(id)sender {
    //Comment out the next line if you're looking to run the advanced portion.
    [self applyFilterToImageUsingFilterType:UIImageFilterTypeColorInvert];
    
    
    /*Uncomment the following three lines if you want to run the advanced portion.
     FISFilterOperation *filterOp = [self createFilterOperationFromFilterType:UIImageFilterTypeColorInvert];
     [self.filterQueue addOperation:filterOp];
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     */
}


#pragma mark - Helper Methods

- (void)applyFilterToImageUsingFilterType:(UIImageFilterType)type {
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [operationQueue addOperationWithBlock:^{
        UIImage *filtered = [nonFiltered imageWithFilter:type];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.imageView.image = filtered;
        }];
    }];
}

- (void)setUpTheAccessibilityLabelsForTheTests {
    [self setAccessibilityLabelAndIdentifierOfObject:self.imageView
                                                  to:@"Main Image"];
    [self setAccessibilityLabelAndIdentifierOfObject:self.sepiaButton
                                                  to:@"Sepia Button"];
    [self setAccessibilityLabelAndIdentifierOfObject:self.invertColorButton
                                                  to:@"Invert Color Button"];
    [self setAccessibilityLabelAndIdentifierOfObject:self.vignetteButton
                                                  to:@"Vignette Button"];
}

- (void)setAccessibilityLabelAndIdentifierOfObject:(id)object
                                                to:(NSString *)name {
    [object setAccessibilityIdentifier:name];
    [object setAccessibilityLabel:name];
}

- (FISFilterOperation *)createFilterOperationFromFilterType:(UIImageFilterType)type {
    FISFilterOperation *filterOp = [[FISFilterOperation alloc] init];
    filterOp.imageToFilter = [UIImage imageNamed:@"Mickey.jpg"];
    filterOp.filterBlock = ^(UIImage *filteredImage) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.imageView.image = filteredImage;
    };
    filterOp.filterType = type;
    
    return filterOp;
}

@end