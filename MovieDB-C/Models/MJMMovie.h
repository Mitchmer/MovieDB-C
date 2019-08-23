//
//  MJMMovie.h
//  MovieDB-C
//
//  Created by Mitch Merrell on 8/23/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJMMovie : NSObject

@property (readonly, nonatomic, copy) NSString *title;
@property (readonly, nonatomic) NSNumber *rating;
@property (readonly, nonatomic, copy) NSString *movieDescription;
@property (readonly, nonatomic, copy, nullable) NSString *imageURL;

- (instancetype) initWithMovieTitle:(NSString *)title rating:(NSNumber *)rating movieDescription:(NSString *)movieDescription imageURL:(NSString *)imageURL;

@end

@interface MJMMovie (JSONConvertable)

- (MJMMovie *) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
