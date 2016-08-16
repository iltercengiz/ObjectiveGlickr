//
//  Photos.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FastEasyMapping/FastEasyMapping.h>

@interface Photo : NSObject

@property (nonatomic) NSString *identifier;
@property (nonatomic) NSString *owner;
@property (nonatomic) NSString *title;
@property (nonatomic) NSNumber *isPublic;
@property (nonatomic) NSDate *dateTaken;
@property (nonatomic) NSString *ownerName;
@property (nonatomic) NSString *media;
@property (nonatomic) NSURL *URL;
@property (nonatomic) NSNumber *height;
@property (nonatomic) NSNumber *width;

+ (FEMMapping *)mapping;

@end
