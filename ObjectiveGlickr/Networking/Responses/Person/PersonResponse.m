//
//  PersonResponse.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "PersonResponse.h"

@implementation PersonResponse

+ (FEMMapping *)mapping {
    FEMMapping *mapping = [super mapping];
    [mapping addRelationshipMapping:[Person mapping] forProperty:NSStringFromSelector(@selector(person)) keyPath:@"person"];
    return mapping;
}

@end
