//
//  MovieCell.m
//  Flix
//
//  Created by Ria Vora on 6/24/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(Movie *)movie {
    _movie = movie;

    self.titleLabel.text = movie.title;
    self.descriptionLabel.text = movie.overview;

    self.posterView.image = nil;
    if (movie.posterURL != nil) {
        [self.posterView setImageWithURL:movie.posterURL];
        
    }
}

@end
