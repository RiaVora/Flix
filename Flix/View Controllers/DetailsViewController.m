//
//  DetailsViewController.m
//  Flix
//
//  Created by Ria Vora on 6/24/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h";


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionsLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *tappedCell = sender;
//    NSIndexPath *indexPath = [self.collectionView indexPathForCell:tappedCell];
//    NSDictionary *movie = self.filteredMovies[indexPath.row];
//
//    DetailsViewController *detailsViewController = [segue destinationViewController];
    
//    detailsViewController.movie = movie;
}

@end
