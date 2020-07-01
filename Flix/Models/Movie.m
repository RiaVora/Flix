//
//  Movie.m
//  Flix
//
//  Created by Ria Vora on 7/1/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    self.title = dictionary[@"title"];
    self.overview = dictionary[@"overview"];
    self.idStr = dictionary[@"id"];

    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    
    NSString *posterURLString = dictionary[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    self.posterURL = [NSURL URLWithString:fullPosterURLString];
    
    NSString *backdropURLString = dictionary[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    self.backdropURL = [NSURL URLWithString:fullBackdropURLString];

    return self;
}

+ (NSMutableArray *)moviesWithDictionaries:(NSArray *)dictionaries {
   NSMutableArray *returnDictionaries = [[NSMutableArray alloc] init];
   for (NSDictionary *dictionary in dictionaries) {
       Movie *movie = [[Movie alloc]initWithDictionary:dictionary];

       [returnDictionaries addObject:movie];
   }
    return returnDictionaries;
}

@end
