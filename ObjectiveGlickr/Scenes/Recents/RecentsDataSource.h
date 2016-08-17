//
//  RecentsDataSource.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentsDataSource : NSObject

@property (nonatomic, readonly) NSMutableArray<Photo *> *photos;
@property (nonatomic, readonly) BOOL hasNext;

- (void)firstBatch:(void (^)(NSArray<Photo *> *photos, BOOL hasNext))completion;
- (void)nextBatch:(void (^)(NSArray<Photo *> *photos, BOOL hasNext, NSRange range))completion;

@end
