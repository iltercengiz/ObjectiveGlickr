//
//  RecentsViewController.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "RecentsViewController.h"
#import "RecentsDataSource.h"
#import "UserTableViewCell.h"
#import "PhotoTableViewCell.h"
#import "LoadingTableViewCell.h"

@interface RecentsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) RecentsDataSource *recentsDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic) NSMutableDictionary<NSIndexPath *, NSNumber *> *cellHeights;

@end

@implementation RecentsViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *cellName = NSStringFromClass([LoadingTableViewCell class]);
    [self.tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
    
    self.recentsDataSource = [RecentsDataSource new];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [refreshControl beginRefreshing];
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    [self refresh:self.refreshControl];
}

#pragma mark - IBAction

- (IBAction)refresh:(id)sender {
    [self.recentsDataSource firstBatch:^(NSArray<Photo *> *photos, BOOL hasNext) {
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}

- (void)fetchNextBatch {
    [self.recentsDataSource nextBatch:^(NSArray<Photo *> *photos, BOOL hasNext, NSRange range) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        if (!hasNext) {
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:photos.count + 1] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
}

#pragma mark - Getters

- (NSMutableDictionary<NSIndexPath *,NSNumber *> *)cellHeights {
    if (!_cellHeights) {
        _cellHeights = [NSMutableDictionary dictionary];
    }
    return _cellHeights;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![self isLoadingSection:indexPath.section]) {
        Photo *photo = self.recentsDataSource.photos[indexPath.section];
        if ([self isUserCell:indexPath.row]) {
            UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserTableViewCell class]) forIndexPath:indexPath];
            [cell configureWithUserName:photo.ownerName];
            return cell;
        } else {
            PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PhotoTableViewCell class]) forIndexPath:indexPath];
            [cell configureWithPhoto:photo];
            return cell;
        }
    } else {
        return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LoadingTableViewCell class]) forIndexPath:indexPath];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numberOfSections = self.recentsDataSource.photos.count;
    if (self.recentsDataSource.hasNext) {
        numberOfSections += 1;
    }
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (![self isLoadingSection:section]) {
        return 2;
    } else if ([self isLoadingSection:section] && self.recentsDataSource.hasNext) {
        return 1;
    }
    return 0;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isLoadingSection:indexPath.section]) {
        return 72.0;
    } else {
        if ([self isUserCell:indexPath.row]) {
            return 56.0;
        } else {
            NSNumber *cellHeight = self.cellHeights[indexPath];
            if (!cellHeight) {
                Photo *photo = self.recentsDataSource.photos[indexPath.section];
                CGFloat height = ceil(CGRectGetWidth(tableView.bounds) * photo.height.floatValue / photo.width.floatValue);
                if (!(height > 0)) {
                    height = kDefaultPhotoCellHeight;
                }
                cellHeight = @(height);
                self.cellHeights[indexPath] = cellHeight;
            }
            return cellHeight.floatValue;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isLoadingSection:indexPath.section]) {
        [self fetchNextBatch];
    }
}

#pragma mark - Private methods

- (BOOL)isUserCell:(NSInteger)row {
    return row == 0;
}

- (BOOL)isLoadingSection:(NSInteger)section {
    return section == self.recentsDataSource.photos.count;
}

@end
