//
//  Movie.h
//  Flix
//
//  Created by Ria Vora on 7/1/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSURL *posterURL;
@property (nonatomic, strong) NSURL *backdropURL;
@property (nonatomic, strong) NSString *idStr;



- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSMutableArray *)moviesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
