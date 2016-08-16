//
//  PhotosResponse.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "FlickrAPIResponse.h"
#import "PagedPhotos.h"

@interface PhotosResponse : FlickrAPIResponse

@property (nonatomic) PagedPhotos *photos;

@end
