//
//  Person.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    [mapping addAttributesFromDictionary:@{
        NSStringFromSelector(@selector(nsid)): @"nsid",
        NSStringFromSelector(@selector(iconServer)): @"iconserver"
    }];
    [mapping addAttribute:[[FEMAttribute alloc] initWithProperty:NSStringFromSelector(@selector(iconFarm)) keyPath:@"iconfarm" map:^id _Nullable(id  _Nonnull value) {
        if ([value isKindOfClass:[NSNumber class]]) {
            return value;
        } else if ([value isKindOfClass:[NSString class]]) {
            return @([(NSString *)value integerValue]);
        }
        return nil;
    } reverseMap:^id _Nullable(id  _Nonnull value) {
        return value;
    }]];
    return mapping;
}

- (NSURL *)buddyIcon {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/buddyicons/%@.jpg", self.iconFarm, self.iconServer, self.nsid]];
}

@end
