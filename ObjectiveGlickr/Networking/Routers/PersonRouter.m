//
//  PersonRouter.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "PersonRouter.h"

@implementation PersonRouter

+ (void)fetchPersonWithNSID:(NSString *)nsid success:(void (^)(PersonResponse *response))success failure:(void (^)(NSError *error))failure {
    PersonRequest *request = [PersonRequest new];
    request.nsid = nsid;
    [[FlickrAPIClient sharedInstance] request:request success:^(NSURLSessionDataTask *task, id response) {
        PersonResponse *responseObject = [FEMDeserializer objectFromRepresentation:response mapping:[PersonResponse mapping]];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
