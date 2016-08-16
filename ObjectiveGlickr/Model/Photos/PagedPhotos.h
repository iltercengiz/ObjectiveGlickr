//
//  PagedPhotosResponse.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 16/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FastEasyMapping/FastEasyMapping.h>
#import "Photo.h"

@interface PagedPhotos : NSObject

@property (nonatomic) NSNumber *page;
@property (nonatomic) NSNumber *pages;
@property (nonatomic) NSNumber *perPage;
@property (nonatomic) NSNumber *total;
@property (nonatomic) NSArray<Photo *> *photos;

+ (FEMMapping *)mapping;

@end
