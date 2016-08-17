//
//  RecentPhotosRouter.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentPhotosRouter : NSObject

+ (void)fetchRecentPhotos:(NSNumber *)page success:(void (^)(PhotosResponse *response))success failure:(void (^)(NSError *error))failure;

@end
