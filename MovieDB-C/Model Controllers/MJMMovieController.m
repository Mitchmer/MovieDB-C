//
//  MJMMovieController.m
//  MovieDB-C
//
//  Created by Mitch Merrell on 8/23/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import "MJMMovieController.h"

static NSString * const movieComponent = @"movie";
static NSString * const apiKey = @"api_key";
static NSString * const apiKeyValue = @"9499367d6658ca88e4c3c64e86dba2ee";
static NSString * const searchKey = @"query";

@implementation MJMMovieController

+ (void)fetchMoviesWithTitle:(NSString *)searchTerm completion:(void (^)(NSArray<MJMMovie *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:@"https://api.themoviedb.org/3/search"];
    NSURL *baseMovieURL = [baseURL URLByAppendingPathComponent:movieComponent];
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:apiKey value:apiKeyValue];
    NSURLQueryItem *searchQueryItem = [NSURLQueryItem queryItemWithName:searchKey value:searchTerm];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseMovieURL resolvingAgainstBaseURL:true];
    components.queryItems = @[apiKeyQueryItem, searchQueryItem];
    NSURL *finalURL = [components URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@: %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"No data was returned: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        NSArray *resultsArray = topLevelDictionary[@"results"];
        
        NSMutableArray *movies = [[NSMutableArray alloc] init];
        
        for (NSDictionary *movieDict in resultsArray)
        {
            MJMMovie *movie = [[MJMMovie alloc]initWithDictionary:movieDict];
            [movies addObject:movie];
        }
        completion(movies);
    }]resume];
}

+ (void)fetchImageForMovie:(MJMMovie *)movie completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:@"http://image.tmdb.org/t/p/w500"];
    if (movie.imageURL == [NSNull null]) {
        completion(nil);
        return;
    }
    NSURL *imageURL = [baseURL URLByAppendingPathComponent:movie.imageURL];
    NSLog(@"%@", imageURL);
    
    [[[NSURLSession sharedSession]dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@: %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@: No data was returned. %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        return;
    }]resume];
}
@end
