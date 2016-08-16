//
//  PagedPhotosResponse.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "PagedPhotos.h"

@implementation PagedPhotos

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    [mapping addAttributesFromDictionary:@{
        NSStringFromSelector(@selector(page)): @"page",
        NSStringFromSelector(@selector(pages)): @"pages",
        NSStringFromSelector(@selector(perPage)): @"perpage"
    }];
    [mapping addAttribute:[[FEMAttribute alloc] initWithProperty:NSStringFromSelector(@selector(total)) keyPath:@"total" map:^id _Nullable(id  _Nonnull value) {
        if ([value isKindOfClass:[NSNumber class]]) {
            return value;
        } else if ([value isKindOfClass:[NSString class]]) {
            return @([(NSString *)value integerValue]);
        }
        return nil;
    } reverseMap:^id _Nullable(id  _Nonnull value) {
        return value;
    }]];
    [mapping addToManyRelationshipMapping:[Photo mapping] forProperty:NSStringFromSelector(@selector(photos)) keyPath:@"photo"];
    return mapping;
}

@end
