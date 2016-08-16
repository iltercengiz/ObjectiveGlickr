//
//  RecentPhotosRequest.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "FlickrAPIRequest.h"

@interface RecentPhotosRequest : FlickrAPIRequest

/**
 Values that are requested from the API to be returned on any media object. Defaults to owner name, date taken, media type, and large image url
 */
@property (nonatomic) NSString *extras;

/**
 Pagination page to fetch
 */
@property (nonatomic) NSNumber *page;

@end
