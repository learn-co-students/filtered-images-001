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
@property (strong, nonatomic) NSOperationQueue *filterQueue;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.filterQueue = [[NSOperationQueue alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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

@end
