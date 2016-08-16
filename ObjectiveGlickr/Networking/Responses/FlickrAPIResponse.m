//
//  FlickrAPIResponse.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "FlickrAPIResponse.h"

@implementation FlickrAPIResponse

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    [mapping addAttributesFromDictionary:@{NSStringFromSelector(@selector(stat)): @"stat"}];
    return mapping;
}

@end
