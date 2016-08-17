//
//  UserTableViewCell.m
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "UserTableViewCell.h"

@interface UserTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation UserTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.userImageView.image = nil;
    self.userNameLabel.text = nil;
}

- (void)configureWithUserName:(NSString *)userName {
    self.userNameLabel.text = userName;
}

@end
