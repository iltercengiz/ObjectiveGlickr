//
//  PersonRouter.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonRouter : NSObject

+ (void)fetchPersonWithNSID:(NSString *)nsid success:(void (^)(PersonResponse *response))success failure:(void (^)(NSError *error))failure;

@end
