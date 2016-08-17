//
//  PhotoTableViewCell.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "PhotoTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
@interface PhotoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation PhotoTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.photoImageView.image = nil;
    [self.activityIndicator startAnimating];
}

- (void)configureWithPhoto:(Photo *)photo {
    if (photo.URL) {
        [self.photoImageView setImageWithURLRequest:[NSURLRequest requestWithURL:photo.URL] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.photoImageView.image = image;
            } completion:^(BOOL finished) {}];
            [self.activityIndicator stopAnimating];
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            [self.activityIndicator stopAnimating];
        }];
    } else {
        [self.activityIndicator stopAnimating];
    }
}

@end
