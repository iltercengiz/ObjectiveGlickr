//
//  FlickrAPIResponse.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrAPIResponse : NSObject

@property (nonatomic) NSString *stat;

+ (FEMMapping *)mapping;

@end
