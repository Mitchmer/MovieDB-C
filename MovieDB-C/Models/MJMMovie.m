//
//  MJMMovie.m
//  MovieDB-C
//
//  Created by Mitch Merrell on 8/23/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import "MJMMovie.h"

static NSString const *titleKey = @"title";
static NSString const *ratingKey = @"vote_average";
static NSString const *movieDescriptionKey = @"overview";
static NSString const *imageURLKey = @"poster_path";

@implementation MJMMovie

- (instancetype)initWithMovieTitle:(NSString *)title rating:(NSNumber *)rating movieDescription:(NSString *)movieDescription imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self)
    {
        _title = title;
        _rating = rating;
        _movieDescription = movieDescription;
        _imageURL = imageURL;
    }
    return self;
}

@end

@implementation MJMMovie (JSONConvertable)

- (MJMMovie *)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSNumber *rating = dictionary[ratingKey];
    NSString *movieDescription = dictionary[movieDescriptionKey];
    NSString *imageURL = dictionary[imageURLKey];
    
    return [self initWithMovieTitle:title rating:rating movieDescription:movieDescription imageURL:imageURL];
}

@end
