//
//  MJMMovieController.h
//  MovieDB-C
//
//  Created by Mitch Merrell on 8/23/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJMMovie.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJMMovieController : NSObject

+ (void) fetchMoviesWithTitle:(NSString *)searchTerm completion:(void (^)(NSArray<MJMMovie *> *))completion;
+ (void) fetchImageForMovie:(MJMMovie *)movie completion:(void (^)(UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
