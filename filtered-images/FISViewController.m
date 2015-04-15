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


@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSOperationQueue *filterQueue;

- (IBAction)vignetterTapped:(id)sender;

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

- (IBAction)vignetterTapped:(UIButton *)sender {

    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];

    __block UIImage *filtered;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.filterQueue addOperationWithBlock:^{
        filtered = [nonFiltered imageWithFilter:UIImageFilterTypeVignette];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = filtered;
            [MBProgressHUD hideHUDForView:self.view animated:YES];

        }];
    }];
}


- (IBAction)invertColorTapped:(UIButton *)sender {
    
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    
    __block UIImage *filtered;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    [self.filterQueue addOperationWithBlock:^{
        filtered = [nonFiltered imageWithFilter:UIImageFilterTypeColorInvert];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = filtered;
            [MBProgressHUD hideHUDForView:self.view animated:YES];

        }];
    }];
    
    
}


- (IBAction)sepiaTapped:(UIButton *)sender {
    
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    
    __block UIImage *filtered;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    [self.filterQueue addOperationWithBlock:^{

        filtered = [nonFiltered imageWithFilter:UIImageFilterTypeSepia];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = filtered;
            [MBProgressHUD hideHUDForView:self.view animated:YES];

        }];
    }];
    
    
}

@end
