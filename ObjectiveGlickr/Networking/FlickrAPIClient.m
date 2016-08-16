//
//  FlickrAPIClient.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "FlickrAPIClient.h"
#import "FlickrAPIClientDefines.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import <AFNetworking/AFURLRequestSerialization.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import <AFNetworkActivityLogger/AFNetworkActivityLogger.h>

@interface FlickrAPIClient ()

@property (nonatomic) AFHTTPSessionManager *manager;

@end

@implementation FlickrAPIClient

#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static FlickrAPIClient *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        [[AFNetworkActivityLogger sharedLogger] startLogging];
        [[AFNetworkActivityLogger sharedLogger] setLevel:AFLoggerLevelDebug];
    }
    return self;
}

#pragma mark - Getter

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        [self willChangeValueForKey:NSStringFromSelector(@selector(manager))];
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kFlickrAPIBaseURLString]];
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        // Any request serializer customization goes here
        _manager.requestSerializer = requestSerializer;
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        // Any response serializer customization goes here
        _manager.responseSerializer = responseSerializer;
        [self didChangeValueForKey:NSStringFromSelector(@selector(manager))];
    }
    return _manager;
}

#pragma mark - Public methods

- (NSURLSessionDataTask *)request:(FlickrAPIRequest *)request
                          success:(void (^)(NSURLSessionDataTask *task, id response))success
                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSDictionary *parameters = [FEMSerializer serializeObject:request usingMapping:[[request class] mapping]];
    return [self.manager GET:@""
                  parameters:parameters
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                         if (success) {
                             success(task, responseObject);
                         }
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         if (failure) {
                             failure(task, error);
                         }
                     }];
}

@end
