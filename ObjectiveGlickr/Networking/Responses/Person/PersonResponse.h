//
//  PersonResponse.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "FlickrAPIResponse.h"
#import "Person.h"

@interface PersonResponse : FlickrAPIResponse

@property (nonatomic) Person *person;

@end
