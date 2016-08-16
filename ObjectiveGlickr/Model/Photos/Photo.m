//
//  Photos.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    [mapping addAttributesFromDictionary:@{
        NSStringFromSelector(@selector(identifier)): @"id",
        NSStringFromSelector(@selector(owner)): @"owner",
        NSStringFromSelector(@selector(title)): @"title",
        NSStringFromSelector(@selector(isPublic)): @"ispublic",
        NSStringFromSelector(@selector(ownerName)): @"ownername",
        NSStringFromSelector(@selector(media)): @"media",
        NSStringFromSelector(@selector(height)): @"height_l",
        NSStringFromSelector(@selector(width)): @"width_l",
    }];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [mapping addAttribute:[[FEMAttribute alloc] initWithProperty:NSStringFromSelector(@selector(dateTaken)) keyPath:@"datetaken" map:^id(id value) {
        if ([value isKindOfClass:[NSString class]]) {
            return [formatter dateFromString:value];
        }
        return nil;
    } reverseMap:^id(id value) {
        return [formatter stringFromDate:value];
    }]];
    [mapping addAttribute:[[FEMAttribute alloc] initWithProperty:NSStringFromSelector(@selector(URL)) keyPath:@"url_l" map:^id _Nullable(id  _Nonnull value) {
        return [NSURL URLWithString:(NSString *)value];
    } reverseMap:^id _Nullable(id  _Nonnull value) {
        if ([value isKindOfClass:[NSURL class]]) {
            return ((NSURL *)value).absoluteString;
        }
        return nil;
    }]];
    return mapping;
}

@end
