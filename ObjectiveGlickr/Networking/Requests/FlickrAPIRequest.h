//
//  FlickrAPIRequest.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrAPIRequest : NSObject

/**
 Intended to be set by the subclasses. Automatically included in parameters generated from any subclass.
 */
@property (nonatomic) NSString *method;

/**
 Subclasses must override and add any additional parameters they have introduced.
 */
+ (FEMMapping *)mapping;

@end
