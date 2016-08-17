//
//  Person.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FastEasyMapping/FastEasyMapping.h>

@interface Person : NSObject

@property (nonatomic) NSString *nsid;
@property (nonatomic) NSString *iconServer;
@property (nonatomic) NSString *iconFarm;
@property (nonatomic) NSURL *buddyIcon;

+ (FEMMapping *)mapping;

@end
