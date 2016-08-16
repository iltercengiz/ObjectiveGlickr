//
//  FlickrAPIRequest.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "FlickrAPIRequest.h"
#import "FlickrAPIClientDefines.h"

@interface FlickrAPIRequest ()

@property (nonatomic) NSString *format;
@property (nonatomic) NSString *noJSONCallback;
@property (nonatomic) NSString *apiKey;

@end

@implementation FlickrAPIRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.method = @"";
        self.format = @"json";
        self.noJSONCallback = @"1";
        self.apiKey = kFlickrAPIKey;
    }
    return self;
}

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    [mapping addAttributesFromDictionary:@{
        NSStringFromSelector(@selector(method)): @"method",
        NSStringFromSelector(@selector(format)): @"format",
        NSStringFromSelector(@selector(noJSONCallback)): @"nojsoncallback",
        NSStringFromSelector(@selector(apiKey)): @"api_key"
    }];
    return mapping;
}

@end
