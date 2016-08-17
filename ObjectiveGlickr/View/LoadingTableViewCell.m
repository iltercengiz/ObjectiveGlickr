//
//  LoadingTableViewCell.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "LoadingTableViewCell.h"

@interface LoadingTableViewCell ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation LoadingTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.activityIndicator startAnimating];
}

@end
