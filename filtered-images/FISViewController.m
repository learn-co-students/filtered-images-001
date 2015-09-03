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
    
    /* Part of the Advanced Portion of the Lab
     self.filterQueue = [[NSOperationQueue alloc] init];
     */
}

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

- (IBAction)vignetterTapped:(id)sender {
    NSLog(@"Vignette is tapped! <------------------------");
    
    [self applyFilterToImageUsingFilterType:UIImageFilterTypeVignette];
}

- (IBAction)sepiaTapped:(id)sender {
    NSLog(@"Sepia is tapped! <------------------------");

    [self applyFilterToImageUsingFilterType:UIImageFilterTypeSepia];
}

- (IBAction)invertedTapped:(id)sender {
    NSLog(@"Inverted is tapped! <------------------------");

    [self applyFilterToImageUsingFilterType:UIImageFilterTypeColorInvert];
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

/* Part of the Advanced Portion of the Lab
 - (IBAction)filterTapped:(UIButton *)sender {
 
 FISFilterOperation *filterOp = [[FISFilterOperation alloc] init];
 filterOp.imageToFilter = [UIImage imageNamed:@"Mickey.jpg"];
 filterOp.filterBlock = ^(UIImage *filteredImage) {
 [MBProgressHUD hideHUDForView:self.view animated:YES];
 self.imageView.image = filteredImage;
 };
 
 if ([sender.titleLabel.text isEqualToString:@"Sepia"]) {
 filterOp.filterType = UIImageFilterTypeSepia;
 }
 else if ([sender.titleLabel.text isEqualToString:@"Invert Color"]) {
 filterOp.filterType = UIImageFilterTypeColorInvert;
 }
 else if ([sender.titleLabel.text isEqualToString:@"Vignette"]) {
 filterOp.filterType = UIImageFilterTypeVignette;
 }
 
 [self.filterQueue addOperation:filterOp];
 
 [MBProgressHUD showHUDAddedTo:self.view animated:YES];
 
 }
 */

@end
