//
//  UserTableViewCell.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "UserTableViewCell.h"
#import "PersonRouter.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface UserTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation UserTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.userImageView.layer.cornerRadius = CGRectGetWidth(self.userImageView.bounds) / 2.0;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.userImageView.image = [UIImage imageNamed:@"user_placeholder"];
    self.userNameLabel.text = nil;
}

- (void)configureWithUserName:(NSString *)userName nsid:(NSString *)nsid {
    self.userNameLabel.text = userName;
    [PersonRouter fetchPersonWithNSID:nsid success:^(PersonResponse *response) {
        [self.userImageView setImageWithURLRequest:[NSURLRequest requestWithURL:response.person.buddyIcon] placeholderImage:[UIImage imageNamed:@"user_placeholder"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
            self.userImageView.image = image;
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            
        }];
    } failure:^(NSError *error) {
        self.userImageView.image = [UIImage imageNamed:@"user_placeholder"];
    }];
}

@end
