//
//  MovieAPIManager.h
//  Flix
//
//  Created by Ria Vora on 7/1/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieAPIManager : NSObject

@property (nonatomic, strong) NSURLSession *session;
- (void)fetchNowPlaying:(void(^)(NSMutableArray *movies, NSError *error))completion;
- (void)fetchPopular:(void(^)(NSMutableArray *movies, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
