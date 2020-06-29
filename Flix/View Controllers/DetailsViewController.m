//
//  DetailsViewController.m
//  Flix
//
//  Created by Ria Vora on 6/24/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h";
#import "TrailerViewController.h";
#import <UIKit/UIKit.h>;


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *trailerButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    [self setTrailerButton];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
      
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
      
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    [self.backdropView setImageWithURL:backdropURL];
    
    [self.titleLabel setText:self.movie[@"title"]];
    [self.descriptionsLabel setText:self.movie[@"overview"]];
    
    [self.titleLabel sizeToFit];
    [self.descriptionsLabel sizeToFit];
}

- (void)setTrailerButton {
    self.trailerButton.layer.cornerRadius = 8;
    self.trailerButton.layer.backgroundColor = UIColor.grayColor.CGColor;
    
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    TrailerViewController *trailerViewController = [segue destinationViewController];

    trailerViewController.movie = self.movie;
}

@end
