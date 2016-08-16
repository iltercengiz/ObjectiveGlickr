//
//  RecentPhotosRequest.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "RecentPhotosRequest.h"

@implementation RecentPhotosRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.method = @"flickr.photos.getRecent";
        self.extras = @"owner_name,date_taken,media,url_l";
        self.page = @0;
    }
    return self;
}

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [super mapping];
    [mapping addAttributesFromDictionary:@{
        NSStringFromSelector(@selector(extras)): @"extras",
        NSStringFromSelector(@selector(page)): @"page"
    }];
    return mapping;
}

@end
