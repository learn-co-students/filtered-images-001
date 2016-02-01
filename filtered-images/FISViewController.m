//
//  FISViewController.m
//  filtered-images
//
//  Created by Joe Burgess on 7/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "UIImage+Filters.h"
#import "MBProgressHUD.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)vignetterTapped:(id)sender;
- (IBAction)sepiaTapped:(id)sender;
- (IBAction)InvertedTapped:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    self.imageView.image = nonFiltered;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vignetterTapped:(id)sender {
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        
        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeVignette];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = filtered;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
    
}

- (IBAction)sepiaTapped:(id)sender {
    
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeSepia];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = filtered;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        
    });
}
- (IBAction)InvertedTapped:(id)sender {
    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeColorInvert];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = filtered;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        });
        
    });
}
@end
