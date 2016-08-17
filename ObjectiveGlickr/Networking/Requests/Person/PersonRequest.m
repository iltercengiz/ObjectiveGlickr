//
//  PersonRequest.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "PersonRequest.h"

@implementation PersonRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.method = @"flickr.people.getInfo";
        self.nsid = @"";
    }
    return self;
}

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [super mapping];
    [mapping addAttributesFromDictionary:@{
        NSStringFromSelector(@selector(nsid)): @"user_id"
    }];
    return mapping;
}

@end
