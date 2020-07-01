//
//  MovieCollectionCell.m
//  Flix
//
//  Created by Ria Vora on 6/25/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import "MovieCollectionCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMovie:(Movie *)movie {
    _movie = movie;


    self.posterView.image = nil;
    if (movie.posterURL != nil) {
        [self.posterView setImageWithURL:movie.posterURL];
        
    }
}

@end
