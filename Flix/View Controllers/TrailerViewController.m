//
//  TrailerViewController.m
//  Flix
//
//  Created by Ria Vora on 6/26/20.
//  Copyright © 2020 Ria Vora. All rights reserved.
//

#import "TrailerViewController.h"
#import "WebKit/WebKit.h";

@interface TrailerViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *trailerWebView;



@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchVideo];
}

- (void)fetchVideo {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US", self.movie.idStr];
    NSURL *url = [NSURL URLWithString: urlString];;
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
               [self networkAlert];
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
                NSArray *video = dataDictionary[@"results"];
               
               NSURL *urlVideo = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.youtube.com/watch?v=%@", video[0][@"key"]]];
               
               NSURLRequest *request = [NSURLRequest requestWithURL:urlVideo
                   cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
               timeoutInterval:10.0];
               
               [self.trailerWebView loadRequest:request];
           }
        
               
       }];
    [task resume];
}

- (void)networkAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Uh Oh! Network Error!"
           message:@"We can't find your movies! It seems like there's an issue with your network."
    preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"I don't care :(" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                                                      }];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:^{
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
