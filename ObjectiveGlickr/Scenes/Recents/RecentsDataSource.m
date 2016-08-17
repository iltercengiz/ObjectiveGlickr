//
//  RecentsDataSource.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "RecentsDataSource.h"
#import "RecentPhotosRouter.h"

@interface RecentsDataSource ()

@property (nonatomic, readwrite) NSMutableArray<Photo *> *photos;
@property (nonatomic, readwrite) BOOL hasNext;
@property (nonatomic) NSInteger currentPage;

@end

@implementation RecentsDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        self.photos = [NSMutableArray array];
        self.hasNext = NO;
        self.currentPage = 0;
    }
    return self;
}

- (void)firstBatch:(void (^)(NSArray<Photo *> *photos, BOOL hasNext))completion {
    [self fetch:0 completion:^(NSArray<Photo *> *photos, BOOL hasNext, NSRange range) {
        if (completion) {
            completion(photos, hasNext);
        }
    }];
}

- (void)nextBatch:(void (^)(NSArray<Photo *> *photos, BOOL hasNext, NSRange range))completion {
    [self fetch:(self.currentPage + 1) completion:completion];
}

- (void)fetch:(NSInteger)page completion:(void (^)(NSArray<Photo *> *photos, BOOL hasNext, NSRange range))completion {
    [RecentPhotosRouter fetchRecentPhotos:@(page) success:^(PhotosResponse *response) {
        NSRange range = NSMakeRange(self.photos.count, (response.photos.photos.count));
        [self.photos addObjectsFromArray:response.photos.photos];
        self.hasNext = (page != response.photos.pages.integerValue);
        self.currentPage = response.photos.page.integerValue;
        if (completion) {
            completion(response.photos.photos, self.hasNext, range);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(@[], NO, NSMakeRange(0, 0));
        }
    }];
}

@end
