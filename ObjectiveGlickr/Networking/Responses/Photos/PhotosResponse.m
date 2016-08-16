//
//  PhotosResponse.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "PhotosResponse.h"

@implementation PhotosResponse

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [super mapping];
    [mapping addRelationshipMapping:[PagedPhotos mapping] forProperty:NSStringFromSelector(@selector(photos)) keyPath:@"photos"];
    return mapping;
}

@end
